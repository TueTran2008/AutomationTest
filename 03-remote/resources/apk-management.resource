*** Settings ***
Library    SSHLibrary
*** Keywords ***
APK Search
    [Arguments]    ${remote_host}    ${package_name}
	Switch Connection    ${remote_host}
	${stdout} =    Execute Command    
	...    apt search ${package_name}
	Log To Console    Package found ${stdout}
