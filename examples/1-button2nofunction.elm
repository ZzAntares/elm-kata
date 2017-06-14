module Main exposing (..)

import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)


main : ProgramNever



-- MODEL


type alias Model =
    Int


model : Model



-- UPDATE


type Msg
    = Increment
    | Decrement


update : Msg -> Model -> Model



-- VIEW


view : Model -> Html Msg
