*** Settings ***
Library    SSHLibrary
Resource   ${CURDIR}${/}resources/apk-management.resource
Suite Setup    Open Connection and Log In With Password    
...    ${HOSTS}[hostname]
...    ${SSH_USERNAME}
...    ${SSH_PASSWORD}
*** Keywords ***
Open Connection and Log In With Password
    [Arguments]    ${host}    ${username}    ${password}
    SSHLibrary.Open Connection    
    ...    ${host}
    ...    port=${HOSTS}[port]
    ...    alias=${HOSTS}[alias]
    SSHLibrary.Login    
    ...    ${username}
    ...    ${password}

Get Date From Remote Host
    Switch Connection    ${HOSTS}[alias]
    ${data} =     Execute Command    date
    Log To Console    ${data}
*** Test Cases ***
Remote Test
    Get Date From Remote Host
APT Search
    APK Search    ${HOSTS}[alias]    rust-all
*** Variables ***
&{HOSTS}    hostname=10.46.172.48    port=22    alias=robot-test-remote
#&{AUTH}    username=tuetd    password=1