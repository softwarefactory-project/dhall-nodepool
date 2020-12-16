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
