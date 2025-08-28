*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
Cenário: previsão do tempo em Porto Alegre
    Open Browser                browser=chrome
    Go To                       url=https://www.google.com
    Input Text                  name=q    Previsão do tempo em Porto Alegre
    Press Keys                  name=q    RETURN
    Sleep                       15
    Wait Until Page Contains    Porto Alegre, RS
    Close Browser 

