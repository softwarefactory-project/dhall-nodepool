let Nodepool = env:DHALL_NODEPOOL

let List/map = https://prelude.dhall-lang.org/List/map

let OurImage =
      { diskimage : Nodepool.DiskImage.Type
      , label : Nodepool.Label.Type
      , provider : Nodepool.ProviderDiskImage.Type
      }

in  List/map
      OurImage
      Nodepool.DiskImage.Type
      (\(our-image : OurImage) -> our-image.diskimage)
      ./images.dhall
