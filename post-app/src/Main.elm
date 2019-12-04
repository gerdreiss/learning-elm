module Main exposing (main)

import Browser
import Page.ListPosts as ListPosts
import Route exposing (Route)


type alias Model =
    { route : Route
    , page : Page
    }


type Page
    = NotFoundPage
    | ListPage ListPosts.Model


init : () -> Url -> Nav.Key -> ( Model, Cmd Msg )
init flags url navKey =
    let
        model =
            { route = Route.parseUrl url
            , page = NotFoundPage
            , navKey = navKey
            }
    in
    initCurrentPage ( model, Cmd.none )


main : Program () ListPosts.Model ListPosts.Msg
main =
    Browser.element
        { init = ListPosts.init
        , view = ListPosts.view
        , update = ListPosts.update
        , subscriptions = \_ -> Sub.none
        }
