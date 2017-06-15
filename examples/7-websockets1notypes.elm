module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import WebSocket


-- TODO: Add type anotation for function


main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- TODO: Add type anotation for function


echoServer =
    "ws://echo.websocket.org"



-- MODEL
-- TODO: Add type alias for Model
-- TODO: Add type anotation for function


init =
    ( Model "" [], Cmd.none )



-- UPDATE
-- TODO: Add type declaration for Msg it must match update function
-- TODO: Add type anotation for function


update msg { input, messages } =
    case msg of
        Input newInput ->
            ( Model newInput messages, Cmd.none )

        Send ->
            ( Model "" messages, WebSocket.send echoServer input )

        NewMessage str ->
            ( Model input (str :: messages), Cmd.none )



-- SUBSCRIPTIONS
-- TODO: Add type anotation for function


subscriptions model =
    WebSocket.listen echoServer NewMessage



-- VIEW
-- TODO: Add type anotation for function


view model =
    div []
        [ input [ onInput Input ] []
        , button [ onClick Send ] [ text "Send" ]
        , div [] (List.map viewMessage (List.reverse model.messages))
        ]



-- TODO: Add type anotation for function


viewMessage msg =
    div [] [ text msg ]
