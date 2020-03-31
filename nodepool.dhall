let DiskImage = ./schemas/DiskImage.dhall

let Label = ./schemas/Label.dhall

let OpenstackCloudImage = ./schemas/Drivers/Openstack/CloudImage.dhall

let OpenstackDiskImage = ./schemas/Drivers/Openstack/DiskImage.dhall

let OpenstackLabel = ./schemas/Drivers/Openstack/Label.dhall

let OpenstackPool = ./schemas/Drivers/Openstack/Pool.dhall

let WebApp = ./schemas/WebApp.dhall

let ZookeeperServer = ./schemas/ZookeeperServer.dhall

let Openstack = ./schemas/Drivers/Openstack.dhall

let OpenshiftPods = ./schemas/Drivers/OpenshiftPods.dhall

let Static = ./schemas/Drivers/Static.dhall

let Provider = ./schemas/Providers.dhall

let NodepoolConfig = ./schemas/NodepoolConfig.dhall

in  NodepoolConfig::{
    , webapp = WebApp::{ port = 8008 }
    , elements-dir = "/path/to/elements"
    , images-dir = "/path/to/images"
    , build-log-dir = "/path/to/build-logs"
    , providers =
      [ Provider.openstack
          Openstack::{
          , name = "vexxhost-nodepool-sf"
          , cloud = Some "vexxhost-nodepool-sf"
          , clean-floating-ips = Some True
          , region-name = Some "RegionOne"
          , boot-timeout = Some 120
          , rate = Some 1
          , hostname-format = Some "node-{node.id}"
          , diskimages = Some
            [ OpenstackDiskImage::{
              , name = "cloud-centos-7"
              , config-drive = Some True
              }
            ]
          , pools = Some
            [ OpenstackPool::{
              , name = "main"
              , max-servers = 25
              , networks = Some [ "public" ]
              , labels = Some
                [ OpenstackLabel::{
                  , name = "cloud-centos-7"
                  , flavor-name = "nodepool-infra"
                  , diskimage = Some "cloud-centos-7"
                  }
                ]
              }
            ]
          }
      , Provider.openshiftpods
          OpenshiftPods::{
          , name = "managed-k1s-provider-k1s01"
          , context = "/k1s-k1s01/managed"
          , max-pods = Some 10
          , pools = Some
            [ (./schemas/Drivers/OpenshiftPods/Pools.dhall)::{
              , name = "main"
              , labels = Some
                  ( [] : List
                           (./schemas/Drivers/OpenshiftPods/Labels.dhall).Type
                  )
              }
            ]
          }
      ]
    , diskimages =
      [ DiskImage::{
        , name = "cloud-centos-8"
        , python-path = Some "/usr/bin/python3"
        , dib-cmd = Some
            "/usr/bin/dib-virt-customize /etc/nodepool/virt_images/cloud-centos-8.yaml"
        }
      , DiskImage::{
        , name = "dib-centos-7"
        , env-vars = Some (toMap { key1 = "value1", key2 = "value2" })
        , elements = Some [ "centos-minimal", "nodepool-minimal" ]
        }
      ]
    , labels =
      [ Label::{ name = "cloud-centos-7-vexxhost", min-ready = Some 1 } ]
    , zookeeper-servers =
      [ ZookeeperServer::{ host = "localhost", chroot = Some "/nodepool" } ]
    }
