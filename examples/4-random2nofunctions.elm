module Main exposing (..)

import Html exposing (..)
import Html.App as Html
import Html.Events exposing (..)
import Random


main : Program Never



-- MODEL


type alias Model =
    { dieFace : Int
    }


init : ( Model, Cmd Msg )



-- UPDATE


type Msg
    = Roll
    | NewFace Int


update : Msg -> Model -> ( Model, Cmd Msg )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg



-- VIEW


view : Model -> Html Msg
