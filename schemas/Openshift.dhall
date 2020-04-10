{ Type =
    { context : Text
    , driver : Text
    , launch-retries : Optional Natural
    , max-concurrency : Optional Natural
    , max-projects : Optional Natural
    , name : Text
    , pools : List (./OpenshiftPool.dhall).Type
    }
, default =
    { driver = "openshift"
    , launch-retries = None Natural
    , max-concurrency = None Natural
    , max-projects = None Natural
    }
}
