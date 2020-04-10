{ Type =
    { config-drive : Optional Bool
    , connection-port : Optional Natural
    , connection-type : Optional Text
    , meta : Optional (List { mapKey : Text, mapValue : Text })
    , name : Optional Text
    , pause : Optional Bool
    }
, default =
    { config-drive = None Bool
    , connection-port = None Natural
    , connection-type = None Text
    , meta = None (List { mapKey : Text, mapValue : Text })
    , name = None Text
    , pause = None Bool
    }
}
