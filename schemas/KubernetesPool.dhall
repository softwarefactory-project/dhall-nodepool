{ Type =
    { labels : List (./KubernetesPoolLabel.dhall).Type
    , max-servers : Optional Natural
    , name : Text
    , node-attributes : Optional { mapKey : Text, mapValue : Text }
    }
, default =
    { max-servers = None Natural
    , node-attributes = None { mapKey : Text, mapValue : Text }
    }
}
