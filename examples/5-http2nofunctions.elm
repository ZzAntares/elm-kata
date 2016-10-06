module Main exposing (..)

import Html exposing (..)
import Html.App as Html
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Http
import Json.Decode as Json
import Task


main : Program Never



-- MODEL


type alias Model =
    { topic : String
    , gifUrl : String
    }


init : String -> ( Model, Cmd Msg )



-- UPDATE


type Msg
    = MorePlease
    | FetchSucceed String
    | FetchFail Http.Error


update : Msg -> Model -> ( Model, Cmd Msg )



-- VIEW


view : Model -> Html Msg



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg



-- HTTP


getRandomGif : String -> Cmd Msg


decodeGifUrl : Json.Decoder String
