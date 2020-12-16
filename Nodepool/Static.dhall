{ Type =
    { driver : Text
    , max-concurrency : Optional Natural
    , name : Text
    , pools : List (./StaticPool.dhall).Type
    }
, default = { driver = "static", max-concurrency = None Natural }
}
