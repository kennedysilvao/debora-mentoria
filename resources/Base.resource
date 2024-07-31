*** Settings ***
Documentation    Configurações iniciais

Library    Browser

Resource    pages/Cadastro.resource
Resource    pages/Home.resource
Resource    pages/Login.resource
Resource    helpers/helpers.resource

*** Keywords ***
Iniciar browser
    New Browser    browser=chromium    headless=False
    
    New Page    https://front.serverest.dev

Fechar browser
    Take Screenshot
    Close Browser