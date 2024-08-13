*** Settings ***
Library    OperatingSystem
Library    String
Library    json
Library    JSONLibrary.py
Library    HelperLibrary
Library    helper_robot
*** Variables ***
${RESULT_FILE}        yet_another_results_file.txt

*** Keywords ***
Print Multiple Name
    [Arguments]    ${list_name}
	Log To Console    ${\n}    no_newline=True
    FOR    ${name}     IN     @{list_name}
	    Log To Console     hehe ${name}
	END
Read from file
    [Arguments]    ${file_path}
    File Should Exist    ${file_path}
    ${FILE_CONTENT} =    Get File    ${file_path}
	#Log To Console    ${FILE_CONTENT}
    @{line} =     Split To Lines    ${FILE_CONTENT}
    RETURN    @{line}

Json To Dict
    [Arguments]    ${file_path}
    File Should Exist    ${file_path}
    #${FILE_CONTENT} =     Get File    ${file_path}
    ${f_id} =    Evaluate    open('${file_path}')
    &{json_data} =    Evaluate    json.load(open('${file_path}'))
    RETURN     &{json_data}
Library Integration
    [Arguments]    ${file_path}
    File Should Exist    ${file_path}
    #Parse Json File    ${file_path}
    ${rest} =     Parse JSON File    ${file_path}
    RETURN    ${rest}
Random Number List Generate
    [Arguments]    ${student_list}    ${min}    ${max}
    Create File     ${RESULT_FILE}
    File Should Exist    ${RESULT_FILE}
    Log To Console    ${\n}    no_newline=True
    FOR    ${student}    IN     @{student_list}
        ${rand_number} =    helper_robot.Random Number    ${min}    ${max}
        Append To File    ${RESULT_FILE}    ${student}:${rand_number}\r\n
        Log To Console    ${student}:${rand_number}\r\n
    END
