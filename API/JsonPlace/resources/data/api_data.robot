*** Settings ***
Resource    ../main.robot

*** Variables ***
${BASE_URL}              https://jsonplaceholder.typicode.com
${USUARIO_EXISTENTE}     /users/1
${USUARIO_INEXISTENTE}   /users/9999
${ENDPOINT_POST}        /posts

# Dados do Post
${POST_TITLE}            Meu Post
${POST_BODY}             Aprendendo API com Robot
${USER_ID}               1

# Status Codes
${STATUS_200}            200
${STATUS_404}            404
${STATUS_201}            201