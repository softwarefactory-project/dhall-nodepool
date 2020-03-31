{ Type =
    { name : Text
    , max-ready-age : Optional Natural
    , min-ready : Optional Natural
    }
, default = { max-ready-age = None Natural, min-ready = None Natural }
}
