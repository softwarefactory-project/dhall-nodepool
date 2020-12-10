{ Type =
    { cpu : Optional Natural
    , image : Optional Text
    , image-pull : Optional Text
    , memory : Optional Natural
    , name : Text
    , python-path : Optional Text
    , type : Text
    }
, default =
  { cpu = None Natural
  , image = None Text
  , image-pull = None Text
  , memory = None Natural
  , python-path = None Text
  }
}
