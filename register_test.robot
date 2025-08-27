*** Settings ***
Documentation    Como cliente da loja virtual, desejo criar um cadastro
...              no sistema para poder visualizar meus pedidos e listas de desejos.
Library          SeleniumLibrary

Test Teardown    Close All Browsers

*** Test Cases ***
Scenario: Sucess sing in as Natural Person
    Given Open Browser                  browser=chrome
    And Go To                         http://localhost:5173/
    And Click Link                    Minha conta
    When Input Text                    id: register-name             lorem ipsum
    And Input Text                    id: register-mail             lorem@ipsum.com
    And Input Password                id: register-pass             foo123
    And Input Password                id: register-confirm-pass     foo123
    And Select From List By Label     id: register-user-type        Pessoa Física
    And Select Checkbox               id: terms-of-use
    And Submit Form                   name: register
   Then Wait Until Page Contains      Lorem ipsum, teu cadastro foi realizado com sucesso!
    And Page Should Contain Link      /my-orders
    And Page Should Contain Link      /my-wish-list