let Nodepool = env:DHALL_NODEPOOL

let name = "dib-centos-7"

in  { diskimage = Nodepool.DiskImage::{
      , name = "${name}"
      , formats = Some [ "raw" ]
      , username = Some "zuul-worker"
      , elements = Some
        [ "centos-minimal"
        , "nodepool-minimal"
        , "zuul-worker-user"
        , "enforce-sshd-config"
        , "rpm-factory"
        , "ansible"
        , "common-packages"
        , "sf-ci-packages"
        , "scl"
        ]
      }
    , label = Nodepool.Label::{ name = "${name}", min-ready = Some 1 }
    , provider = Nodepool.ProviderDiskImage::{
      , name = "${name}"
      , config-drive = Some True
      }
    }
