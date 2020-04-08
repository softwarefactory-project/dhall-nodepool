#!/bin/env python3
# Copyright 2020 Red Hat
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License. You may obtain
# a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations
# under the License.

from sys import argv
from pathlib import Path
from typing import List, Tuple
from os import listdir

try:
    from nodepool.driver import Drivers
    import voluptuous
except ImportError:
    print("ImportError: Install nodepool in a venv first, like so:")
    print("  sudo dnf install -y python3-devel")
    print("  python3 -m venv ~/venv/")
    print("  . ~/venv/bin/activate")
    print("  python3 -m pip install nodepool")
    exit(1)

def SoftCapitalize(name):
    return "".join(map(
        lambda s: str(s)[0].upper() + str(s)[1:],
        str(name).split('-')))


def voluptuous_to_dhall_types(name, schema):
    def convert(name, value):
        prefix = ""
        schemas = []
        if isinstance(value, list):
            value = value[0]
            prefix = "List "

        if value == str:
            vtype = "Text"
        elif value == bool:
            vtype = "Bool"
        elif value == float:
            vtype = "Double"
        elif value == int:
            vtype = "Natural"
        elif value == dict:
            vtype = "{ mapKey : Text, mapValue : Text }"
        elif isinstance(value, dict) or isinstance(value, voluptuous.validators.All):
            sub_name = name
            if name.endswith('s') and prefix == "List ":
                sub_name = name[:-1]
            vtype = "(./" + sub_name + ".dhall).Type"
            if isinstance(value, voluptuous.validators.All):
                value_dict = {}
                for validator in value.validators:
                    if not isinstance(validator, dict):
                        for sub_validator in validator.validators:
                            value_dict.update(sub_validator.schema)
                    else:
                        value_dict.update(validator)
                value = value_dict
            schemas.extend(
                voluptuous_to_dhall_types(sub_name, value))
        elif isinstance(value, voluptuous.validators.Any):
            if value.validators == (str, [str]):
                vtype = "List Text"
            else:
                raise RuntimeError(str(name) + ":unknown Any validator " + str(value))
        elif isinstance(value, voluptuous.validators.Coerce):
            vtype = "Double"
        else:
            import pdb; pdb.set_trace()
            raise RuntimeError(str(name) + ": unknown type " + str(type(value)) + " => " + str(value))
        return ((prefix + "(" + vtype + ")") if prefix else vtype, schemas)

    def schemas(name, schema):
        schemas = []
        dhall = []
        for k, v in schema.items():
            dhall_type, new_schemas = convert(SoftCapitalize(name) + SoftCapitalize(k), v)
            schemas.extend(new_schemas)
            if isinstance(k, voluptuous.validators.Any):
                for k in k.validators:
                    dhall.append((str(k), dhall_type))
            else:
                dhall.append((str(k), dhall_type))
        schemas.append((name, sorted(dhall)))
        return schemas

    return schemas(name, schema)


def dhall_type_to_schemas(dtype):
    dname, dattr = dtype
    def isRequired(attr):
        if dname == "Openstack" and attr == "driver":
            return False
        return dname != "AwsCloudImageImageFilter" and \
            attr in ('name', 'driver', 'pools', 'labels', 'nodes')
    def defaultVal(name, val):
        if name == "driver":
            return ("Some " if dname == "Openstack" else "") + '"' + dname.lower() + '"'
        else:
            return "None ( " + val + " ) "
    defaults = [k + " = " + defaultVal(k, v) for k, v in dattr if not isRequired(k) or k == "driver"]
    return ["schemas/" + dname + ".dhall", "\n".join([
        "{ Type = {",
        " , ".join([k + " : " + ("Optional " if not isRequired(k) else "") + " ( " + v + " ) "
                    for k, v in dattr])
        , "}, default = ", ("{ " + " , ".join(defaults) + " }") if defaults else "{=}" , "}"
    ])]


def write(k, v):
    if len(argv) == 1:
        open(k, "w").write(v)
    else:
        print(k, v)

Drivers.load()
drivers = list(filter(lambda s: s not in ("fake", "test"), Drivers.drivers.keys()))
for driver in drivers:
    schema = Drivers.get(driver).getProviderConfig(dict(name='dhall')).getSchema().schema
    output = list(map(dhall_type_to_schemas, voluptuous_to_dhall_types(driver.capitalize(), schema)))
    for k, v in output:
        write(k, v)
write("./schemas/Providers.dhall", "\n".join([
    "<", " | ".join([driver + " : (./" + driver.capitalize() + ".dhall).Type" for driver in drivers]), ">"
]))
