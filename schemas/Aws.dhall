{ Type =
    { boot-timeout : Optional Natural
    , cloud-images : Optional (List (./AwsCloudImage.dhall).Type)
    , driver : Text
    , hostname-format : Optional Text
    , launch-retries : Optional Natural
    , max-concurrency : Optional Natural
    , name : Text
    , pools : List (./AwsPool.dhall).Type
    , profile-name : Optional Text
    , region-name : Optional Text
    }
, default =
    { boot-timeout = None Natural
    , cloud-images = None (List (./AwsCloudImage.dhall).Type)
    , driver = "aws"
    , hostname-format = None Text
    , launch-retries = None Natural
    , max-concurrency = None Natural
    , profile-name = None Text
    , region-name = None Text
    }
}
