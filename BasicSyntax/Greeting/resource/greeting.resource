*** Keywords ***
Print Your Name
    [Arguments]    ${name}
	Log     Keywork ${name}
First Suite Setup
    Log    Our Robot awesomeness begin!.
First Suite Teardown
    Log    The end of the awesomeness!.
*** Variables ***
${MY_DREAM}    dream