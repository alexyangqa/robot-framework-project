*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary


*** Variables ***
${invalid_password}      123445
${url}                   https://rahulshettyacademy.com/loginpagePractise/
${browser_name}    Chrome

*** Keywords ***
Open The Browser With Different Browser
    Open Browser    browser=${browser_name}    options=add_argument("--incognito"); add_argument("--window-size=1366,900")
    Go To   ${url}

Open The Browser With Url
    ${options}=    Set Variable    add_argument("--incognito"); add_argument("--window-size=1920,1080")

    # Add headless automatically if the browser name contains "headless"
    IF    "headless" in "${browser_name}"
        ${options}=    Set Variable    ${options}; add_argument("--headless"); add_argument("--no-sandbox");add_argument("--disable-dev-shm-usage")
    END

    Open Browser    browser=${browser_name}    options=${options}
    Go To           ${url}

Close Browser Session
    Close Browser

Wait until element passed is located on Page
    [Arguments]         ${page_locator}
    Wait Until Element Is Visible        ${page_locator}        timeout=10





