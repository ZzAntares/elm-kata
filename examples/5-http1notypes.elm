import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Http
import Json.Decode as Json
import Task



main =
  Html.program
    { init = init "cats"
    , view = view
    , update = update
    , subscriptions = subscriptions
    }



-- MODEL


init topic =
  ( Model topic "waiting.gif"
  , getRandomGif topic
  )



-- UPDATE


update msg model =
  case msg of
    MorePlease ->
      (model, getRandomGif model.topic)
    ApiResponded response ->
        case response of
            Ok newUrl ->
                (Model model.topic newUrl, Cmd.none)
            Err error ->
                (model, Cmd.none)

-- VIEW


view model =
  div []
    [ h2 [] [text model.topic]
    , button [ onClick MorePlease ] [ text "More Please!" ]
    , br [] []
    , img [src model.gifUrl] []
    ]



-- SUBSCRIPTIONS


subscriptions model =
  Sub.none



-- HTTP


getRandomGif topic =
  let
    url =
      "https://api.giphy.com/v1/gifs/random?api_key=dc6zaTOxFJmzC&tag=" ++ topic
  in
    Http.send ApiResponded  (Http.get url decodeGifUrl)


decodeGifUrl =
  Json.at ["data", "image_url"] Json.string
