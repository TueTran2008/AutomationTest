*** Settings ***
Documentation    Example of usig the space separate format.
Library          OperatingSystem
*** Variables ***
${Message}    Hello, World!

*** Test Cases ***
My Test
    [Documentation]     Example test.
	Log    ${Message}
    My Keyword     ${CURDIR}
*** Keywords ***
My Keyword
    [Arguments]    ${path}
	Directory Should Exist    ${path}