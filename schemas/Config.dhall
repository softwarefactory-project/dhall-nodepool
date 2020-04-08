{ Type =
    { build-log-dir : Optional Text
    , build-log-retention : Optional Natural
    , diskimages : Optional (List (./DiskImage.dhall).Type)
    , elements-dir : Optional Text
    , images-dir : Optional Text
    , labels : Optional (List (./Label.dhall).Type)
    , max-hold-age : Optional Natural
    , webapp : Optional (./WebApp.dhall).Type
    , zookeeper-servers : List (./ZookeeperServer.dhall).Type
    , providers : Optional (List ./Providers.dhall)
    }
, default =
    { build-log-retention = None Natural
    , max-hold-age = None Natural
    , build-log-dir = None Text
    , elements-dir = None Text
    , images-dir = None Text
    , diskimages = None (List (./DiskImage.dhall).Type)
    , labels = None (List (./Label.dhall).Type)
    , webapp = None (./WebApp.dhall).Type
    , providers = None (List ./Providers.dhall)
    , zookeeper-servers = [] : List (./ZookeeperServer.dhall).Type
    }
}
