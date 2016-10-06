module Main exposing (..)

import Html exposing (Html, Attribute, div, fieldset, input, label, text)
import Html.App as App
import Html.Attributes exposing (name, style, type')
import Html.Events exposing (onClick)
import Markdown


-- TODO: Add type anotation for function


main =
    App.beginnerProgram { model = chapter1, update = update, view = view }



-- MODEL
-- TODO: Add type alias for Model


type FontSize
    = Small
    | Medium
    | Large



-- TODO: Add type anotation for function


chapter1 =
    Model Medium intro



-- TODO: Add type anotation for function


intro =
    """

# Anna Karenina

## Chapter 1

Happy families are all alike; every unhappy family is unhappy in its own way.

Everything was in confusion in the Oblonskys’ house. The wife had discovered
that the husband was carrying on an intrigue with a French girl, who had been
a governess in their family, and she had announced to her husband that she
could not go on living in the same house with him...

"""



-- UPDATE
-- TODO: Add type declaration for Msg it must match update function


update : Msg -> Model -> Model
update msg model =
    case msg of
        SwitchTo newFontSize ->
            { model | fontSize = newFontSize }



-- VIEW
-- TODO: Add type anotation for function


view model =
    div []
        [ fieldset []
            [ radio "Small" (SwitchTo Small)
            , radio "Medium" (SwitchTo Medium)
            , radio "Large" (SwitchTo Large)
            ]
        , Markdown.toHtml [ sizeToStyle model.fontSize ] model.content
        ]



-- TODO: Add type anotation for function


radio value msg =
    label
        [ style [ ( "padding", "20px" ) ]
        ]
        [ input [ type' "radio", name "font-size", onClick msg ] []
        , text value
        ]



-- TODO: Add type anotation for function


sizeToStyle fontSize =
    let
        size =
            case fontSize of
                Small ->
                    "0.8em"

                Medium ->
                    "1em"

                Large ->
                    "1.2em"
    in
        style [ ( "font-size", size ) ]
