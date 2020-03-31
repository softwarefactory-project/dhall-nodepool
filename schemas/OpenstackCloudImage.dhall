{ Type =
    { name : Text
    , config-drive : Optional Bool
    , image-id : Optional Text
    , image-name : Optional Text
    , username : Optional Text
    , python-path : Optional Text
    , connection-type : Optional Text
    , connection-port : Optional Natural
    }
, default =
    { config-drive = None Bool
    , image-id = None Text
    , image-name = None Text
    , username = None Text
    , python-path = None Text
    , connection-type = None Text
    , connection-port = None Natural
    }
}
