*** Settings ***
Library    FlaUILibrary
Library    Process

*** Variables ***
${EDITOR_LOCATOR}    //Document[@Name='Teksteditor']
${TEXT_TO_WRITE}     Hello, World!
${BOLD_BUTTON}       //Button[@Name='Vet (Ctrl+B)']
@{HELLO_INPUT}    t'Hello World'
@{CLEAR_TEXT}    s'CTRL+A'    s'DELETE'

*** Keywords ***
Start Applicatie
    [Arguments]    ${process_name}

    ${pid}=    Launch Application    ${process_name}
    RETURN    ${pid}

Forceer Sluiten Applicatie Bij Naam
    [Arguments]    ${process_name}
    Run Process    taskkill    /IM    ${process_name}    /F    /T

Textbox Moet Tekst Bevatten
    [Arguments]    ${locator}    ${verwachte_tekst}

    ${actual_text}=    Get Text From Textbox    ${locator}
    Should Be Equal    ${actual_text}    ${verwachte_tekst}

*** Test Cases ***
Open Notepad En Schrijf Tekst
    ${notepad_pid}=    Start Applicatie    notepad.exe
    Wait Until Element Exist    ${EDITOR_LOCATOR}    4
    Press Keys    ${CLEAR_TEXT}
    Set Text To Textbox    ${EDITOR_LOCATOR}    ${TEXT_TO_WRITE}
    ${actual_text}=    Get Text From Textbox    ${EDITOR_LOCATOR}
    Should Be Equal    ${actual_text}    ${TEXT_TO_WRITE}
    [Teardown]    Forceer Sluiten Applicatie Bij Naam    notepad.exe

Open Notepad En Schrijf Tekst Vetgedrukt
    ${notepad_pid}=    Start Applicatie    notepad.exe
    Wait Until Element Exist    ${EDITOR_LOCATOR}    4
    Press Keys    ${CLEAR_TEXT}
    Click    ${BOLD_BUTTON}
    Click    ${EDITOR_LOCATOR}
    Press Keys    ${HELLO_INPUT}
    Textbox Moet Tekst Bevatten
    ...    ${EDITOR_LOCATOR}
    ...    Hello World
    [Teardown]    Forceer Sluiten Applicatie Bij Naam    notepad.exe