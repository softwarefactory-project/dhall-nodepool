{ boot-from-volume = None Bool
, cloud-image = None Text
, console-log = None Bool
, diskimage = None Text
, flavor-name = None Text
, host-key-checking = None Bool
, instance-properties = None (List { mapKey : Text, mapValue : Text })
, key-name = None Text
, min-ram = None Natural
, networks = None (List Text)
, userdata = None Text
, volume-size = None Natural
}
