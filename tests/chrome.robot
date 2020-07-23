*** Settings ***
Resource  ../resources/keywords.robot

*** Variables ***
${BROWSER}      headlesschrome

*** Test Cases ***

App Main page
    [Documentation]  Check Main page
    [Tags]  MainPage
    Open Browser To Main Page
    Sleep  15
    [Teardown]     Close Browser

