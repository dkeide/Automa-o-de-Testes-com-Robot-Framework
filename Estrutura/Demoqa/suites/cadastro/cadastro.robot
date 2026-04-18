*** Settings ***
Resource    ../../resources/main.robot

*** Test Cases ***

Cenário 1: Preencher Campos

    Dado que eu acesso o site                                                                 
    Quando digito nome e sobrenome
    E digito o email
    E seleciono o sexo
    E seleciono meu telefone
    E coloco a data do meu data do meu aniversario
    E digito algum assunto
    E seleciono meu hobbie
    E carrego uma imagem 
    E digito uma descricao
    E seleciono estado e cidade
    Entao clico em submit