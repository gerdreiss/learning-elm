module RandomNumber exposing (Model)

import Browser
import Html exposing (..)
import Html.Events exposing (onClick)
import Random


type alias Model =
    Int


type Msg
    = GenerateRandomNumber
    | NewRandomNumber Int


initialModel : Model
initialModel =
    0


init : () -> ( Model, Cmd Msg )
init _ =
    ( 0, Cmd.none )


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick GenerateRandomNumber ] [ text "Generate Random Number" ]
        , text (String.fromInt model)
        ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GenerateRandomNumber ->
            ( model, Random.generate NewRandomNumber (Random.int 0 100) )

        NewRandomNumber number ->
            ( number, Cmd.none )


main : Program () Model Msg
main =
    Browser.element
        { init = init -- \flags -> ( initialModel, Cmd.none )
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }
