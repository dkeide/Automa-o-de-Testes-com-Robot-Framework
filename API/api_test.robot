*** Settings ***
Library    RequestsLibrary

*** Variables ***
# Configurações de URL e Endpoints
${BASE_URL}              https://jsonplaceholder.typicode.com
${USUARIO_EXISTENTE}     /users/1
${USUARIO_INEXISTENTE}   /users/9999
${ENDPOINT_POST}        /posts

# Configurações da Sessão
${SESSION_NAME}          minhaSessao

# Dados do Post
${POST_TITLE}            Meu Post
${POST_BODY}             Aprendendo API com Robot
${USER_ID}               1

# Status Codes
${STATUS_200}            200
${STATUS_404}            404
${STATUS_201}            201

# Outros
${EXPECTED_ANY}          any


*** Keywords ***
Dado que estou conectado na API
    Create Session    ${SESSION_NAME}    ${BASE_URL}

Quando busco um usuario existente
    ${response}=    GET On Session    ${SESSION_NAME}    ${USUARIO_EXISTENTE}
    Set Suite Variable    ${response}

Quando busco um usuario inexistente
    ${response}=    GET On Session
    ...    ${SESSION_NAME}
    ...    ${USUARIO_INEXISTENTE}
    ...    expected_status=${EXPECTED_ANY}
    Set Suite Variable    ${response}

Quando envio um novo post
    ${body}=    Create Dictionary
    ...    title=${POST_TITLE}
    ...    body=${POST_BODY}
    ...    userId=${USER_ID}
    ${response}=    POST On Session
    ...    ${SESSION_NAME}
    ...    ${ENDPOINT_POST}
    ...    json=${body}
    Set Suite Variable    ${response}

Então o status code deve ser 200
    Should Be Equal As Integers    ${response.status_code}    ${STATUS_200}

Então o status code deve ser 404
    Should Be Equal As Integers    ${response.status_code}    ${STATUS_404}

Então o status code deve ser 201
    Should Be Equal As Integers    ${response.status_code}    ${STATUS_201}

E mostro a resposta da API
    Log To Console    ${EMPTY}
    Log To Console    Status Code: ${response.status_code}
    Log To Console    Resposta: ${response.json()}


*** Test Cases ***
Buscar Usuario Existente
    [Tags]    GET
    Dado que estou conectado na API
    Quando busco um usuario existente
    Então o status code deve ser 200
    E mostro a resposta da API

Buscar Usuario Inexistente
    [Tags]    GET_404
    Dado que estou conectado na API
    Quando busco um usuario inexistente
    Então o status code deve ser 404
    E mostro a resposta da API

Criar Novo Post
    [Tags]    POST
    Dado que estou conectado na API
    Quando envio um novo post
    Então o status code deve ser 201
    E mostro a resposta da API