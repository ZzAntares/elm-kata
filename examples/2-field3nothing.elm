module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import String


main : Program Never Model Msg
main =
    Html.beginnerProgram
        { model = model
        , update = update
        , view = view
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
        Change newContents ->
            { model | contents = String.reverse newContents }


view : Model -> Html Msg
view model =
    div []
        [ input [ placeholder "Text to reverse", onInput Change ] []
        , h3 [] [ text model.contents ]
        ]
