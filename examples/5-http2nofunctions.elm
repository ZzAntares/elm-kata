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


type alias Model =
  { topic : String
  , gifUrl : String
  }


init : String -> (Model, Cmd Msg)




-- UPDATE


type Msg
  = MorePlease
  | ApiResponded (Result Http.Error String)


update : Msg -> Model -> (Model, Cmd Msg)


-- VIEW


view : Model -> Html Msg


-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg


-- HTTP


getRandomGif : String -> Cmd Msg


decodeGifUrl : Json.Decoder String

