{ Type =
    { context : Text
    , driver : Text
    , launch-retries : Optional Natural
    , max-concurrency : Optional Natural
    , max-pods : Optional Natural
    , name : Text
    , pools : List (./OpenshiftpodsPool.dhall).Type
    }
, default =
  { driver = "openshiftpods"
  , launch-retries = None Natural
  , max-concurrency = None Natural
  , max-pods = None Natural
  }
}
