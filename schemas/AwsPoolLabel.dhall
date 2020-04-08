{ Type =
    { cloud-image : Optional Text
    , ebs-optimized : Optional Bool
    , instance-type : Optional Text
    , key-name : Optional Text
    , name : Text
    , tags : Optional { mapKey : Text, mapValue : Text }
    , userdata : Optional Text
    , volume-size : Optional Natural
    , volume-type : Optional Text
    }
, default =
    { cloud-image = None Text
    , ebs-optimized = None Bool
    , instance-type = None Text
    , key-name = None Text
    , tags = None { mapKey : Text, mapValue : Text }
    , userdata = None Text
    , volume-size = None Natural
    , volume-type = None Text
    }
}
