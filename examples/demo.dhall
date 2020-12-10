let Nodepool = ../package.dhall

in  Nodepool.Config::{
    , providers =
      [ Nodepool.Providers.static
          Nodepool.Static::{
          , name = "provider_static"
          , pools =
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
    , labels = [ Nodepool.Label::{ name = "mylabel" } ]
    , zookeeper-tls = Nodepool.ZookeeperTls::{
      , ca = "my.ca"
      , cert = "my.crt"
      , key = "my.key"
      }
    , zookeeper-servers =
      [ Nodepool.ZookeeperServer::{ host = "zk01.example.com" } ]
    }
