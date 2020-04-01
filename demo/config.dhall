let Nodepool = env:DHALL_NODEPOOL

in  Nodepool.Config::{
    , labels = Some ./images-labels.dhall
    , diskimages = Some ./images-diskimages.dhall
    , zookeeper-servers =
      [ Nodepool.ZookeeperServer::{
        , host = "localhost"
        , chroot = Some "/nodepool"
        }
      ]
    }
