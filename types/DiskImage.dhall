{ Type =
    { name : Text
    , formats : Optional (List Text)
    , rebuild-age : Optional Natural
    , release : Optional Text
    , build-timeout : Optional Natural
    , elements : Optional (List Text)
    , env-vars : Optional (List { mapKey : Text, mapValue : Text })
    , pause : Optional Bool
    , username : Optional Text
    , python-path : Optional Text
    , dib-cmd : Optional Text
    }
, default =
    { formats = None (List Text)
    , rebuild-age = None Natural
    , release = None Text
    , build-timeout = None Natural
    , elements = None (List Text)
    , env-vars = None (List { mapKey : Text, mapValue : Text })
    , pause = None Bool
    , username = None Text
    , python-path = None Text
    , dib-cmd = None Text
    }
}
