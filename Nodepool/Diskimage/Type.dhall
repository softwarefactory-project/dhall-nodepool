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
