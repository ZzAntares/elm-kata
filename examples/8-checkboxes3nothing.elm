import Html exposing (Html, fieldset, input, label, text)
import Html.Attributes exposing (style, type_)
import Html.Events exposing (onClick)


main : Program Never Model Msg
main =
    Html.beginnerProgram
        { model = optOut
        , view = view
        , update = update
        }


-- MODEL
type alias Model =
    { notifications : Bool
    , autoplay : Bool
    , location : Bool
    }

optOut : Model
optOut =
    Model False False False


-- UPDATE
type Msg
    = ToggleNotifications
    | ToggleAutoplay
    | ToggleLocation

update : Msg -> Model -> Model
update msg model =
    case msg of
        ToggleNotifications ->
            { model | notifications = not model.notifications }

        ToggleAutoplay ->
            { model | autoplay = not model.autoplay }

        ToggleLocation ->
            { model | location = not model.location }


-- VIEW
view : Model -> Html Msg
view model =
    fieldset []
        [ checkbox ToggleNotifications "Notifications"
        , checkbox ToggleAutoplay "Autoplay"
        , checkbox ToggleLocation "Location"
        ]


checkbox : Msg -> String -> Html Msg
checkbox msg name =
    label [ style [ ( "padding", "20px" ) ] ]
        [ input [ type_ "checkbox", onClick msg] []
        , text name
        ]
