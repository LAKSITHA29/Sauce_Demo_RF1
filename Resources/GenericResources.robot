*** Settings ***
Documentation    A reusable file with reusable keywords and variables
Library    SeleniumLibrary

*** Variables ***
${url}    https://www.saucedemo.com/inventory.html
${browser_name}    chrome
${valid_uname}    standard_user
${valid_pass}    secret_sauce
${login_btn}     id=login-button
${add_cart}    xpath=//button[@id="add-to-cart-sauce-labs-backpack"]
${checkout}    xpath=//button[@id="checkout"]
${cart_view}    //a[@class="shopping_cart_link"]
# ${blank_name}
# ${blank_pass}

*** Keywords ***
Open the Browser with the URL
    # Open Browser    ${url}    ${browser_name}
    # Maximize Browser Window
    # Set Selenium Implicit Wait    5
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --incognito
    Call Method    ${options}    add_argument    --disable-extensions
    Call Method    ${options}    add_argument    --disable-notifications
    Call Method    ${options}    add_argument    --disable-popup-blocking
    Call Method    ${options}    add_argument    --start-maximized
    ${prefs}=    Evaluate    {"credentials_enable_service": False, "profile.password_manager_enabled": False}
    Call Method    ${options}    add_experimental_option    prefs    ${prefs}
    Create WebDriver    Chrome    options=${options}
    Go To    ${url}

Valid Login
    [Arguments]    ${valid_uname}    ${valid_pass}
    Input Text    id=user-name    ${valid_uname}
    Input Password    id=password    ${valid_pass}
    Click Button    ${login_btn}

Close Browser Session 
    Close Browser  