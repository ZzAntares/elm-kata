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
        [ input [ type_ "text", onInput Name, placeholder "Your name" ] []
        , input
            [ type_ "password"
            , onInput Password
            , placeholder "Password"
            ]
            []
        , input
            [ type_ "password"
            , onInput Confirmation
            , placeholder "Password again"
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
                ( "red", "Passwords do not match!" )
    in
        div [ style [ ( "color", color ) ] ]
            [ text message ]
