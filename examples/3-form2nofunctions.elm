module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)


main : Program Never Model Msg
main =
    Html.beginnerProgram
        { model = model
        , view = view
        , update = update
        }



-- MODEL


type alias Model =
    { name : String
    , password : String
    , confirmation : String
    }


model : Model
model =
    Model "" "" ""



-- UPDATE


type Msg
    = Name String
    | Password String
    | Confirmation String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Name name ->
            { model | name = name }

        Password password ->
            { model | password = password }

        Confirmation confirmation ->
            { model | confirmation = confirmation }



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ input [ type_ "text", placeholder "Your name", onInput Name ] []
        , input
            [ type_ "password"
            , placeholder "Password"
            , onInput Password
            ]
            []
        , input
            [ type_ "password"
            , placeholder "Password again"
            , onInput Confirmation
            ]
            []
        , viewValidation model
        ]


viewValidation : Model -> Html Msg
viewValidation model =
    let
        ( color, message ) =
            if model.password == model.confirmation then
                ( "green", "Ok" )
            else
                ( "red", "Passwords don't match" )
    in
        div
            [ style [ ( "color", color ) ] ]
            [ text message ]
