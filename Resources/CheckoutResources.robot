*** Settings ***
Library    SeleniumLibrary
Resource    GenericResources.robot

*** Variables ***
${sauce_lab_bag}    xpath=//div[text()='Sauce Labs Backpack']
${fname_error}    xpath=//h3[@data-test='error']
${lname_error}    xpath=//h3[@data-test='error']
${zipcode_error}  xpath=//h3[@data-test='error']
${checkout_success}    class=inventory_item_price

*** Keywords ***

Verify the product page opens
    Element Should Contain    ${sauce_lab_bag}    Sauce Labs Backpack
    Click Button    xpath=//button[@id='add-to-cart-sauce-labs-backpack']
    Click Element    class=shopping_cart_link
    Sleep    2
    Click Button    id=checkout

Verify the firstname required message
    Element Text Should Be    ${fname_error}    Error: First Name is required

Verify the lastname required message
    Element Text Should Be    ${lname_error}    Error: Last Name is required

Verify the zipcode required message
    Element Text Should Be    ${zipcode_error}    Error: Postal Code is required

Verify the success checkout message
    # Click Button    id=continue
    Element Text Should Be    ${checkout_success}    $29.99
