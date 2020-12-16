{ Type =
    { labels : List (./OpenshiftPoolLabel.dhall).Type
    , max-servers : Optional Natural
    , name : Text
    , node-attributes : Optional (List { mapKey : Text, mapValue : Text })
    }
, default =
  { max-servers = None Natural
  , node-attributes = None (List { mapKey : Text, mapValue : Text })
  }
}
