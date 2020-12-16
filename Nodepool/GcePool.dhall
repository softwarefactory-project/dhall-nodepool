{ Type =
    { labels : List (./GcePoolLabel.dhall).Type
    , max-servers : Optional Natural
    , name : Text
    , node-attributes : Optional (List { mapKey : Text, mapValue : Text })
    , use-internal-ip : Optional Bool
    }
, default =
  { max-servers = None Natural
  , node-attributes = None (List { mapKey : Text, mapValue : Text })
  , use-internal-ip = None Bool
  }
}
