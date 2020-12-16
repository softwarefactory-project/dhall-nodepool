{ boot-timeout = None Natural
, cloud-images = None (List ./CloudImage/Type.dhall)
, driver = "gce"
, launch-retries = None Natural
, max-concurrency = None Natural
, rate-limit = None Natural
}
