{ Type =
    { max-servers : Optional Natural
    , name : Text
    , node-attributes : Optional { mapKey : Text, mapValue : Text }
    , nodes : List (./StaticPoolNode.dhall).Type
    }
, default =
    { max-servers = None Natural
    , node-attributes = None { mapKey : Text, mapValue : Text }
    }
}