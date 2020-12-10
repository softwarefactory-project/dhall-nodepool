{ Type =
    { host-key-checking : Optional Bool
    , labels : List (./AwsPoolLabel.dhall).Type
    , max-servers : Optional Natural
    , name : Text
    , node-attributes : Optional (List { mapKey : Text, mapValue : Text })
    , public-ip-address : Optional Bool
    , security-group-id : Optional Text
    , subnet-id : Optional Text
    }
, default =
  { host-key-checking = None Bool
  , max-servers = None Natural
  , node-attributes = None (List { mapKey : Text, mapValue : Text })
  , public-ip-address = None Bool
  , security-group-id = None Text
  , subnet-id = None Text
  }
}
