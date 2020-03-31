{ Type =
    { name : Text
    , diskimage : Optional Text
    , cloud-image : Optional Text
    , flavor-name : Text
    , min-ram : Optional Natural
    , boot-from-volume : Optional Bool
    , host-key-checking : Optional Bool
    , networks : Optional (List Text)
    , key-name : Optional Text
    , console-log : Optional Bool
    , volume-size : Optional Natural
    , instance-properties : Optional (List { mapKey : Text, mapValue : Text })
    , userdata : Optional Text
    }
, default =
    { diskimage = None Text
    , cloud-image = None Text
    , flavor-name = Text
    , min-ram = None Natural
    , boot-from-volume = None Bool
    , host-key-checking = None Bool
    , networks = None (List Text)
    , key-name = None Text
    , console-log = None Bool
    , volume-size = None Natural
    , instance-properties = None (List { mapKey : Text, mapValue : Text })
    , userdata = None Text
    }
}
