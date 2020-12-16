let Diskimage = { Type = ./Type.dhall, default = ./default.dhall }

let addEnvVars =
      \(diskimage : Diskimage.Type) ->
      \(env-vars : List { mapKey : Text, mapValue : Text }) ->
            diskimage
        //  { env-vars =
                merge
                  { None = Some env-vars
                  , Some =
                      \(vars : List { mapKey : Text, mapValue : Text }) ->
                        Some (vars # env-vars)
                  }
                  diskimage.env-vars
            }

let example0 =
        assert
      :     addEnvVars Diskimage::{ name = "test" } (toMap { DEBUG = "1" })
        ===  Diskimage::{
             , name = "test"
             , env-vars = Some (toMap { DEBUG = "1" })
             }

let example1 =
        assert
      :     addEnvVars
              Diskimage::{
              , name = "test"
              , env-vars = Some (toMap { TEST = "value" })
              }
              (toMap { DEBUG = "1" })
        ===  Diskimage::{
             , name = "test"
             , env-vars = Some
               [ { mapKey = "TEST", mapValue = "value" }
               , { mapKey = "DEBUG", mapValue = "1" }
               ]
             }

in  addEnvVars
