module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import WebSocket


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }


echoServer : String
echoServer =
    "ws://echo.websocket.org"



-- MODEL


type alias Model =
    { input : String
    , messages : List String
    }


init : ( Model, Cmd Msg )
init =
    ( Model "" [], Cmd.none )



-- UPDATE


type Msg
    = Input String
    | Send
    | NewMessage String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg { input, messages } =
    case msg of
        Input newInput ->
            ( Model newInput messages, Cmd.none )

        Send ->
            ( Model "" messages, WebSocket.send echoServer input )

        NewMessage message ->
            ( Model input (message :: messages), Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    WebSocket.listen echoServer NewMessage



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ input [ onInput Input, placeholder "Send some ..." ] []
        , button [ onClick Send ] [ text "Send" ]
        , div [] (List.map viewMessage model.messages)
        ]


viewMessage : String -> Html Msg
viewMessage message =
    div [] [ text message ]
