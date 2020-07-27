*** Settings ***
Library    SeleniumLibrary


*** Keywords ***
Authorization
    [Arguments]    ${URL}
    Go To    ${URL}/admin
    Input Text    input-username    user
    Input Text    input-password    bitnami1
    Click Element    //*/button

Create Product
    [Arguments]    ${URL}    ${random_string}
    Authorization    ${URL}
    Click Element    //*[@id="menu-catalog"]/a
    Click Element    //*[@id="collapse1"]/li[2]/a
    Click Element    //*[@id="content"]/div[1]/div/div/a
    Input Text    css=#input-name1    ${random_string}
    Input Text    css=#input-meta-title1    TestTagTitle
    Click Link    Data
    Input Text    css=#input-model    TestModel
    Click Element    //*[@id="content"]/div[1]/div/div/button