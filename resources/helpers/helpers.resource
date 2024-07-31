*** Settings ***
Documentation    Helpers

Library    RequestsLibrary

*** Variables ***
${API}    https://serverest.dev

*** Keywords ***
Criar sessão
    ${HEADER}=    Create Dictionary    Content-Type=application/json
    Create Session    alias=serverest    url=${API}    headers=${HEADER}    disable_warnings=1

Buscar usuario email
    [Arguments]    ${email}

    ${response}    GET On Session    url=${API}/usuarios    alias=serverest
    ...    params=email=${email}
    
    Should Be Equal As Strings    ${response.status_code}    200

    FOR    ${usuario}    IN    @{response.json()['usuarios']}
        ${usuario_id}    Set Variable    ${usuario['_id']}
        RETURN    ${usuario_id}
    END

Excluir usuario por id
    [Arguments]    ${id}

    ${response}    DELETE On Session    url=${API}/usuarios/${id}    alias=serverest
    Should Be Equal As Strings    ${response.status_code}    200