{ Type =
    { config-drive : Optional Bool
    , connection-port : Optional Natural
    , connection-type : Optional Text
    , meta : Optional { mapKey : Text, mapValue : Text }
    , name : Optional Text
    , pause : Optional Bool
    }
, default =
    { config-drive = None Bool
    , connection-port = None Natural
    , connection-type = None Text
    , meta = None { mapKey : Text, mapValue : Text }
    , name = None Text
    , pause = None Bool
    }
}
