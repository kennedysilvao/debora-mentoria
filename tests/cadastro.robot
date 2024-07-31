*** Settings ***
Documentation    Suíte de testes da funcionalidade de cadastro

Resource    ../resources/Base.resource

Test Setup    Iniciar browser
Test Teardown    Fechar browser

*** Test Cases ***
Deve realizar o cadastro com sucesso
    ${user}    Create Dictionary
    ...    name=Jorge Luiz
    ...    email=jorgeluis@gmail.com
    ...    password=pwd123

    Criar sessão
    ${usuario_id}    Buscar usuario email    ${user}[email]
    Excluir usuario por id    ${usuario_id}

    Validar que estou na página de login
    
    Ir para o formulário de cadastro

    Validar que estou no formulário de cadastro
    Preencher campos do formulário    ${user}[name]    ${user}[email]    ${user}[password]
    Submeter informações do usuário
    Usuario cadastrado com sucesso    Cadastro realizado com sucesso
    Usuario logado    ${user}[name]