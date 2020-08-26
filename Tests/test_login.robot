*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/Common.robot


Test Setup    Open Browser    NONE    chrome    options=add_argument("--ignore-certificate-errors")
Test Teardown    Close Browser


*** Variables ***
${URL}    127.0.0.1
${EMAIL}    test@test.com
${PASSWORD}    qweQWE123



*** Test Cases ***
Test Login Admin
    Authorization    ${URL}
    Wait Until Page Contains Element    //h1[contains(text(),'Dashboard')]

Test Login User
    Login User    ${URL}    ${EMAIL}    ${PASSWORD}
    Wait Until Page Contains Element    //h2[contains(text(),"My Account")]
