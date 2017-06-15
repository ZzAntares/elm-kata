import Html exposing (..)
import Html.Events exposing (onClick)

main : Program Never Model Msg
main =
    Html.beginnerProgram
        { model = model
        , view = view
        , update = update
        }

type Msg
    = Increment
    | Decrement

type alias Model = Int

model : Model
model =
    0  -- Estado inicial del modelo

update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            model + 1
        Decrement ->
            model - 1


view : Model -> Html Msg
view model =
    div []
        -- Incrementar el estado del modelo
        [ button [ onClick Increment ] [ text "+" ]
        , span [] [ model |> toString |> text ]
        -- Decrementar el estado del modelo
        , button [ onClick Decrement ] [ text "-" ]
        ]
