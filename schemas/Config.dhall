{ Type =
    { build-log-dir : Optional Text
    , build-log-retention : Optional Natural
    , diskimages : Optional (List (./Diskimage.dhall).Type)
    , elements-dir : Optional Text
    , images-dir : Optional Text
    , labels : List (./Label.dhall).Type
    , max-hold-age : Optional Natural
    , providers : List ./Providers.dhall
    , webapp : Optional (./Webapp.dhall).Type
    , zookeeper-servers : List (./ZookeeperServer.dhall).Type
    }
, default =
    { build-log-dir = None Text
    , build-log-retention = None Natural
    , diskimages = None (List (./Diskimage.dhall).Type)
    , elements-dir = None Text
    , images-dir = None Text
    , max-hold-age = None Natural
    , webapp = None (./Webapp.dhall).Type
    , zookeeper-servers = [] : List (./ZookeeperServer.dhall).Type
    }
}
