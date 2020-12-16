{ boot-timeout : Optional Natural
, cloud-images : Optional (List ./CloudImage/Type.dhall)
, driver : Text
, hostname-format : Optional Text
, launch-retries : Optional Natural
, max-concurrency : Optional Natural
, name : Text
, pools : List ./Pool/Type.dhall
, profile-name : Optional Text
, region-name : Text
}
