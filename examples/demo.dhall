let Nodepool =
        env:DHALL_NODEPOOL
      ? https://softwarefactory-project.io/cgit/software-factory/dhall-nodepool/plain/package.dhall

in  Nodepool.Config::{
    , providers = Some
      [ Nodepool.Providers.static
          Nodepool.Static::{
          , name = "provider_static"
          , pools = Some
            [ Nodepool.StaticPool::{
              , name = "main"
              , nodes =
                [ Nodepool.StaticPoolNode::{
                  , name = "static.example.com"
                  , labels = [ "mylabel" ]
                  }
                ]
              }
            ]
          }
      ]
    , zookeeper-servers =
      [ Nodepool.ZookeeperServer::{ host = "zk01.example.com" } ]
    }
