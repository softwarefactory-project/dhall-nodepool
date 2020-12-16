{ build-log-dir : Optional Text
, build-log-retention : Optional Natural
, diskimages : Optional (List ../Diskimage/Type.dhall)
, elements-dir : Optional Text
, images-dir : Optional Text
, labels : List ../Label/Type.dhall
, max-hold-age : Optional Natural
, providers : List ../Providers.dhall
, webapp : Optional ../Webapp/Type.dhall
, zookeeper-servers : List ../ZookeeperServer/Type.dhall
, zookeeper-tls : ../ZookeeperTls/Type.dhall
}
