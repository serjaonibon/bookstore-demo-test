*** Settings ***
Documentation    Como cliente da loja virtual, desejo criar um cadastro
...              no sistema para poder visualizar meus pedidos e listas de desejos.

Library          SeleniumLibrary
Resource         config.resource
Resource         account_page_object.resource
Resource         register_page_object.resource
Resource         menu_page_object.resource


Test Setup       Open Browser            ${URL}    ${BROWSER}
Test Teardown    Close All Browsers

*** Test Cases ***
Scenario: Sucess sing in as Natural Person
    
    Given Click Link                    ${MY_ACCOUNT_BUTTON}
    When Input Text                     ${NAME_TEXT_FIELD}                lorem ipsum
    And Input Text                      ${MAIL_TEXT_FIELD}                lorem@ipsum.com
    And Input Password                  ${PASS_TEXT_FIELD}                foo123
    And Input Password                  ${CONFIRM_PASS_TEXT_FIELD}        foo123
    And Select From List By Label       ${BUSINESS_ENTITY_COMBOBOX}       Pessoa Física
    And Select Checkbox                 ${TERMS_OF_USE_CHECKBOX}
    And Submit Form                     ${REGISTER_BUTTON}
   Then Wait Until Page Contains        Lorem ipsum, teu cadastro foi realizado com sucesso!
   And Page Should Contain Link        ${MY_WISH_LIST_LINK}
    And Page Should Contain Link        ${MY_ORDERS_LINK}
    


Scenario: Sucess sing in as Juridical Person
    Given Click Link                    ${MY_ACCOUNT_BUTTON}
    When Input Text                     ${NAME_TEXT_FIELD}                lorem ipsum
    And Input Text                      ${MAIL_TEXT_FIELD}                contato@loremipsum.com
    And Input Password                  ${PASS_TEXT_FIELD}                54321
    And Input Password                  ${CONFIRM_PASS_TEXT_FIELD}        54321
    And Select From List By Label       ${BUSINESS_ENTITY_COMBOBOX}       Pessoa Jurídica
    And Select Checkbox                 ${TERMS_OF_USE_CHECKBOX}
    And Submit Form                     ${REGISTER_BUTTON}
   Then Wait Until Page Contains        Lorem ipsum, teu cadastro foi realizado com sucesso!
    And Page Should Contain Link        ${MY_INVOICES_LINK}
    And Page Should Contain Link        ${MY_ORDERS_LINK}   