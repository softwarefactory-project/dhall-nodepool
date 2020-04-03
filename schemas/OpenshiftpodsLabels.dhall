{- TODO add union for magePullPolicy, can be IfNotPresent, Always or Never. -}
{ Type =
    { name : Text
    , image : Optional Text
    , image-pull : Optional Text
    , cpu : Optional Natural
    , memory : Optional Natural
    , python-path : Optional Text
    }
, default =
    { image = None Text
    , image-pull = None Text
    , cpu = None Natural
    , memory = None Natural
    , python-path = None Text
    }
}
