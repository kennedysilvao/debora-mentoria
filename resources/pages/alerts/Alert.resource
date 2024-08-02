*** Settings ***
Documentation    Alert message

Library    Browser

*** Keywords ***
Validar mensagem de erro
    [Arguments]    ${expected_message}

    Get Text    css=span >> text=${expected_message}
    ...    equal
    ...    ${expected_message}