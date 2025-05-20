*** Settings ***
Library    SeleniumLibrary
Test Setup    Open the Browser with the URL
Test Teardown    Close Browser Session
Resource    ../Resources/LoginResources.robot
Resource    ../Resources/GenericResources.robot
Library    DataDriver    file=../TestData/SauceDemo.xlsx    sheet_name=Sheet1
Test Template     Validate different login in saucedemo

*** Variables ***
${Username}    
${Password}

*** Test Cases ***
Validate different login in saucedemo    ${Username}    ${Password}

*** Keywords ***
Validate different login in saucedemo
    [Arguments]    ${Username}    ${Password}
    Fill the login form    ${Username}    ${Password}
    IF    '${Username}' == 'locked_out_user'
        Verify error message
    ELSE IF    '${Username}' == '' and '${Password}' == 'secret_sauce'
        Verify blank username error message 
    ELSE IF    '${Username}' == 'standard_user' and '${Password}' == ''
        Verify blank password error message
    ELSE IF    '${Password}' == '123'
        Verify wrong password error message
    ELSE
        Verify the successful login
    END

