*** Settings ***
Documentation   To validate the Login form
...    Custom library
...    Call keywords from collection
Library     SeleniumLibrary
Library     Collections
Library     ../customLibraries/Shop.py
Test Setup      Open The Browser With Different Browser
Suite Setup
Suite Teardown
Test Teardown    Close Browser Session
Resource        ../pageObject/Generic.robot
Resource        ../pageObject/LandingPage.robot
Resource        ../pageObject/ShopPage.robot
Resource        ../pageObject/CheckoutPage.robot
Resource        ../pageObject/ConfirmationPage.robot


*** Variables ***
@{listOfProducts}    Blackberry    Nokia Edge
${country_name}    India


*** Test Cases ***
Validate Unsuccessful Login
     [Tags]      SMOKE
     LandingPage.Fill The Login Form     ${user_name}    ${invalid_password}
     LandingPage.Wait Until Element Is Located In The Page
     LandingPage.Verify Error Message Is Correct

End to end ecommerce Product validation
    [Tags]      REGRESSION
    LandingPage.Fill the login Form     ${user_name}    ${valid_password}
    ShopPage.Wait Until Element Is Located In The Page
    ShopPage.Verify Card titles in the Shop page
    Add Items To Cart And Checkout    ${listOfProducts}
    CheckoutPage.Verify Items In The Checkout Page And Proceed
    ConfirmationPage.Enter The Country And Select The Terms     ${country_name}
    ConfirmationPage.Purchase The Product And Confirm The Purchase










































