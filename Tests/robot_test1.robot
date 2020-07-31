*** Settings ***
Library    SeleniumLibrary
Library    String
Resource    ../Resources/Common.robot

Documentation    Тесты написанные на Robot Framework для OpenCart

Test Setup    Open Browser    NONE    chrome    options=add_argument("--ignore-certificate-errors")
Test Teardown    Close Browser


*** Variables ***
${URL}    http://localhost


*** Test Cases ***
Test Check Cart
    Go To    ${URL}
    Click Element    xpath=//*[@id="cart"]
    Current Frame Should Not Contain    ul.dropdown-menu.pull-right    Your shopping cart is empty!

Test Check Search
    ${random_string}=    Generate Random String    10    [LETTERS]
    Go To    ${URL}
    Input Text    name=search    ${random_string}
    Click Element    //*[@id="search"]/span/button
    Current Frame Should Not Contain    div.col-sm-12    ${random_string}

Test Login
    Authorization    ${URL}
    Wait Until Page Contains Element    //h1[contains(text(),'Dashboard')]

Test Create Product
    ${random_string}=    Generate Random String    10    [LETTERS]
    Create Product    ${URL}    ${random_string}
    Wait Until Page Contains Element    //*/td[contains(text(), "${random_string}")]

Test Filter By Name
    ${random_string}=    Generate Random String    10    [LETTERS]
    Create Product    ${URL}    ${random_string}
    Input Text    css=#input-name    ${random_string}
    Click Element    css=#button-filter