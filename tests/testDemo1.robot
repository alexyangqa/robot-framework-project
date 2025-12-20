*** Settings ***
Documentation   To validate the Login form
Library     SeleniumLibrary
Test Teardown   Close Browser
Resource        ../pageObject/Generic.robot

*** Variables ***
${Error_Message_Login}      css:.alert-danger

*** Test Cases ***
Validate Unsuccessful Login
    [Tags]    SMOKE    REGRESSION
    Open The Browser With Url
    Fill The Login Form
    Wait Until It Checks And Display Error Message
    Verify Error Message Is Correct

*** Keywords ***
Open The Browser With The Mortgage Payment Url
    Open Browser    browser=Edge    options=add_experimental_option("detach",True)
    Go To   https://rahulshettyacademy.com/loginpagePractise/

Fill The Login Form
    Input Text          id:username     ${user}
    Input Password      id:password     ${invalid_password}
    Click Button        id:signInBtn

Wait Until It Checks And Display Error Message
    Wait Until Element Is Visible       ${Error_Message_Login}

Verify Error Message Is Correct
   ${result}=   Get Text    ${Error_Message_Login}
   Should Be Equal As Strings     ${result}     Incorrect username/password.
   Element Text Should Be       ${Error_Message_Login}      Incorrect username/password.
















