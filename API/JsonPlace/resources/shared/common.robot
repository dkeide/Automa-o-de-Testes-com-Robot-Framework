*** Settings ***
Resource    ../main.robot

*** Variables ***
${SESSION_NAME}    minhaSessao

*** Keywords ***
Dado que estou conectado na API
    Create Session    ${SESSION_NAME}    ${BASE_URL}

Então o status code deve ser ${status_esperado}
    Should Be Equal As Integers    ${response.status_code}    ${status_esperado}

E mostro a resposta da API
    Log To Console    Status: ${response.status_code}
    Log To Console    JSON: ${response.json()}