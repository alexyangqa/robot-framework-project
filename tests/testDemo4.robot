*** Settings ***
Documentation   To validate the Login form
...    Test template
...    Data driven testing
Library     SeleniumLibrary
Test Teardown   Close Browser
Test Template   Validate Unsuccessful Login
Resource    ../pageObject/Generic.robot


*** Variables ***
${Error_Message_Login}      css:.alert-danger


*** Test Cases ***
Invalid username    dsahed    learning
Invalid password    rahulshetty    ploudfg
special characters    @#$    learning


*** Keywords ***
Validate Unsuccessful Login
    [Arguments]     ${username}     ${password}
    Open The Browser With The Mortgage Payment Url
    Fill the login Form    ${username}      ${password}
    wait until it checks and display error message
    Verify Error Message Is Correct


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
















