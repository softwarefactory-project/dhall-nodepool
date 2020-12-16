{ Type =
    { boot-timeout : Optional Natural
    , clean-floating-ips : Optional Bool
    , cloud : Text
    , cloud-images : Optional (List (./OpenstackCloudImage.dhall).Type)
    , diskimages : Optional (List (./OpenstackDiskimage.dhall).Type)
    , driver : Text
    , hostname-format : Optional Text
    , image-name-format : Optional Text
    , launch-retries : Optional Natural
    , launch-timeout : Optional Natural
    , max-concurrency : Optional Natural
    , name : Text
    , nodepool-id : Optional Text
    , pools : Optional (List (./OpenstackPool.dhall).Type)
    , port-cleanup-interval : Optional Natural
    , post-upload-hook : Optional Text
    , rate : Optional Double
    , region-name : Optional Text
    }
, default =
  { boot-timeout = None Natural
  , clean-floating-ips = None Bool
  , cloud-images = None (List (./OpenstackCloudImage.dhall).Type)
  , diskimages = None (List (./OpenstackDiskimage.dhall).Type)
  , driver = Some "openstack"
  , hostname-format = None Text
  , image-name-format = None Text
  , launch-retries = None Natural
  , launch-timeout = None Natural
  , max-concurrency = None Natural
  , nodepool-id = None Text
  , pools = None (List (./OpenstackPool.dhall).Type)
  , port-cleanup-interval = None Natural
  , post-upload-hook = None Text
  , rate = None Double
  , region-name = None Text
  }
}
