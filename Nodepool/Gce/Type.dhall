{ boot-timeout : Optional Natural
, cloud-images : Optional (List ./CloudImage/Type.dhall)
, driver : Text
, launch-retries : Optional Natural
, max-concurrency : Optional Natural
, name : Text
, pools : List ./Pool/Type.dhall
, project : Text
, rate-limit : Optional Natural
, region : Text
, zone : Text
}
