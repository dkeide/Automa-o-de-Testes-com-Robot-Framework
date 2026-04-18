*** Settings ***
Library     RequestsLibraryLibrary
Library     Collections     

*** Variables ***

# Dados Geral
${URL}              https://jsonplaceholder.typicode.com
${ID_Valido}        /users/1
${ID_Inexistente}   /users/9999
${ENDPOINT}         /posts
${SESSAO}           minhaSessao

# Dados do Post
${POST_TITLE}       Meu Post
${POST_BODY}        Aprendendo API
${USER}             1

# Dados dos Codigos
${STATUS_200}       200 
${STATUS_201}       201
${STATUS_404}       404

*** Keywords ***

Dado que estou conectado na API
    Create Session  ${SESSAO}   ${URL}

Quando busco um usuario existente
    ${response}     GET On Session  ${SESSAO}   ${ID_Valido}
    Set Suite Variable  ${response}

Quando busco um usuario inexistente
    ${response}     GET On Session  
    ...             ${SESSAO}   
    ...             ${ID_Inexistente}
    ...             expected_status=any
    Set Suite Variable  ${response}

Quando envio um Post
    &{body}=    Creat Dictionary
    ...         tittle=${POST_TITLE}
    ...         body=${POST_BODY}
    ...         userid=${USER}
    ${response}     POST On Session
    ...         ${SESSAO} 
    ...         ${ENDPOINT}
    ...         json=${body}
    Set Suite Variable  ${response}

Então o status code deve ser ${status_esperado}
    Should Be Equal As Integers ${response.status_code}     ${status_esperado}

E mostro a resposta da API
    Log to Console      Status: ${response.status_code}
    Log to COnsole      JSON:   ${response.json()}

*** Test Cases ***
Cenário: Buscar Usuário Existente com Sucesso
    [Tags]    buscar_sucesso
    Dado que estou conectado na API
    Quando busco um usuario existente
    Então o status code deve ser ${STATUS_200}
    E mostro a resposta da API

Cenário: Tentar Buscar Usuário Inexistente
    [Tags]    buscar_erro
    Dado que estou conectado na API
    Quando busco um usuario inexistente
    Então o status code deve ser ${STATUS_404}
    E mostro a resposta da API

Cenário: Criar um Novo Post
    [Tags]    criar_post
    Dado que estou conectado na API
    Quando envio um novo post
    Então o status code deve ser ${STATUS_201}
    E mostro a resposta da API