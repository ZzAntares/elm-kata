module Main exposing (..)

import Html exposing (Html, fieldset, input, label, text)
import Html.Attributes exposing (style, type_)
import Html.Events exposing (onClick)


main : Program Never



-- MODEL


type alias Model =
    { notifications : Bool
    , autoplay : Bool
    , location : Bool
    }


optOut : Model



-- UPDATE


type Msg
    = ToggleNotifications
    | ToggleAutoplay
    | ToggleLocation


update : Msg -> Model -> Model



-- VIEW


view : Model -> Html Msg


checkbox : msg -> String -> Html msg
