{- TODO find how to manage driver,

 -}
let TextToTextMap = List { mapKey : Text, mapValue : Text }

let DiskImageRef =
      { Type =
          { name : Text
          , pause : Optional Bool
          , config-drive : Optional Bool
          , meta : Optional TextToTextMap
          , connection-type : Optional Text
          , connection-port : Optional Natural
          }
      , default =
          { pause = None Bool
          , config-drive = None Bool
          , meta = None TextToTextMap
          , connection-type = None Text
          , connection-port = None Natural
          }
      }

let CloudImageRef =
      { Type =
          { name : Text
          , config-drive : Optional Bool
          , image-id : Optional Text
          , image-name : Optional Text
          , username : Optional Text
          , python-path : Optional Text
          , connection-type : Optional Text
          , connection-port : Optional Natural
          }
      , default =
          { config-drive = None Bool
          , image-id = None Text
          , image-name = None Text
          , username = None Text
          , python-path = None Text
          , connection-type = None Text
          , connection-port = None Natural
          }
      }

let PoolLabel =
      { Type =
          { name : Text
          , diskimage : Optional Text
          , cloud-image : Optional Text
          , flavor-name : Text
          , min-ram : Optional Natural
          , boot-from-volume : Optional Bool
          , host-key-checking : Optional Bool
          , networks : Optional (List Text)
          , key-name : Optional Text
          , console-log : Optional Bool
          , volume-size : Optional Natural
          , instance-properties : Optional TextToTextMap
          , userdata : Optional Text
          }
      , default =
          { diskimage = None Text
          , cloud-image = None Text
          , flavor-name = Text
          , min-ram = None Natural
          , boot-from-volume = None Bool
          , host-key-checking = None Bool
          , networks = None (List Text)
          , key-name = None Text
          , console-log = None Bool
          , volume-size = None Natural
          , instance-properties = None TextToTextMap
          , userdata = None Text
          }
      }

let Pool =
      { Type =
          { name : Text
          , node-attributes : Optional TextToTextMap
          , max-cores : Optional Natural
          , max-servers : Natural
          , max-ram : Optional Natural
          , ignore-provider-quota : Optional Bool
          , availability-zones : Optional (List Text)
          , networks : Optional (List Text)
          , security-groups : Optional (List Text)
          , auto-floating-ip : Optional Bool
          , host-key-checking : Optional Bool
          , diskimages : Optional (List DiskImageRef.Type)
          , labels : Optional (List PoolLabel.Type)
          }
      , default =
          { node-attributes = None TextToTextMap
          , max-cores = None Natural
          , max-servers = Natural
          , max-ram = None Natural
          , ignore-provider-quota = None Bool
          , availability-zones = None (List Text)
          , networks = None (List Text)
          , security-groups = None (List Text)
          , auto-floating-ip = None Bool
          , host-key-checking = None Bool
          , diskimages = None (List DiskImageRef.Type)
          , labels = None (List PoolLabel.Type)
          }
      }

let Openstack =
      { Type =
          { name : Text
          , cloud : Optional Text
          , driver : Text
          , max-concurrency : Optional Natural
          , boot-timeout : Optional Natural
          , launch-timeout : Optional Natural
          , nodepool-id : Optional Text
          , launch-retries : Optional Natural
          , region-name : Optional Text
          , hostname-format : Optional Text
          , image-name-format : Optional Text
          , post-upload-hook : Optional Text
          , rate : Optional Natural
          , clean-floating-ips : Optional Bool
          , port-cleanup-interval : Optional Natural
          , diskimages : Optional (List DiskImageRef.Type)
          , cloud-images : Optional (List CloudImageRef.Type)
          , pools : Optional (List Pool.Type)
          }
      , default =
          { cloud = None Text
          , driver = "openstack"
          , max-concurrency = None Natural
          , boot-timeout = None Natural
          , launch-timeout = None Natural
          , nodepool-id = None Text
          , launch-retries = None Natural
          , region-name = None Text
          , hostname-format = None Text
          , image-name-format = None Text
          , post-upload-hook = None Text
          , rate = None Natural
          , clean-floating-ips = None Bool
          , port-cleanup-interval = None Natural
          , diskimages = None (List DiskImageRef.Type)
          , cloud-images = None (List CloudImageRef.Type)
          , pools = None (List Pool.Type)
          }
      }

let Kubernetes = { Type = { name : Text }, default = {=} }

let Static = { Type = { name : Text }, default = {=} }

let Provider =
      < openstack : Openstack.Type
      | kubernetes : Kubernetes.Type
      | static : Static.Type
      >

let DiskImage =
      { Type =
          { name : Text
          , formats : List Text
          , rebuild-age : Optional Natural
          , release : Optional Text
          , build-timeout : Optional Natural
          , elements : Optional (List Text)
          , env-vars : Optional TextToTextMap
          , pause : Optional Bool
          , username : Optional Text
          , python-path : Optional Text
          , dib-cmd : Optional Text
          }
      , default =
          { formats = [ "raw" ]
          , rebuild-age = None Natural
          , release = None Text
          , build-timeout = None Natural
          , elements = None (List Text)
          , env-vars = None TextToTextMap
          , pause = None Bool
          , username = None Text
          , python-path = None Text
          , dib-cmd = None Text
          }
      }

let Label =
      { Type =
          { name : Text
          , max-ready-age : Optional Natural
          , min-ready : Optional Natural
          }
      , default = { max-ready-age = None Natural, min-ready = None Natural }
      }

let WebApp =
      { Type = { port : Natural, listen_address : Text }
      , default = { port = 8005, listen_address = "0.0.0.0" }
      }

let ZookeeperServer =
      { Type = { host : Text, port : Natural, chroot : Optional Text }
      , default = { port = 2181 } ∧ { chroot = None Text }
      }

let NodepoolConfig =
      { Type =
          { build-log-dir : Text
          , build-log-retention : Natural
          , diskimages : List DiskImage.Type
          , elements-dir : Text
          , images-dir : Text
          , labels : List Label.Type
          , max-hold-age : Natural
          , webapp : WebApp.Type
          , zookeeper-servers : List ZookeeperServer.Type
          , providers : List Provider
          }
      , default = { build-log-retention = 7, max-hold-age = 0 }
      }

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
            [ DiskImageRef::{
              , name = "cloud-centos-7"
              , config-drive = Some True
              }
            ]
          , pools = Some
            [ Pool::{
              , name = "main"
              , max-servers = 25
              , networks = Some [ "public" ]
              , labels = Some
                [ PoolLabel::{
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
      [ ZookeeperServer::{ host = "coronavirus", chroot = Some "/nodepool" } ]
    }
