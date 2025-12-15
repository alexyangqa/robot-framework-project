*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary


*** Variables ***
${user_name}             rahulshettyacademy
${invalid_password}      123445
${valid_password}        learning
${url}                   https://rahulshettyacademy.com/loginpagePractise/
${browser_name}    Chrome



*** Keywords ***
Open The Browser With The Mortgage Payment Url
#    Open Browser    browser=Chrome    options=add_experimental_option("detach",True)
#    Set Window Size    1366    900
    Open Browser    browser=Edge    options=add_argument("--incognito"); add_argument("--window-size=1366,900"); add_experimental_option("detach", True)
    Go To   ${url}


Open The Browser With Different Browser
    [Arguments]    ${browser_name}
    Open Browser    browser=${browser_name}    options=add_argument("--incognito"); add_argument("--window-size=1366,900"); add_experimental_option("detach", True)
    Go To   ${url}

Open The Browser With The Url
    Create Webdriver    Chrome
    Go To   ${url}

Close Browser Session
    Close Browser

Wait until element passed is located on Page
    [Arguments]         ${page_locator}
    Wait Until Element Is Visible        ${page_locator}        timeout=10





