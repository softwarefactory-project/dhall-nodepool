{ boot-timeout : Optional Natural
, clean-floating-ips : Optional Bool
, cloud : Text
, cloud-images : Optional (List ./CloudImage/Type.dhall)
, diskimages : Optional (List ./Diskimage/Type.dhall)
, driver : Text
, hostname-format : Optional Text
, image-name-format : Optional Text
, launch-retries : Optional Natural
, launch-timeout : Optional Natural
, max-concurrency : Optional Natural
, name : Text
, nodepool-id : Optional Text
, pools : Optional (List ./Pool/Type.dhall)
, port-cleanup-interval : Optional Natural
, post-upload-hook : Optional Text
, rate : Optional Double
, region-name : Optional Text
}
