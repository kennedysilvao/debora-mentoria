*** Settings ***
Documentation    Suite de testes de login

Resource    ../resources/Base.resource

Test Setup    Iniciar browser
Test Teardown    Fechar browser

*** Test Cases ***
Deve realizar login com sucesso
    ${user}    Create Dictionary
    ...    nome=Monica Santos
    ...    email=monicasantos@yahoo.com
    ...    password=pwd123
    ...    administrador=true

    Gerenciamento de usuario    ${user}[email]    ${user}

    Validar que estou na página de login
    Preencher campos de login    ${user}[email]    ${user}[password]
    Submeter login
    Usuario logado    ${user}[nome]

Email é obrigatório
    ${user}    Create Dictionary
    ...    email=${EMPTY}
    ...    password=pwd123

    Validar que estou na página de login
    Preencher campos de login    ${user}[email]    ${user}[password]
    Submeter login
    Validar mensagem de erro    Email é obrigatório

Senha é obrigatória
    ${user}    Create Dictionary
    ...    email=monicasantos@gmail.com
    ...    password=${EMPTY}

    Validar que estou na página de login
    Preencher campos de login    ${user}[email]    ${user}[password]
    Submeter login
    Validar mensagem de erro    Password é obrigatório

Não deve realizar login com senha incorreta
    ${user}    Create Dictionary
    ...    nome=Lucas Rocha
    ...    email=lucasrocha@yahoo.com
    ...    password=pwd123
    ...    administrador=true

    Gerenciamento de usuario    ${user}[email]    ${user}

    Validar que estou na página de login
    Preencher campos de login    ${user}[email]    pwd124
    Submeter login
    Validar mensagem de erro    Email e/ou senha inválidos