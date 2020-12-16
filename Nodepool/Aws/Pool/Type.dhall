{ host-key-checking : Optional Bool
, labels : List ./Label/Type.dhall
, max-servers : Optional Natural
, name : Text
, node-attributes : Optional (List { mapKey : Text, mapValue : Text })
, public-ip-address : Optional Bool
, security-group-id : Optional Text
, subnet-id : Optional Text
}
