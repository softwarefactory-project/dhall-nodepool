{ boot-timeout = None Natural
, clean-floating-ips = None Bool
, cloud-images = None (List ./CloudImage/Type.dhall)
, diskimages = None (List ./Diskimage/Type.dhall)
, driver = "openstack"
, hostname-format = None Text
, image-name-format = None Text
, launch-retries = None Natural
, launch-timeout = None Natural
, max-concurrency = None Natural
, nodepool-id = None Text
, pools = None (List ./Pool/Type.dhall)
, port-cleanup-interval = None Natural
, post-upload-hook = None Text
, rate = None Double
, region-name = None Text
}
