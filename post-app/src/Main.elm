module Main exposing (main)

import Browser
import Browser.Navigation as Nav
import Page.ListPosts as ListPosts
import Route exposing (Route)
import Url exposing (Url)


type alias Model =
    { route : Route
    , page : Page
    , navKey : Nav.Key
    }


type Page
    = NotFoundPage
    | ListPage ListPosts.Model


type Msg
    = ListPageMsg ListPosts.Msg


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
