*** Settings ***
Documentation    Configurações iniciais

Library    Browser

Resource    pages/Cadastro.resource
Resource    pages/Home.resource
Resource    pages/Login.resource
Resource    helpers/helpers.resource
Resource    pages/alerts/Alert.resource

*** Variables ***
${VIDEO_PATH}     ${OUTPUT_DIR}/evidencias

*** Keywords ***
Iniciar browser
    New Browser    browser=chromium    headless=False
    # New Context    recordVideo={"dir": "${VIDEO_PATH}/${TEST_NAME}"}
    New Page    https://front.serverest.dev

Fechar browser
    Take Screenshot
    Close Browser