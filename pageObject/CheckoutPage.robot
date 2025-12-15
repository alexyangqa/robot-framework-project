*** Settings ***
Documentation     All the page objects and keywords of landing page
Library           SeleniumLibrary

*** Variables ***
${Shop_page_load}           css:.nav-link


*** Keywords ***
Verify Items In The Checkout Page And Proceed
    click element   css:.btn-success
