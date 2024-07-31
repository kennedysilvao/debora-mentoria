*** Settings ***
Documentation    Ações e elementos da pagina de cadastro

Library    Browser

*** Keywords ***
Validar que estou no formulário de cadastro
    Wait For Elements State    css=h2 >> text=Cadastro    visible    5

Preencher campos do formulário
    [Arguments]    ${name}    ${email}    ${password}
    
    Fill Text    css=input[placeholder$="nome"]     ${name}
    Fill Text    css=input[placeholder$="email"]    ${email}
    Fill Text    css=input[placeholder$="senha"]    ${password}

    Check Checkbox    css=input[name="administrador"]

Submeter informações do usuário
    Click    css=button >> text=Cadastrar

Usuario cadastrado com sucesso
    [Arguments]    ${mensagem}

    Wait For Elements State    css=.alert-link    visible    5

    Get Text    css=.alert-link
    ...    equals
    ...    ${mensagem}