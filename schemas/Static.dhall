{ Type =
    { name : Text
    , driver : Text
    , pools : Optional (List (./StaticPool.dhall).Type)
    }
, default = { driver = "static", pools = None (List (./StaticPool.dhall).Type) }
}
