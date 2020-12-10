{ Type =
    { cpu : Optional Natural
    , image : Text
    , image-pull : Optional Text
    , memory : Optional Natural
    , name : Text
    , python-path : Optional Text
    }
, default =
  { cpu = None Natural
  , image-pull = None Text
  , memory = None Natural
  , python-path = None Text
  }
}
