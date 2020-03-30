let DiskImage = ./types/DiskImage.dhall

let Label = ./types/Label.dhall

let ProviderCloudImage = ./types/ProviderCloudImage.dhall

let ProviderDiskImage = ./types/ProviderDiskImage.dhall

let ProviderLabel = ./types/ProviderLabel.dhall

let ProviderPool = ./types/ProviderPool.dhall

let WebApp = ./types/WebApp.dhall

let ZookeeperServer = ./types/ZookeeperServer.dhall

let Openstack = ./types/Openstack.dhall

let Kubernetes = ./types/Kubernetes.dhall

let Static = ./types/Static.dhall

let Provider = ./types/Provider.dhall

let NodepoolConfig = ./types/NodepoolConfig.dhall

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
            [ ProviderDiskImage::{
              , name = "cloud-centos-7"
              , config-drive = Some True
              }
            ]
          , pools = Some
            [ ProviderPool::{
              , name = "main"
              , max-servers = 25
              , networks = Some [ "public" ]
              , labels = Some
                [ ProviderLabel::{
                  , name = "cloud-centos-7"
                  , flavor-name = "nodepool-infra"
                  , diskimage = Some "cloud-centos-7"
                  }
                ]
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
