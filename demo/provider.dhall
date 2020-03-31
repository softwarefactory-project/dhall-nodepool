let Nodepool = env:DHALL_NODEPOOL

let OurImage =
      { diskimage : Nodepool.DiskImage.Type
      , label : Nodepool.Label.Type
      , provider : Nodepool.ProviderDiskImage.Type
      }

let mapImage = https://prelude.dhall-lang.org/List/map OurImage

let provider_name = "vexxhost-nodepool-sf"

in  { name = "${provider_name}"
    , cloud = "${provider_name}"
    , clean-floating-ips = Some True
    , region-name = Some "RegionOne"
    , boot-timeout = Some 120
    , rate = Some 1
    , diskimages = Some
        ( mapImage
            Nodepool.ProviderDiskImage.Type
            (     \(image : OurImage)
              ->  Nodepool.ProviderDiskImage::{
                  , name = image.provider.name
                  , config-drive = image.provider.config-drive
                  }
            )
            ./images.dhall
        )
    , pools =
      [ Nodepool.ProviderPool::{
        , name = "main"
        , max-servers = 25
        , networks = Some [ "public" ]
        , labels = Some
            ( mapImage
                Nodepool.ProviderLabel.Type
                (     \(image : OurImage)
                  ->  Nodepool.ProviderLabel::{
                      , name = image.label.name
                      , flavor-name = "nodepool-infra"
                      , diskimage = Some image.diskimage.name
                      }
                )
                ./images.dhall
            )
        }
      ]
    }
