module Main exposing (..)

import Html exposing (Html)
import Html.App as Html
import Svg exposing (..)
import Svg.Attributes exposing (..)
import Time exposing (Time, second)


-- TODO: Add type anotaion for function


main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL
-- TODO: Add type alias for Model
-- TODO: Add type anotaion for function


init =
    ( 0, Cmd.none )



-- UPDATE
-- TODO: Add type declaration for Msg it must match update function
-- TODO: Add type anotaion for function


update msg model =
    case msg of
        Tick newTime ->
            ( newTime, Cmd.none )



-- SUBSCRIPTIONS
-- TODO: Add type anotaion for function


subscriptions model =
    Time.every second Tick



-- VIEW
-- TODO: Add type anotaion for function


view model =
    let
        angle =
            turns (Time.inMinutes model)

        handX =
            toString (50 + 40 * cos angle)

        handY =
            toString (50 + 40 * sin angle)
    in
        svg [ viewBox "0 0 100 100", width "300px" ]
            [ circle [ cx "50", cy "50", r "45", fill "#0B79CE" ] []
            , line [ x1 "50", y1 "50", x2 handX, y2 handY, stroke "#023963" ] []
            ]
