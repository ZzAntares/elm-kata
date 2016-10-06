module Main exposing (..)

import Html exposing (..)
import Html.App as Html
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)


-- TODO: Add type anotation for function


main =
    Html.beginnerProgram
        { model = model
        , view = view
        , update = update
        }



-- MODEL
-- TODO: add type alias for Model
-- TODO: Add type anotation for function


model =
    Model "" "" ""



-- UPDATE
-- TODO: add type declaration for Msg
-- TODO: Add type anotation for function


update msg model =
    case msg of
        Name name ->
            { model | name = name }

        Password password ->
            { model | password = password }

        PasswordAgain password ->
            { model | passwordAgain = password }



-- VIEW
-- TODO: Add type anotation for function


view model =
    div []
        [ input [ type' "text", placeholder "Name", onInput Name ] []
        , input [ type' "password", placeholder "Password", onInput Password ] []
        , input [ type' "password", placeholder "Re-enter Password", onInput PasswordAgain ] []
        , viewValidation model
        ]



-- TODO: Add type anotation for function


viewValidation model =
    let
        ( color, message ) =
            if model.password == model.passwordAgain then
                ( "green", "OK" )
            else
                ( "red", "Passwords do not match!" )
    in
        div [ style [ ( "color", color ) ] ] [ text message ]
