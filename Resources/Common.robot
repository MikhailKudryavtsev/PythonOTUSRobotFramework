*** Settings ***
Library    SeleniumLibrary


*** Keywords ***
Authorization
    [Arguments]    ${URL}
    Go To    http://${URL}/admin
    Input Text    id=input-username    user
    Input Text    id=input-password    bitnami1
    Click Element    //button[contains(text(),"Login")]

Create Product
    [Arguments]    ${URL}    ${random_string}
    Authorization    ${URL}
    Click Element    //*[@id="menu-catalog"]/a
    Click Element    //*[@id="collapse1"]/li[2]/a
    Click Element    //*[@id="content"]/div[1]/div/div/a
    Input Text    css=#input-name1    ${TEST_PRODUCT_NAME}
    Input Text    css=#input-meta-title1    TestTagTitle
    Click Link    Data
    Input Text    css=#input-model    ${TEST_PRODUCT_NAME}
    Click Element    //*[@id="content"]/div[1]/div/div/button

Search Product
    [Arguments]    ${TEST_PRODUCT_NAME}
    Input Text    id=input-name    ${TEST_PRODUCT_NAME}
    Click Element    css=#button-filter

Change Product
    [Arguments]    ${TEST_PRODUCT_NAME}    ${random_string}
    Search Product    ${TEST_PRODUCT_NAME}
    Click Element    //*[@id="form-product"]/div/table/tbody/tr/td[8]/a
    Clear Element Text    css=#input-name1
    Input Text    css=#input-name1    ${random_string}
    Click Element    //*[@id="content"]/div[1]/div/div/button


Login User
    [Arguments]    ${URL}    ${EMAIL}    ${PASSWORD}
    Go To    http://${URL}
    Click Element    css=i.fa.fa-user
    Click Element    //a[contains(text(),"Login")]
    Input Text    id=input-email    ${EMAIL}
    Input Text    id=input-password    ${PASSWORD}
    Click Element    //*[@id="content"]/div/div[2]/div/form/input