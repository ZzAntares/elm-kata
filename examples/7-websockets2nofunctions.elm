module Main exposing (..)

import Html exposing (..)
import Html.App as Html
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import WebSocket


main : Program Never


echoServer : String



-- MODEL


type alias Model =
    { input : String
    , messages : List String
    }


init : ( Model, Cmd Msg )



-- UPDATE


type Msg
    = Input String
    | Send
    | NewMessage String


update : Msg -> Model -> ( Model, Cmd Msg )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg



-- VIEW


view : Model -> Html Msg


viewMessage : String -> Html msg
