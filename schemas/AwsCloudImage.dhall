{ Type =
    { connection-port : Optional Natural
    , connection-type : Optional Text
    , image-filters : Optional (List (./AwsCloudImageImageFilter.dhall).Type)
    , image-id : Optional Text
    , name : Optional Text
    , python-path : Optional Text
    , username : Optional Text
    }
, default =
    { connection-port = None Natural
    , connection-type = None Text
    , image-filters = None (List (./AwsCloudImageImageFilter.dhall).Type)
    , image-id = None Text
    , name = None Text
    , python-path = None Text
    , username = None Text
    }
}
