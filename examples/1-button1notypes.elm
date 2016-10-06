module Main exposing (..)

import Html exposing (Html, button, div, text)
import Html.App as Html
import Html.Events exposing (onClick)


-- TODO : Add type for the function main


main =
    Html.beginnerProgram
        { model = model
        , view = view
        , update = update
        }



-- MODEL
-- TODO : Add type alias for Model
-- TODO : Add type for the function model


model =
    0



-- UPDATE
-- TODO : Add type declaration for Msg
-- TODO : Add type for the function update


update msg model =
    case msg of
        Increment ->
            model + 1

        Decrement ->
            model - 1



-- VIEW
-- TODO : Add type for the function view


view model =
    div []
        [ button [ onClick Decrement ] [ text "-" ]
        , div [] [ text (toString model) ]
        , button [ onClick Increment ] [ text "+" ]
        ]
