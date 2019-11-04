module Playground exposing (main)

import Html


escapeEarth myVelocity mySpeed =
    if myVelocity > 11.186 then
        "Godspeed"

    else if mySpeed == 7.67 then
        "Stay in orbit"

    else
        "Come back"

computeSpeed distance time =
    distance / time


computeTime startTime endTime =
    endTime - startTime

main =
    -- that's ugly
    -- Html.text (escapeEarth 11 (computeSpeed 7.67 (computeTime 2 3)))
    -- that's better
    computeTime 2 3
        |> computeSpeed 7.67
        |> escapeEarth 11
        |> Html.text
    -- or
    Html.text
        <| escapeEarth 11
        <| computeSpeed 7.67
        <| computeTime 2 3

