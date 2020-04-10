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
from typing import Any, Callable, Dict, List, Optional, Tuple
from os import listdir

try:
    from nodepool.driver import Drivers  # type: ignore
    from nodepool.cmd.config_validator import ConfigValidator  # type: ignore
    import voluptuous  # type: ignore
except ImportError:
    print("ImportError: Install nodepool in a venv first, like so:")
    print("  sudo dnf install -y python3-devel")
    print("  python3 -m venv ~/venv/")
    print("  . ~/venv/bin/activate")
    print("  python3 -m pip install nodepool")
    exit(1)


def dhall_case(name: str) -> str:
    return "".join(map(
        lambda s: str(s)[0].upper() + str(s)[1:],
        str(name).split('-')))


RecordType = Tuple[str, List[Tuple[str, str]]]
def voluptuous_to_dhall_types(name: str, root: bool, schema: Dict[Any, Any]) -> List[RecordType]:
    def dhall_type(name: str, value: Any) -> Tuple[Optional[str], List[RecordType]]:
        prefix = ""
        schemas: List[RecordType] = []
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
        elif value == list:
            print(str(name) + ": skipping empty list")
            return (None, schemas)
        elif isinstance(value, dict) or isinstance(value, voluptuous.validators.All):
            if value == {str: str}:
                return "List { mapKey : Text, mapValue : Text }", []
            sub_name = name
            if name.endswith('s') and prefix == "List ":
                sub_name = name[:-1]
            vtype = "(./" + sub_name + ".dhall).Type"
            # This is for https://opendev.org/zuul/nodepool/src/commit/2779a61a103e4f67104c9adc9f09d24cb1392457/nodepool/driver/openstack/config.py#L397
            if isinstance(value, voluptuous.validators.All):
                value_dict: Dict[Any, Any] = {}
                for validator in value.validators:
                    if not isinstance(validator, dict):
                        for sub_validator in validator.validators:
                            value_dict.update(sub_validator.schema)
                    else:
                        value_dict.update(validator)
                value = value_dict

            schemas.extend(
                voluptuous_to_dhall_types(sub_name, False, value))
        elif isinstance(value, voluptuous.validators.Any):
            if value.validators == (str, [str]):
                # This is to accomodate the as_list filter. In Dhall we always want List.
                vtype = "List Text"
            elif value.validators == (str, int):
                vtype = "< Int : Natural | String : Text >"
            else:
                raise RuntimeError(str(name) + ":unknown Any validator " + str(value))
        elif isinstance(value, voluptuous.validators.Coerce):
            # This is the voluptuous way to check for float
            vtype = "Double"
        else:
            # import pdb; pdb.set_trace()
            raise RuntimeError(str(name) + ": unknown type " + str(type(value)) + " => " + str(value))
        return ((prefix + "(" + vtype + ")") if prefix else vtype, schemas)

    def schemas(name: str, schema: Dict[Any, Any]) -> List[RecordType]:
        schemas = []
        dhall = []
        for k, v in schema.items():
            dtype, new_schemas = dhall_type((dhall_case(name) if not root else "")+ dhall_case(k), v)
            if dtype is None:
                continue
            schemas.extend(new_schemas)
            if isinstance(k, voluptuous.validators.Any):
                for k in k.validators:
                    dhall.append((str(k), dtype))
            else:
                dhall.append((str(k), dtype))
        schemas.append((name, dhall))
        return schemas

    return schemas(name, schema)


def dhall_type_to_schemas(
        isRequired: Callable[[str, str], bool],
        defaultVal: Callable[[str, str, str], str],
        extra_attr: List[RecordType]) -> Callable[[RecordType], Tuple[Path, str]]:
    def func(record: RecordType) -> Tuple[Path, str]:
        record_name, record_attrs = record
        extra = [v for k, v in extra_attr if k == record_name]
        if extra:
            record_attrs += extra[0]
        record_attrs = sorted(record_attrs)
        defaults = [k + " = " + defaultVal(record_name, k, v) for k, v in record_attrs if not isRequired(record_name, k) or k in ("driver", "zookeeper-servers")]
        return (Path("schemas") / (record_name + ".dhall"), "\n".join([
            "{ Type = {",
            " , ".join([k + " : " + ("Optional " if not isRequired(record_name, k) else "") + " ( " + v + " ) "
                        for k, v in record_attrs])
            , "}, default = ", ("{ " + " , ".join(defaults) + " }") if defaults else "{=}" , "}"
        ]))
    return func


def write(k: Path, v: str) -> None:
    if len(argv) == 1:
        k.write_text(v)
    else:
        print(k, v)

# Nodepool workarounds
def isRequired(record_name: str, attr_name: str) -> bool:
    if record_name == "Openstack" and attr_name == "driver":
        return False
    return record_name != "AwsCloudImageImageFilter" and \
        attr_name in ('name', 'host', 'driver', 'pools', 'labels', 'nodes', 'zookeeper-servers', 'providers')

def defaultVal(record_name: str, attr_name: str, attr_type: str) -> str:
    if attr_name == "driver":
        return ("Some " if record_name == "Openstack" else "") + '"' + record_name.lower() + '"'
    elif attr_name == 'zookeeper-servers':
        return "[] : List (./ZookeeperServer.dhall).Type"
    else:
        return "None ( " + attr_type + " ) "

Drivers.load()
drivers = sorted(list(filter(lambda s: s not in ("fake", "test"), Drivers.drivers.keys())))
for num, (name, schema) in enumerate([("Config", ConfigValidator.getSchema().schema)] +
                                     list(map(lambda d: (d.capitalize(), Drivers.get(d).getProviderConfig(dict(name='dhall')).getSchema().schema), drivers
                                     ))):
    for k,v in list(map(
            dhall_type_to_schemas(isRequired, defaultVal, [("Config", [("providers", "List ./Providers.dhall")])]),
            voluptuous_to_dhall_types(name, num == 0, schema))):
        write(k, v)
write(Path("./schemas/Providers.dhall"), "\n".join([
    "<", " | ".join([driver + " : (./" + driver.capitalize() + ".dhall).Type" for driver in drivers]), ">"
]))
