{ Type =
    { name : Text, labels : Optional (List (./OpenshiftpodsLabels.dhall).Type) }
, default.labels = None (List (./OpenshiftpodsLabels.dhall).Type)
}
