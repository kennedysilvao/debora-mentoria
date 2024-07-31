*** Settings ***
Documentation    Ações e elementos da pagina de login

Library    Browser

*** Keywords ***
Validar que estou na página de login
    Wait For Elements State    xpath=//a[contains(.,"Cadastre-se")]    visible    5

Ir para o formulário de cadastro
    Click    xpath=//a[contains(.,"Cadastre-se")]
    