{ auto-floating-ip : Optional Bool
, availability-zones : Optional (List Text)
, host-key-checking : Optional Bool
, ignore-provider-quota : Optional Bool
, labels : List ./Label/Type.dhall
, max-cores : Optional Natural
, max-ram : Optional Natural
, max-servers : Optional Natural
, name : Optional Text
, networks : Optional (List Text)
, node-attributes : Optional (List { mapKey : Text, mapValue : Text })
, security-groups : Optional (List Text)
}
