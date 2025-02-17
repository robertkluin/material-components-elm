module Demo.Ripple exposing (Model, Msg(..), defaultModel, update, view)

import Demo.CatalogPage exposing (CatalogPage)
import Demo.Helper.ResourceLink as ResourceLink
import Html exposing (Html, text)
import Html.Attributes
import Material.Elevation as Elevation
import Material.Ripple as Ripple exposing (ripple, rippleConfig, unboundedRipple)
import Material.Typography as Typography


type alias Model =
    {}


defaultModel : Model
defaultModel =
    {}


type Msg
    = NoOp


update : Msg -> Model -> Model
update msg model =
    model


view : Model -> CatalogPage Msg
view model =
    { title = "Ripple"
    , prelude = "Ripples are visual representations used to communicate the status of a component or interactive element."
    , resources =
        { materialDesignGuidelines = Just "https://material.io/go/design-states"
        , documentation = Just "https://material.io/components/web/catalog/ripples/"
        , sourceCode = Just "https://github.com/material-components/material-components-web/tree/master/packages/mdc-ripple"
        }
    , hero = [ Html.div demoBox [ ripple rippleConfig, text "Click here!" ] ]
    , content =
        [ Html.h3 [ Typography.subtitle1 ] [ text "Bounded Ripple" ]
        , Html.div demoBox
            [ ripple rippleConfig
            , text "Interact with me!"
            ]
        , Html.h3 [ Typography.subtitle1 ] [ text "Unbounded Ripple" ]
        , Html.div demoIcon
            [ unboundedRipple rippleConfig
            , text "favorite"
            ]
        , Html.h3 [ Typography.subtitle1 ] [ text "Theme Color: Primary" ]
        , Html.div demoBox
            [ ripple { rippleConfig | color = Just Ripple.PrimaryColor }
            , text "Primary"
            ]
        , Html.h3 [ Typography.subtitle1 ] [ text "Theme Color: Secondary" ]
        , Html.div demoBox
            [ ripple { rippleConfig | color = Just Ripple.AccentColor }
            , text "Secondary"
            ]
        ]
    }


demoBox : List (Html.Attribute msg)
demoBox =
    [ Html.Attributes.style "display" "flex"
    , Html.Attributes.style "align-items" "center"
    , Html.Attributes.style "justify-content" "center"
    , Html.Attributes.style "width" "200px"
    , Html.Attributes.style "height" "100px"
    , Html.Attributes.style "padding" "1rem"
    , Html.Attributes.style "cursor" "pointer"
    , Html.Attributes.style "user-select" "none"
    , Html.Attributes.style "background-color" "#fff"
    , Html.Attributes.style "overflow" "hidden"
    , Html.Attributes.style "position" "relative"
    , Elevation.z2
    , Html.Attributes.tabindex 0
    ]


demoIcon : List (Html.Attribute msg)
demoIcon =
    [ Html.Attributes.class "material-icons"
    , Html.Attributes.style "width" "24px"
    , Html.Attributes.style "height" "24px"
    , Html.Attributes.style "padding" "12px"
    , Html.Attributes.style "border-radius" "50%"
    , Html.Attributes.style "position" "relative"
    ]
