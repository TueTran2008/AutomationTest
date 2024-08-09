*** Settings ***
Suite Setup       Global Suite Setup
Suite Teardown    Global Suite Teardown
*** Keywords ***
Global Suite Setup
    Log    Our Robot awesomeness begin!
    Set Global Variable    ${GLOBAL_VARIABLE}
Global Suite Teardown
    Log    Our end of awesomeness!
*** Variables ***
${GLOBAL_VARIABLE}        This is Global Variables