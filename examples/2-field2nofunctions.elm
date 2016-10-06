module Main exposing (..)

import Html exposing (Html, Attribute, div, input, text)
import Html.App as Html
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import String


main : Program Never



-- MODEL


type alias Model =
    { content : String
    }


model : Model



-- UPDATE


type Msg
    = Change String


update : Msg -> Model -> Model



-- VIEW


view : Model -> Html Msg
