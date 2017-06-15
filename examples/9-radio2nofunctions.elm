module Main exposing (..)

import Html exposing (Html, Attribute, div, fieldset, input, label, text)
import Html.Attributes exposing (name, style, type_)
import Html.Events exposing (onClick)
import Markdown


main : Program Never



-- MODEL


type alias Model =
    { fontSize : FontSize
    , content : String
    }


type FontSize
    = Small
    | Medium
    | Large


chapter1 : Model


intro : String
intro =
    """

# Anna Karenina

## Chapter 1

Happy families are all alike; every unhappy family is unhappy in its own way.

Everything was in confusion in the Oblonskys’ house. The wife had discovered
that the husband was carrying on an intrigue with a French girl, who had been
a governess in their family, and she had announced to her husband that she
could not go on living in the same house with him...

"""



-- UPDATE


type Msg
    = SwitchTo FontSize


update : Msg -> Model -> Model



-- VIEW


view : Model -> Html Msg


radio : String -> msg -> Html msg


sizeToStyle : FontSize -> Attribute msg
