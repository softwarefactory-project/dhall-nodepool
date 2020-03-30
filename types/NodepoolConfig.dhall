{ Type =
    { build-log-dir : Text
    , build-log-retention : Natural
    , diskimages : List (./DiskImage.dhall).Type
    , elements-dir : Text
    , images-dir : Text
    , labels : List (./Label.dhall).Type
    , max-hold-age : Natural
    , webapp : (./WebApp.dhall).Type
    , zookeeper-servers : List (./ZookeeperServer.dhall).Type
    , providers : List ./Provider.dhall
    }
, default = { build-log-retention = 7, max-hold-age = 0 }
}
