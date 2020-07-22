*** Settings ***
Library  SeleniumLibrary

*** Variables ***

${APP URL}      https://google.com/

*** Keywords ***

Open Browser To Main Page
    Open Browser    ${APP URL}    ${BROWSER}
    Title Should Be   Google
