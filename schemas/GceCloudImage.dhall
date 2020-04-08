{ Type =
    { connection-port : Optional Natural
    , connection-type : Optional Text
    , image-id : Optional Text
    , key : Optional Text
    , name : Text
    , python-path : Optional Text
    , username : Optional Text
    }
, default =
    { connection-port = None Natural
    , connection-type = None Text
    , image-id = None Text
    , key = None Text
    , python-path = None Text
    , username = None Text
    }
}
