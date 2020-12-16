{ labels : List ./Label/Type.dhall
, max-servers : Optional Natural
, name : Text
, node-attributes : Optional (List { mapKey : Text, mapValue : Text })
, use-internal-ip : Optional Bool
}
