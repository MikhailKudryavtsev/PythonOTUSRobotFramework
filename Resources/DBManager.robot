*** Settings ***
Library    DatabaseLibrary


*** Variables ***
${PRODUCT_DB}  oc_product
${PRODUCT_DESCRIPTION_DB}  oc_product_description


*** Keywords ***
Check Product In Database
    [Arguments]    ${random_string}    ${TEST_PRODUCT_NAME}
    Check If Exists In Database    select model from ${PRODUCT_DB} where model = '${TEST_PRODUCT_NAME}'
    Check If Exists In Database    select name from ${PRODUCT_DESCRIPTION_DB} where name = '${random_string}'

Get product id from database
    [Arguments]    ${TEST_PRODUCT_NAME}
    ${product_id}    QUERY    select product_id from ${PRODUCT_DB} where model = '${TEST_PRODUCT_NAME}'
