{ Type =
    { labels : List (./GcePoolLabel.dhall).Type
    , max-servers : Optional Natural
    , name : Text
    , node-attributes : Optional { mapKey : Text, mapValue : Text }
    , use-internal-ip : Optional Bool
    }
, default =
    { max-servers = None Natural
    , node-attributes = None { mapKey : Text, mapValue : Text }
    , use-internal-ip = None Bool
    }
}
