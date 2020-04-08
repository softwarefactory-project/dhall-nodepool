{ Type =
    { cloud-image : Optional Text
    , instance-type : Optional Text
    , name : Text
    , volume-size : Optional Natural
    , volume-type : Optional Text
    }
, default =
    { cloud-image = None Text
    , instance-type = None Text
    , volume-size = None Natural
    , volume-type = None Text
    }
}
