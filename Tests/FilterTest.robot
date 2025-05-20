*** Settings ***
Library    SeleniumLibrary
Test Setup    Open the Browser with the URL
Test Teardown    Close Browser Session
Resource    ../Resources/LoginResources.robot
Resource    ../Resources/FilterResources.robot
Resource    ../Resources/CheckoutResources.robot

*** Test Cases ***
Verify the different filter options
   GenericResources.Valid Login    ${valid_uname}    ${valid_pass}
   Click filter options Low to High
   Verify products are sorted from price Low to High
   Click filter options High to Low
   Verify products are sorted from price High to Low

   