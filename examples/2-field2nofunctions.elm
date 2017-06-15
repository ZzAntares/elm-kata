module Main exposing (..)

import Html exposing (Html, Attribute, div, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import String


main : Program Never Model Msg
main =
    Html.beginnerProgram
        { update = update
        , view = view
        , model = model
        }


type alias Model =
    { contents : String }


model : Model
model =
    Model ""


type Msg
    = Change String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Change newContent ->
            { model | contents = newContent }


view : Model -> Html Msg
view model =
    div []
        [ input [ placeholder "Text to reverse", onInput Change ] []
        , div [] [ text <| String.reverse model.contents ]
        ]
