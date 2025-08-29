*** Settings ***
Library    SeleniumLibrary
Resource   ../page_objects/register_page_object.resource
Resource   ../page_objects/menu_page_object.resource
Resource   ../page_objects/account_page_object.resource

*** Keywords ***

I am on Bookstore Demo web site
    Title Should Be                        Bookstore Demo

I go to log in or sing in page
    Click Link                             ${MY_ACCOUNT_BUTTON}

I should see My Orders
    Page Should Contain Link               ${MY_ORDERS_LINK}  
      
I should see My Wish List
    Page Should Contain Link               ${MY_WISH_LIST_LINK}   

I fill register form
    [Arguments]    ${name}    ${mail}    ${pass}    
    ...            ${confirm_pass}    ${business_entity}
    Input Text                             ${NAME_TEXT_FIELD}               ${name}
    Input Text                             ${MAIL_TEXT_FIELD}               ${mail}
    Input Password                         ${PASS_TEXT_FIELD}               ${pass}
    Input Password                         ${CONFIRM_PASS_TEXT_FIELD}       ${confirm_pass}
    Select From List By Label              ${BUSINESS_ENTITY_COMBOBOX}      ${business_entity}

I accept the terms of use
    Select Checkbox                        ${TERMS_OF_USE_CHECKBOX}

I submit register form
    Submit Form                            ${REGISTER_BUTTON}

I should see a success message
    [Arguments]    ${message}
    Wait Until Page Contains               ${message}

