let Nodepool = env:DHALL_NODEPOOL

let OurImage =
      { diskimage : Nodepool.DiskImage.Type
      , label : Nodepool.Label.Type
      , provider : Nodepool.OpenstackDiskImage.Type
      }

let mapImage = https://prelude.dhall-lang.org/List/map OurImage

let provider_name = "vexxhost-nodepool-sf"

in  Nodepool.Providers.openstack
      Nodepool.Openstack::{
      , name = "${provider_name}"
      , cloud = Some "${provider_name}"
      , clean-floating-ips = Some True
      , region-name = Some "RegionOne"
      , boot-timeout = Some 120
      , rate = Some 1
      , diskimages = Some
        [ mapImage
            Nodepool.OpenstackDiskImage.Type
            (     \(image : OurImage)
              ->  Nodepool.OpenstackDiskImage::{
                  , name = image.provider.name
                  , config-drive = image.provider.config-drive
                  }
            )
            ./images.dhall
        ]
      , pools = Some
        [ Nodepool.OpenstackPool::{
          , name = "main"
          , max-servers = 25
          , networks = Some [ "public" ]
          , labels =
              Some
                [ mapImage
                    Nodepool.OpenstackLabel.Type
                    (     \(image : OurImage)
                      ->  Nodepool.OpenstackLabel::{
                          , name = image.label.name
                          , flavor-name = "nodepool-infra"
                          , diskimage = Some image.diskimage.name
                          }
                    )
                ]
                ./images.dhall
          }
        ]
      }
