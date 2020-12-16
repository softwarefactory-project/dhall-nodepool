{-| A function to add an element to an existing image -}
let Diskimage = { Type = ./Type.dhall, default = ./default.dhall }

let addElement =
      \(diskimage : Diskimage.Type) ->
      \(element : Text) ->
            diskimage
        //  { elements =
                merge
                  { None = Some [ element ]
                  , Some =
                      \(elements : List Text) -> Some (elements # [ element ])
                  }
                  diskimage.elements
            }

let example0 =
        assert
      :     addElement Diskimage::{ name = "test" } "new-element"
        ===  Diskimage::{ name = "test", elements = Some [ "new-element" ] }

let example1 =
        assert
      :     addElement
              Diskimage::{ name = "test", elements = Some [ "element" ] }
              "new-element"
        ===  Diskimage::{
             , name = "test"
             , elements = Some [ "element", "new-element" ]
             }

in  addElement
