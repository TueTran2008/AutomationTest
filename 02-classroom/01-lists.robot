*** Settings ***
Resource    ${CURDIR}${/}resources${/}lists.resource
Library     HelperLibrary.py
Suite Setup     Remove File    ${RESULT_FILE}
*** Variables ***
@{LIST}    'Donal Trump'    'Joe Biden'    'Vladimir Putin'    'Xi JinPing'
@{Students}    'George Lin'    'Toan Pham'    'Elon Nguyen'    'Leon Nguyen'
*** Test Cases ***
CLASS ROOM Name
    [Tags]    classroom
    Print Multiple Name    ${LIST}
Students
    [Tags]    students
    @{name} =     Read from file    ${CURDIR}${/}students.txt
    Print Multiple Name    ${name}
Evaluation
    [Tags]    evaluation
    &{results_dict} =    Json To Dict   ${CURDIR}${/}exam_results.json
    FOR     ${key}    ${value}    IN   &{results_dict}
        Log To Console    \n${key} : ${value}
    END
Class Libraries
    [Tags]    json
    &{dict} =    Library Integration    ${CURDIR}${/}exam_results.json
    Log To Console    ${\n}    no_newline=True
    FOR    ${student}    ${result}  IN    &{dict}
        Log To Console    ${student} : ${result}
    END
Generate Random Number
    [Tags]    random-number
    Random Number List Generate    ${Students}        ${0}        ${100}