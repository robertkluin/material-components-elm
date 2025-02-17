module Demo.Checkbox exposing (Model, Msg(..), defaultModel, update, view)

import Demo.CatalogPage as Page exposing (CatalogPage)
import Demo.Helper.ResourceLink as ResourceLink
import Dict exposing (Dict)
import Html exposing (Html, text)
import Html.Attributes
import Material.Checkbox as Checkbox exposing (CheckboxState, checkbox, checkboxConfig)
import Material.Typography as Typography
import Platform.Cmd exposing (Cmd, none)


type alias Model =
    { checkboxes : Dict String CheckboxState
    }


defaultModel : Model
defaultModel =
    { checkboxes =
        Dict.fromList
            [ ( "checked-hero-checkbox", Checkbox.Checked )
            , ( "unchecked-hero-checkbox", Checkbox.Unchecked )
            , ( "unchecked-checkbox", Checkbox.Unchecked )
            , ( "checked-checkbox", Checkbox.Checked )
            ]
    }


type Msg
    = Click String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Click index ->
            let
                checkboxes =
                    Dict.update index
                        (\state ->
                            if state == Just Checkbox.Checked then
                                Just Checkbox.Unchecked

                            else
                                Just Checkbox.Checked
                        )
                        model.checkboxes
            in
            { model | checkboxes = checkboxes }


view : Model -> CatalogPage Msg
view model =
    { title = "Checkbox"
    , prelude = "Checkboxes allow the user to select multiple options from a set."
    , resources =
        { materialDesignGuidelines = Just "https://material.io/go/design-checkboxes"
        , documentation = Just "https://material.io/components/web/catalog/input-controls/checkboxes/"
        , sourceCode = Just "https://github.com/material-components/material-components-web/tree/master/packages/mdc-checkbox"
        }
    , hero = heroCheckboxes model
    , content =
        [ Html.h3 [ Typography.subtitle1 ] [ text "Unchecked" ]
        , controlledCheckbox "unchecked-checkbox" model []
        , Html.h3 [ Typography.subtitle1 ] [ text "Indeterminate" ]
        , controlledCheckbox "indeterminate-checkbox" model []
        , Html.h3 [ Typography.subtitle1 ] [ text "Checked" ]
        , controlledCheckbox "checked-checkbox" model []
        ]
    }


heroCheckboxes : Model -> List (Html Msg)
heroCheckboxes model =
    [ controlledCheckbox "checked-hero-checkbox" model heroMargin
    , controlledCheckbox "unchecked-hero-checkbox" model heroMargin
    ]


controlledCheckbox : String -> Model -> List (Html.Attribute Msg) -> Html Msg
controlledCheckbox index model additionalAttributes =
    let
        state =
            Maybe.withDefault Checkbox.Indeterminate (Dict.get index model.checkboxes)
    in
    checkbox
        { checkboxConfig
            | state = state
            , onClick = Just (Click index)
            , additionalAttributes = additionalAttributes
        }


heroMargin : List (Html.Attribute msg)
heroMargin =
    [ Html.Attributes.style "margin" "8px 16px" ]
