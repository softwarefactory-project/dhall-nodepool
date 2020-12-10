{ Type =
    { cloud-image : Optional Text
    , ebs-optimized : Optional Bool
    , instance-type : Text
    , key-name : Text
    , name : Text
    , tags : Optional (List { mapKey : Text, mapValue : Text })
    , userdata : Optional Text
    , volume-size : Optional Natural
    , volume-type : Optional Text
    }
, default =
  { cloud-image = None Text
  , ebs-optimized = None Bool
  , tags = None (List { mapKey : Text, mapValue : Text })
  , userdata = None Text
  , volume-size = None Natural
  , volume-type = None Text
  }
}
