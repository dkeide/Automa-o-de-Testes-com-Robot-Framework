*** Settings ***
Documentation    Suíte de testes para a API JSONPlaceholder
Resource         ../resources/main.robot

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