*** Settings ***
Library    FlaUILibrary
Library    Process

*** Variables ***
${CALC_PROCESS}      CalculatorApp.exe
${CALC_EXE}          calc.exe
${CALC_SCREEN}        //Window[@Name='Rekenmachine']

*** Keywords ***
Start Calculator
    Launch Application    ${CALC_EXE}
    Wait Until Element Exist    ${CALC_SCREEN}    10

Close Calculator
    Run Process    taskkill    /IM    ${CALC_PROCESS}    /F    /T

*** Keywords ***
Controleer Calculator Resultaat
    [Arguments]    ${expected_result}
    Wait Until Element Exist
    ...    //Text[@AutomationId='CalculatorResults' and contains(@Name,'${expected_result}')]
    ...    5

*** Test Cases ***
Start Calculator En Sluit Af
    Start Calculator
    sleep    2
    [Teardown]    Close Calculator

Voer een rekensom uit met toetsenboerd input en controleer het resultaat
    Start Calculator
    Press Key    t'1'
    Press Key    t'+'
    Press Key    t'2'
    Press Key    s'ENTER'
    Controleer Calculator Resultaat    3
    [Teardown]    Close Calculator

Voer een rekensom uit met muisklikken en controleer het resultaat
    Start Calculator
    Click    //Button[@AutomationId='num5Button']
    Click    //Button[@AutomationId='xpower2Button']
    Click    //Button[@AutomationId='equalButton']
    Controleer Calculator Resultaat    25
    Click    //Button[@AutomationId='clearButton']
    Click    //Button[@AutomationId='num2Button']
    Click    //Button[@AutomationId='num5Button']
    Click    //Button[@AutomationId='squareRootButton']
    Click    //Button[@AutomationId='equalButton']
    Controleer Calculator Resultaat    5
    [Teardown]    Close Calculator