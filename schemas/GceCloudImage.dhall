{ Type =
    { connection-port : Optional Natural
    , connection-type : Optional Text
    , image-family : Optional Text
    , image-id : Optional Text
    , image-project : Optional Text
    , key : Optional Text
    , name : Optional Text
    , python-path : Optional Text
    , username : Optional Text
    }
, default =
  { connection-port = None Natural
  , connection-type = None Text
  , image-family = None Text
  , image-id = None Text
  , image-project = None Text
  , key = None Text
  , name = None Text
  , python-path = None Text
  , username = None Text
  }
}
