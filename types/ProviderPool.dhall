{ Type =
    { name : Text
    , node-attributes : Optional (List { mapKey : Text, mapValue : Text })
    , max-cores : Optional Natural
    , max-servers : Natural
    , max-ram : Optional Natural
    , ignore-provider-quota : Optional Bool
    , availability-zones : Optional (List Text)
    , networks : Optional (List Text)
    , security-groups : Optional (List Text)
    , auto-floating-ip : Optional Bool
    , host-key-checking : Optional Bool
    , diskimages : Optional (List (./ProviderDiskImage.dhall).Type)
    , labels : Optional (List (./ProviderLabel.dhall).Type)
    }
, default =
    { node-attributes = None (List { mapKey : Text, mapValue : Text })
    , max-cores = None Natural
    , max-servers = Natural
    , max-ram = None Natural
    , ignore-provider-quota = None Bool
    , availability-zones = None (List Text)
    , networks = None (List Text)
    , security-groups = None (List Text)
    , auto-floating-ip = None Bool
    , host-key-checking = None Bool
    , diskimages = None (List (./ProviderDiskImage.dhall).Type)
    , labels = None (List (./ProviderLabel.dhall).Type)
    }
}
