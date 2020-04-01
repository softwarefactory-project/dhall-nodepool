{ Type =
    { name : Text
    , labels : List Text
    , host-key-checking : Optional Bool
    , timeout : Optional Natural
    , connection-type : Optional Text
    , connection-port : Optional Natural
    , host-key : Optional Text
    , username : Optional Text
    , python-path : Optional Text
    , max-parallel-jobs : Optional Natural
    }
, default =
    { host-key-checking = None Bool
    , timeout = None Natural
    , connection-type = None Text
    , connection-port = None Natural
    , host-key = None Text
    , username = None Text
    , python-path = None Text
    , max-parallel-jobs = None Natural
    }
}
