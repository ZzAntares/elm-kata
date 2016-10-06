module Main exposing (..)

import Html exposing (Html, Attribute, div, input, text)
import Html.App as Html
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import String


-- TODO add function type


main =
    Html.beginnerProgram
        { model = model
        , view = view
        , update = update
        }



-- MODEL
-- TODO add type alias for Model
-- TODO add function type


model =
    Model ""



-- UPDATE
-- TODO add type declaration for Msg
-- TODO add function type


update msg model =
    case msg of
        Change newContent ->
            { model | content = newContent }



-- VIEW
-- TODO add function type


view model =
    div []
        [ input [ placeholder "Text to reverse", onInput Change ] []
        , div [] [ text (String.reverse model.content) ]
        ]
