*** Settings ***
Library    SeleniumLibrary
Library    DataDriver    file=../TestData/CheckoutData.csv    encoding=utf_8    dialect=unix
Test Setup    Open the Browser with the URL
Test Teardown    Close Browser Session
Resource    ../Resources/LoginResources.robot
Resource    ../Resources/CheckoutResources.robot
Test Template    Invalid checkout with  

*** Variables ***
${Firstname}
${Lastname}
${Zipcode}

*** Test Cases ***
# Invalid checkout with     Blank firstname    Blank lastname        Blank zipcode
Checkout with csv file     ${Firstname}    ${Lastname}    ${Zipcode}

*** Keywords ***
Invalid checkout with     
    [Arguments]    ${Firstname}    ${Lastname}    ${Zipcode}
    GenericResources.Valid Login    ${valid_uname}    ${valid_pass}
    Verify the product page opens
    Input Text    xpath=//input[@id="first-name"]   ${Firstname}
    Input Text    xpath=//input[@id="last-name"]     ${Lastname}
    Input Text    xpath=//input[@id="postal-code"]   ${Zipcode}
    Click Button  xpath=//input[@id="continue"]
    IF    '${Firstname}' == ''
        Verify the firstname required message
    ELSE IF    '${Lastname}' == ''    
        Verify the lastname required message
    ELSE IF    '${Zipcode}' == ''     
         Verify the zipcode required message
    ELSE
        Verify the success checkout message
    END         
