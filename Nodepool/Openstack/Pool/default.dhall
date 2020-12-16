{ auto-floating-ip = None Bool
, availability-zones = None (List Text)
, host-key-checking = None Bool
, ignore-provider-quota = None Bool
, max-cores = None Natural
, max-ram = None Natural
, max-servers = None Natural
, name = None Text
, networks = None (List Text)
, node-attributes = None (List { mapKey : Text, mapValue : Text })
, security-groups = None (List Text)
}
