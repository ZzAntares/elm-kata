module Main exposing (..)

import Html exposing (..)
import Html.Events exposing (..)
import Random


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , update = update
        , init = init
        , subscriptions = subscriptions
        }


type alias Model =
    { dieFace : Int }


init : ( Model, Cmd Msg )
init =
    ( Model 1, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


type Msg
    = Roll
    | NewFace Int


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Roll ->
            ( model, Random.generate NewFace (Random.int 1 6) )

        NewFace newFace ->
            ( { model | dieFace = newFace }, Cmd.none )


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text <| toString <| model.dieFace ]
        , button [ onClick Roll ] [ text "Roll dice" ]
        ]
