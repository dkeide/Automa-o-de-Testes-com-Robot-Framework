*** Settings ***
Resource    ../../resources/main.robot

*** Test Cases ***

Cenário 1: Fazer uma conta no Facebook

    Dado que eu acesso o site do facebook   
    Quando clico em criar nova conta
    E digito o nome e o sobrenome 
    E seleciono a data do meu aniversario
    E seleciono o meu genero
    E coloco meu numero de telefone
    E cadastro uma senha
    Entao finalizo o cadastro apertando o botao de cadastrar