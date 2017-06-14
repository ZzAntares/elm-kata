module Main exposing (..)

import Html exposing (..)
import Html.Events exposing (..)
import Random


-- TODO: add type anotation for function


main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL
-- TODO: add type alias for Model
-- TODO: add type anotation for function


init =
    ( Model 1, Cmd.none )



-- UPDATE
-- TODO: add type declaration for Msg
-- TODO: add type anotation for function


update msg model =
    case msg of
        Roll ->
            ( model, Random.generate NewFace (Random.int 1 6) )

        NewFace newFace ->
            ( Model newFace, Cmd.none )



-- SUBSCRIPTIONS
-- TODO: add type anotation for function


subscriptions model =
    Sub.none



-- VIEW
-- TODO: add type anotation for function


view model =
    div []
        [ h1 [] [ text (toString model.dieFace) ]
        , button [ onClick Roll ] [ text "Roll" ]
        ]
