let Nodepool = ../package.dhall

in  Nodepool.Config::{
    , providers =
      [ Nodepool.Providers.static
          Nodepool.Static::{
          , name = "provider_static"
          , pools =
            [ Nodepool.Static.Pool::{
              , name = "main"
              , nodes =
                [ Nodepool.Static.Pool.Node::{
                  , name = "static.example.com"
                  , labels = [ "mylabel" ]
                  }
                ]
              }
            ]
          }
      ]
    , labels = Some [ Nodepool.Label::{ name = "mylabel" } ]
    , zookeeper-tls = Nodepool.ZookeeperTls::{
      , ca = "my.ca"
      , cert = "my.crt"
      , key = "my.key"
      }
    , zookeeper-servers =
      [ Nodepool.ZookeeperServer::{ host = "zk01.example.com" } ]
    }
