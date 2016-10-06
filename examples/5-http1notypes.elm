module Main exposing (..)

import Html exposing (..)
import Html.App as Html
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Http
import Json.Decode as Json
import Task


-- TODO: Add type anotation


main =
    Html.program
        { init = init "cats"
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL
-- TODO: Add type alias for Model


type alias Model =
    { topic : String
    , gifUrl : String
    }



-- TODO: Add type anotation


init topic =
    ( Model topic "waiting.gif"
    , getRandomGif topic
    )



-- UPDATE
-- TODO: Add type declaration for Msg it must match update function
-- TODO: Add type anotation


update msg model =
    case msg of
        MorePlease ->
            ( model, getRandomGif model.topic )

        FetchSucceed newUrl ->
            ( Model model.topic newUrl, Cmd.none )

        FetchFail _ ->
            ( model, Cmd.none )



-- VIEW
-- TODO: Add type anotation


view model =
    div []
        [ h2 [] [ text model.topic ]
        , button [ onClick MorePlease ] [ text "More Please!" ]
        , br [] []
        , img [ src model.gifUrl ] []
        ]



-- SUBSCRIPTIONS
-- TODO: Add type anotation


subscriptions model =
    Sub.none



-- HTTP
-- TODO: Add type anotation


getRandomGif topic =
    let
        url =
            "https://api.giphy.com/v1/gifs/random?api_key=dc6zaTOxFJmzC&tag=" ++ topic
    in
        Task.perform FetchFail FetchSucceed (Http.get decodeGifUrl url)



-- TODO: Add type anotation


decodeGifUrl =
    Json.at [ "data", "image_url" ] Json.string
