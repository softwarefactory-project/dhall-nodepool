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
    , diskimages : Optional (List (./OpenstackDiskImage.dhall).Type)
    , cloud-images : Optional (List (./OpenstackCloudImage.dhall).Type)
    , pools : Optional (List (./OpenstackPool.dhall).Type)
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
    , diskimages = None (List (./OpenstackDiskImage.dhall).Type)
    , cloud-images = None (List (./OpenstackCloudImage.dhall).Type)
    , pools = None (List (./OpenstackPool.dhall).Type)
    }
}
