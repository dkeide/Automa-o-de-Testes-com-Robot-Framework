*** Settings ***
Resource    ../main.robot

*** Keywords ***
Quando busco um usuario existente
    ${response}=    GET On Session    ${SESSION_NAME}    ${USUARIO_EXISTENTE}
    Set Suite Variable    ${response}

Quando busco um usuario inexistente
    ${response}=    GET On Session
    ...    ${SESSION_NAME}
    ...    ${USUARIO_INEXISTENTE}
    ...    expected_status=any
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