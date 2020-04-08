{ Type =
    { boot-timeout : Optional Natural
    , cloud-images : Optional (List (./GceCloudImage.dhall).Type)
    , driver : Text
    , launch-retries : Optional Natural
    , max-concurrency : Optional Natural
    , name : Text
    , pools : List (./GcePool.dhall).Type
    , project : Optional Text
    , rate-limit : Optional Natural
    , region : Optional Text
    , zone : Optional Text
    }
, default =
    { boot-timeout = None Natural
    , cloud-images = None (List (./GceCloudImage.dhall).Type)
    , driver = "gce"
    , launch-retries = None Natural
    , max-concurrency = None Natural
    , project = None Text
    , rate-limit = None Natural
    , region = None Text
    , zone = None Text
    }
}
