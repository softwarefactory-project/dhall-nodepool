{ Type =
    { config-drive : Optional Bool
    , connection-port : Optional Natural
    , connection-type : Optional Text
    , image-id : Optional Text
    , image-name : Optional Text
    , name : Optional Text
    , python-path : Optional Text
    , username : Optional Text
    }
, default =
  { config-drive = None Bool
  , connection-port = None Natural
  , connection-type = None Text
  , image-id = None Text
  , image-name = None Text
  , name = None Text
  , python-path = None Text
  , username = None Text
  }
}
