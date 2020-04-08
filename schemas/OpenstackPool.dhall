{ Type =
    { auto-floating-ip : Optional Bool
    , availability-zones : Optional (List Text)
    , host-key-checking : Optional Bool
    , ignore-provider-quota : Optional Bool
    , labels : List (./OpenstackPoolLabel.dhall).Type
    , max-cores : Optional Natural
    , max-ram : Optional Natural
    , max-servers : Optional Natural
    , name : Text
    , networks : Optional (List Text)
    , node-attributes : Optional { mapKey : Text, mapValue : Text }
    , security-groups : Optional (List Text)
    }
, default =
    { auto-floating-ip = None Bool
    , availability-zones = None (List Text)
    , host-key-checking = None Bool
    , ignore-provider-quota = None Bool
    , max-cores = None Natural
    , max-ram = None Natural
    , max-servers = None Natural
    , networks = None (List Text)
    , node-attributes = None { mapKey : Text, mapValue : Text }
    , security-groups = None (List Text)
    }
}
