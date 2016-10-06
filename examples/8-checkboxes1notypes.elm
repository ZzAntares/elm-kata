module Main exposing (..)

import Html exposing (Html, fieldset, input, label, text)
import Html.App as App
import Html.Attributes exposing (style, type')
import Html.Events exposing (onClick)


-- TODO: Add type anotation for function


main =
    App.beginnerProgram { model = optOut, update = update, view = view }



-- MODEL
-- TODO: Add type alias for Model
-- TODO: Add type anotation for function


optOut =
    Model True True True



-- UPDATE
-- TODO: Add type declaration for Msg it must match update function
-- TODO: Add type anotation for function


update msg model =
    case msg of
        ToggleNotifications ->
            { model | notifications = not model.notifications }

        ToggleAutoplay ->
            { model | autoplay = not model.autoplay }

        ToggleLocation ->
            { model | location = not model.location }



-- VIEW
-- TODO: Add type anotation for function


view model =
    fieldset []
        [ checkbox ToggleNotifications "Email Notifications"
        , checkbox ToggleAutoplay "Video Autoplay"
        , checkbox ToggleLocation "Use Location"
        ]



-- TODO: Add type anotation for function


checkbox msg name =
    label
        [ style [ ( "padding", "20px" ) ]
        ]
        [ input [ type' "checkbox", onClick msg ] []
        , text name
        ]
