{ Type =
    { name : Text
    , driver : Text
    , context : Text
    , launch-retries : Optional Natural
    , max-pods : Optional Natural
    , pools : Optional (List (./OpenshiftpodsPools.dhall).Type)
    }
, default =
    { driver = "openshiftpods"
    , context = Text
    , launch-retries = None Natural
    , pools = None (List (./OpenshiftpodsPools.dhall).Type)
    }
}