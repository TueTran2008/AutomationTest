*** Settings ***
Documentation    Greeting RobotFramwork Learning
Resource        ${CURDIR}${/}resource${/}greeting.resource
# Suite Setup     First Suite Setup
# Suite Teardown  First Suite Teardown
*** Test Cases ***
Original Greetings
    [Tags]    ubuntu
    Print Your Name    ${YOUR_NAME}
	Print Your Name    John Wick
	Log    ${YOUR_NAME}

Another Greetings
    [Tags]    centos
    Print Your Name    ${MY_DREAM}
    Print Your Name    ${GLOBAL_VARIABLE}

*** Variables ***
${YOUR_NAME}     Darwin Tran

