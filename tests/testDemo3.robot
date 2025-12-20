*** Settings ***
Documentation   To validate the Login form
...    Handle string
...    Switch window
Library     SeleniumLibrary
Library     String
Test Setup      Open The Browser With The Mortgage Payment Url
Test Teardown   Close Browser Session
Library     Collections
Resource    ../pageObject/Generic.robot

*** Variables ***
${Error_Message_Login}      css:.alert-danger



*** Test Cases ***
Validate Child window Functionality
    [Tags]      NEWFEATURE
    Select the link of Child window
    Verify the user is Switched to Child window
    ${email} =    Grab the Email id in the Child Window
    Switch to Parent window and enter the Email    ${email}


*** Keywords ***
Select the link of Child window
    click element    css:.blinkingText
    Sleep    5

Verify the user is Switched to Child window
    Switch Window    NEW
    Element Text Should Be    css:h1    DOCUMENTS REQUEST


Grab the Email id in the Child Window
    ${text}=    get text    css:.red
    @{words}=   Split String    ${text}     at
    #0 ->Please email u
    #1-> mentor@rahulshettyacademy.com with below template to receive response
    ${text_split}=    Get From List    ${words}    1
    log    ${text_split}
     @{words_2}=   Split String    ${text_split}
     #0->mentor@rahulshettyacademy.com
     ${email}=      Get From List    ${words_2}    0
     RETURN    ${email}


Switch to Parent window and enter the Email
    [Arguments]    ${email}
    Switch Window      MAIN
    Title Should Be     LoginPage Practise | Rahul Shetty Academy
    Input Text    id:username    ${email}











































