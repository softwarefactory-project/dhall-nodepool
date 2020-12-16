{ boot-from-volume : Optional Bool
, cloud-image : Optional Text
, console-log : Optional Bool
, diskimage : Optional Text
, flavor-name : Optional Text
, host-key-checking : Optional Bool
, instance-properties : Optional (List { mapKey : Text, mapValue : Text })
, key-name : Optional Text
, min-ram : Optional Natural
, name : Text
, networks : Optional (List Text)
, userdata : Optional Text
, volume-size : Optional Natural
}
