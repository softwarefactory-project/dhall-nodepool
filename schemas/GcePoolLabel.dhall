{ Type =
    { cloud-image : Text
    , instance-type : Text
    , name : Text
    , volume-size : Optional Natural
    , volume-type : Optional Text
    }
, default = { volume-size = None Natural, volume-type = None Text }
}
