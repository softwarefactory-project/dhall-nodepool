{ Type =
    { context : Optional Text
    , driver : Text
    , launch-retries : Optional Natural
    , max-concurrency : Optional Natural
    , name : Text
    , pools : List (./KubernetesPool.dhall).Type
    }
, default =
  { context = None Text
  , driver = "kubernetes"
  , launch-retries = None Natural
  , max-concurrency = None Natural
  }
}
