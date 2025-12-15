*** Settings ***
Documentation   To validate the Login form
...    Test template
...    Data driven testing
...    Install Robot Framework DataDriver package for Python Interpreter
Library     SeleniumLibrary
Library     DataDriver      file=resources/data.csv     encoding=utf_8   dialect=unix
Test Teardown   Close Browser
Test Template   Validate Unsuccessful Login
Resource    ../pageObject/Generic.robot


*** Variables ***
${Error_Message_Login}      css:.alert-danger

*** Test Cases ***
Login with user ${username} and password ${password}


*** Keywords ***
Validate Unsuccessful Login
    [Arguments]     ${username}     ${password}
    open the browser with the Mortgage payment url
    Fill the login Form    ${username}      ${password}
    wait until it checks and display error message
    verify error message is correct

Fill the login Form
    [Arguments]     ${username}     ${password}
    Input Text          id:username     ${username}
    Input Password      id:password     ${password}
    Click Button        signInBtn

Wait Until It Checks And Display Error Message
    Wait Until Element Is Visible       ${Error_Message_Login}

Verify Error Message Is Correct
   ${result}=   Get Text    ${Error_Message_Login}
   Should Be Equal As Strings     ${result}     Incorrect username/password.
   Element Text Should Be       ${Error_Message_Login}      Incorrect username/password.
















