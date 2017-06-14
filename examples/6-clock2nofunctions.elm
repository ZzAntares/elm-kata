module Main exposing (..)

import Html exposing (Html)
import Svg exposing (..)
import Svg.Attributes exposing (..)
import Time exposing (Time, second)


main : Program Never



-- MODEL


type alias Model =
    Time


init : ( Model, Cmd Msg )



-- UPDATE


type Msg
    = Tick Time


update : Msg -> Model -> ( Model, Cmd Msg )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg



-- VIEW


view : Model -> Html Msg
