{ Type =
    { auto-floating-ip : Optional Bool
    , availability-zones : Optional (List Text)
    , host-key-checking : Optional Bool
    , ignore-provider-quota : Optional Bool
    , labels : Optional (List (./OpenstackPoolLabel.dhall).Type)
    , max-cores : Optional Natural
    , max-ram : Optional Natural
    , max-servers : Optional Natural
    , name : Optional Text
    , networks : Optional (List Text)
    , node-attributes : Optional (List { mapKey : Text, mapValue : Text })
    , security-groups : Optional (List Text)
    }
, default =
    { auto-floating-ip = None Bool
    , availability-zones = None (List Text)
    , host-key-checking = None Bool
    , ignore-provider-quota = None Bool
    , labels = None (List (./OpenstackPoolLabel.dhall).Type)
    , max-cores = None Natural
    , max-ram = None Natural
    , max-servers = None Natural
    , name = None Text
    , networks = None (List Text)
    , node-attributes = None (List { mapKey : Text, mapValue : Text })
    , security-groups = None (List Text)
    }
}
