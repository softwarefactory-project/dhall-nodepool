{ Type =
    { name : Text
    , pause : Optional Bool
    , config-drive : Optional Bool
    , meta : Optional (List { mapKey : Text, mapValue : Text })
    , connection-type : Optional Text
    , connection-port : Optional Natural
    }
, default =
    { pause = None Bool
    , config-drive = None Bool
    , meta = None (List { mapKey : Text, mapValue : Text })
    , connection-type = None Text
    , connection-port = None Natural
    }
}
