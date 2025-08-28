*** Settings ***
Documentation    Como cliente  da loja virtual, desejo criar um cadastro,
...              no sistema para poder visualizar meus
...              pedidos e listas de desejo.

Library    SeleniumLibrary
Resource   ../resource/config.resource
Resource   ../resource/page_objects/account_page_object.resource
Resource   ../resource/page_objects/menu_page_object.resource
Resource   ../resource/page_objects/register_page_object.resource
Resource   ../resource/pages/register.resource

Test Setup       Open Browser    browser=${BROWSER}    url=${URL}
Test Teardown    Close Browser

*** Test Cases ***
Scenario: Sucess sing in as Natural Person
    Given Click Link                    ${MY_ACCOUNT_BUTTON}
    When Input Text                     ${NAME_TEXT_FIELD}               Lorem ipsum
    And Input Text                      ${MAIL_TEXT_FIELD}               lorem@ipsum.com
    And Input Password                  ${PASS_TEXT_FIELD}               foo123
    And Input Password                  ${CONFIRM_PASS_TEXT_FIELD}       foo123
    And Select From List By Label       ${BUSINESS_ENTITY_COMBOBOX}      Pessoa Física
    And Select Checkbox                 ${TERMS_OF_USE_CHECKBOX}
    And Submit Form                     ${REGISTER_BUTTON}
    Then Wait Until Page Contains       Lorem ipsum, teu cadastro foi realizado com sucesso!
    And Page Should Contain Link        ${MY_WISH_LIST_LINK}
    And Page Should Contain Link        ${MY_ORDERS_LINK}


Scenario: Sucess sing in as Juridical Person
    Given Click Link                    ${MY_ACCOUNT_BUTTON}
    When Input Text                     ${NAME_TEXT_FIELD}               Lorem ipsum
    And Input Text                      ${MAIL_TEXT_FIELD}               contato@loremipsum.com
    And Input Password                  ${PASS_TEXT_FIELD}               54321
    And Input Password                  ${CONFIRM_PASS_TEXT_FIELD}       54321
    And Select From List By Label       ${BUSINESS_ENTITY_COMBOBOX}      Pessoa Jurídica
    And Select Checkbox                 ${TERMS_OF_USE_CHECKBOX}
    And Submit Form                     ${REGISTER_BUTTON}
    Then Wait Until Page Contains       Lorem ipsum, teu cadastro foi realizado com sucesso!
    And Page Should Contain Link        ${MY_ORDERS_LINK}
    And Page Should Contain Link        ${MY_WISH_LIST_LINK}


Scenario: Sucess sign in as Natuarl Person
    Given I am on Bookstore Demo web site
    And I go to log in or sing in page
    When I fill register form
    And I accept the terms of use
    And I submit register form
    Then I should see a success message
    And I should see My Wish List
    And I should see My Orders    

*** Keywords ***
I am on Bookstore Demo web site
    Title Should Be                        Bookstore Demo
I go to log in or sing in page
    Click Link                             ${MY_ACCOUNT_BUTTON}


I should see My Orders
    Page Should Contain Link               ${MY_ORDERS_LINK}    
I should see My Wish List
    Page Should Contain Link               ${MY_WISH_LIST_LINK}    




# Cenário: Cadastro com sucesso de Pessoa Física
#     Dado que estou na página da loja virtual
#     E acessei a área de cadastro
#     Quando preencho o com meu dados
#     E submeto os dados do formulário
#     E aceito os termos de uso
#     Então devo receber mensagem de sucesso
#     E devo acessar a opção de acessar meus pedidos
#     E devo visualizar a opção de acessar minha lista de desejos.