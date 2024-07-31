*** Settings ***
Documentation    Ações e elementos da pagina home

Library    Browser

*** Keywords ***
Usuario logado
    [Arguments]    ${username}

    Get Text    css=h1
    ...    contains
    ...    ${username}