*** Settings ***
Library     SeleniumLibrary     plugins=SeleniumTestability;True;1 Minute;True
Suite Setup     Configure SeleniumTestability
Library     Collections
#Test Teardown     Close All Browsers
Force Tags        no-ci-testing
*** Test Cases  ***
Open Page With Chrome and wait for element to appear    
    Click and Wait       Chrome      http://gerrit.gemteks.com:8080/login/%2Fdashboard%2Fself
*** Keywords ***
Click and Wait
    [Arguments]     ${browser}      ${url}
    Setup Browser        ${browser}          ${url}
    #Element Text Should Not Be    ${HIDDEN_DIV}   ${HIDDEN_TEXT}
    Maximize Browser Window

    Input Text  id=f_user   ${USERNAME}
    Input Text  id=f_pass   ${PASSWORD}
    Click Element    ${STARTBUTTON}
    #Element Text Should Not Be      ${AUTH_FAIL}   ${FAIL_VALUE} 
    Element Should Be Visible   //*[@id="pg-app"]
    #Close Browser
Setup Browser
    [Arguments]     ${browser}      ${url}
    Open Browser    ${url}      ${browser}
    ${testability_status} =     Is Testability Installed
    Should Be True      ${testability_status}
Configure Seleniumtestability
    ${tc} =     Create Dictionary   maxTimeout=100000    verbose=1
    Set Testability Config      ${tc}
*** Variables ***
${URL}      192.168.1.1
${STARTBUTTON}   xpath://*[@id="b_signin"]
${AUTH_FAIL}    xpath://*[@id="error_message"]
${FAIL_VALUE}   Authentication failed.

