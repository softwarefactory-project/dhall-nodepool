{ boot-timeout = None Natural
, cloud-images = None (List ./CloudImage/Type.dhall)
, driver = "aws"
, hostname-format = None Text
, launch-retries = None Natural
, max-concurrency = None Natural
, profile-name = None Text
}
