{ Type =
    { connection-port : Optional Natural
    , connection-type : Optional Text
    , host-key : Optional (List Text)
    , host-key-checking : Optional Bool
    , labels : List Text
    , max-parallel-jobs : Optional Natural
    , name : Text
    , python-path : Optional Text
    , timeout : Optional Natural
    , username : Optional Text
    }
, default =
  { connection-port = None Natural
  , connection-type = None Text
  , host-key = None (List Text)
  , host-key-checking = None Bool
  , max-parallel-jobs = None Natural
  , python-path = None Text
  , timeout = None Natural
  , username = None Text
  }
}
