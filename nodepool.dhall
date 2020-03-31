let Nodepool = ./package.dhall

in  Nodepool.Config::{
    , webapp = Some Nodepool.WebApp::{ port = 8008 }
    , elements-dir = Some "/path/to/elements"
    , images-dir = Some "/path/to/images"
    , build-log-dir = Some "/path/to/build-logs"
    , providers = Some
      [ Nodepool.Providers.openstack
          Nodepool.Openstack::{
          , name = "vexxhost-nodepool-sf"
          , cloud = Some "vexxhost-nodepool-sf"
          , clean-floating-ips = Some True
          , region-name = Some "RegionOne"
          , boot-timeout = Some 120
          , rate = Some 1
          , hostname-format = Some "node-{node.id}"
          , diskimages = Some
            [ Nodepool.OpenstackDiskImage::{
              , name = "cloud-centos-7"
              , config-drive = Some True
              }
            ]
          , pools = Some
            [ Nodepool.OpenstackPool::{
              , name = "main"
              , max-servers = 25
              , networks = Some [ "public" ]
              , labels = Some
                [ Nodepool.OpenstackLabel::{
                  , name = "cloud-centos-7"
                  , flavor-name = "nodepool-infra"
                  , diskimage = Some "cloud-centos-7"
                  }
                ]
              }
            ]
          }
      , Nodepool.Providers.openshiftpods
          Nodepool.Openshiftpods::{
          , name = "managed-k1s-provider-k1s01"
          , context = "/k1s-k1s01/managed"
          , max-pods = Some 10
          , pools = Some
            [ Nodepool.OpenshiftpodsPools::{
              , name = "main"
              , labels = Some ([] : List Nodepool.OpenshiftpodsLabels.Type)
              }
            ]
          }
      ]
    , diskimages = Some
      [ Nodepool.DiskImage::{
        , name = "cloud-centos-8"
        , python-path = Some "/usr/bin/python3"
        , dib-cmd = Some
            "/usr/bin/dib-virt-customize /etc/nodepool/virt_images/cloud-centos-8.yaml"
        }
      , Nodepool.DiskImage::{
        , name = "dib-centos-7"
        , env-vars = Some (toMap { key1 = "value1", key2 = "value2" })
        , elements = Some [ "centos-minimal", "nodepool-minimal" ]
        }
      ]
    , labels = Some
      [ Nodepool.Label::{ name = "cloud-centos-7-vexxhost", min-ready = Some 1 }
      ]
    , zookeeper-servers =
      [ Nodepool.ZookeeperServer::{
        , host = "localhost"
        , chroot = Some "/nodepool"
        }
      ]
    }
