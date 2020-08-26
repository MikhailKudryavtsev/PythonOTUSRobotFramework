*** Settings ***
Library    SeleniumLibrary
Library    String
Library    DatabaseLibrary
Resource    ../Resources/Common.robot
Resource    ../Resources/DBManager.robot


Suite Setup   Connect To Database  pymysql  ${DBName}  ${DBUser}  ${DBPass}  ${BASE_URL}  ${DBPort}
Suite Teardown  Disconnect From Database

Test Setup    Open Browser    NONE    chrome    options=add_argument("--ignore-certificate-errors")
Test Teardown    Close Browser


*** Variables ***
${DBName}    bitnami_opencart
${DBUser}    bn_opencart
${DBPass}
${BASE_URL}    127.0.0.1
${DBPort}    88
${TEST_PRODUCT_NAME}  TestProduct


*** Test Cases ***
Product Change With Db Validation
    [Documentation]  Add and change product to catalog with ui and validate precence in database
    [Teardown]    Run Keywords    Execute Sql String    delete from ${PRODUCT_DB} where model = '${TEST_PRODUCT_NAME}'
    ...  AND    Execute Sql String    delete from ${PRODUCT_DESCRIPTION_DB} where name = '${random_string}'
    ...  AND    Close Browser
    Create Product    ${BASE_URL}    ${TEST_PRODUCT_NAME}
    Get product id from database    ${TEST_PRODUCT_NAME}
    ${random_string}=    Generate Random String    10    [LETTERS]
    Change Product    ${TEST_PRODUCT_NAME}    ${random_string}
    Wait Until Keyword Succeeds    5 sec  1 sec  Check Product In Database    ${random_string}    ${TEST_PRODUCT_NAME}