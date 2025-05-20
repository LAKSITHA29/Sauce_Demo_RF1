*** Settings ***
Documentation    To validate the Login form of Sauce Demo
Library    SeleniumLibrary
Resource    GenericResources.robot

*** Variables ***
${success_login_msg}        //span[@class="title"]
${login_error_msg}          xpath=//h3[@data-test="error"]
${blank_user_error}         xpath=//h3[@data-test="error"]
${blank_pass_error}         xpath=//h3[@data-test="error"]
${wrong_pass_error}         xpath=//h3[@data-test="error"]

*** Keywords ***
# Validate different login in saucedemo
#     [Arguments]    ${Username}    ${Password}
#     Fill the login form    ${Username}    ${Password}
#     IF    '${Username}' == 'locked_out_user'
#         Verify error message
#     ELSE IF    '${Username}' == ''
#         Verify blank username error message 
#     ELSE IF    '${Password}' == ''
#         Verify blank password error message
#     ELSE IF    '${Password}' == '123'
#         Verify wrong password error message
#     ELSE
#         Verify the successful login
#     END

Fill the login form
    [Arguments]    ${Username}    ${Password}
    Sleep     5
    Input Text    id=user-name    ${Username}
    Input Password    id=password    ${Password}
    Click Button    ${login_btn}

Verify error message
    Wait Until Element Is Visible    ${login_error_msg}    10s
    Element Text Should Be    ${login_error_msg}    Epic sadface: Sorry, this user has been locked out.

Verify blank username error message
    Wait Until Element Is Visible    ${blank_user_error}    10s
    Element Text Should Be    ${blank_user_error}    Epic sadface: Username is required

Verify blank password error message
    Wait Until Element Is Visible    ${blank_pass_error}    10s
    Element Text Should Be    ${blank_pass_error}    Epic sadface: Password is required

Verify the successful login
    Wait Until Element Is Visible    ${success_login_msg}    10s
    Element Text Should Be    ${success_login_msg}    Products

Verify wrong password error message
    Wait Until Element Is Visible    ${wrong_pass_error}    10s
    Element Text Should Be    ${wrong_pass_error}    Epic sadface: Username and password do not match any user in this service
