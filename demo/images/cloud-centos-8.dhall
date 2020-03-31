let Nodepool = env:DHALL_NODEPOOL

let name = "cloud-centos-8"

in  { diskimage = Nodepool.DiskImage::{
      , name = "${name}"
      , python-path = Some "/usr/bin/python3"
      , dib-cmd = Some
          "/usr/bin/dib-virt-customize /etc/nodepool/virt_images/${name}.yaml"
      }
    , label = Nodepool.Label::{ name = "${name}", min-ready = Some 1 }
    , provider = Nodepool.OpenstackDiskImage::{ name = "${name}" }
    }
