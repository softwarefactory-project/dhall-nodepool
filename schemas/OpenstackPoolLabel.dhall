{ Type =
    { boot-from-volume : Optional Bool
    , cloud-image : Optional Text
    , console-log : Optional Bool
    , diskimage : Optional Text
    , flavor-name : Optional Text
    , host-key-checking : Optional Bool
    , instance-properties : Optional (List { mapKey : Text, mapValue : Text })
    , key-name : Optional Text
    , min-ram : Optional Natural
    , name : Text
    , networks : Optional (List Text)
    , userdata : Optional Text
    , volume-size : Optional Natural
    }
, default =
  { boot-from-volume = None Bool
  , cloud-image = None Text
  , console-log = None Bool
  , diskimage = None Text
  , flavor-name = None Text
  , host-key-checking = None Bool
  , instance-properties = None (List { mapKey : Text, mapValue : Text })
  , key-name = None Text
  , min-ram = None Natural
  , networks = None (List Text)
  , userdata = None Text
  , volume-size = None Natural
  }
}
