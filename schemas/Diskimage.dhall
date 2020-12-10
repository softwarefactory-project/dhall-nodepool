{ Type =
    { abstract : Optional Bool
    , build-timeout : Optional Natural
    , dib-cmd : Optional Text
    , elements : Optional (List Text)
    , env-vars : Optional (List { mapKey : Text, mapValue : Text })
    , formats : Optional (List Text)
    , name : Text
    , parent : Optional Text
    , pause : Optional Bool
    , python-path : Optional Text
    , rebuild-age : Optional Natural
    , release : Optional < Int : Natural | String : Text >
    , username : Optional Text
    }
, default =
  { abstract = None Bool
  , build-timeout = None Natural
  , dib-cmd = None Text
  , elements = None (List Text)
  , env-vars = None (List { mapKey : Text, mapValue : Text })
  , formats = None (List Text)
  , parent = None Text
  , pause = None Bool
  , python-path = None Text
  , rebuild-age = None Natural
  , release = None < Int : Natural | String : Text >
  , username = None Text
  }
}
