*** Settings ***
Resource    ../main.robot

*** Variables ***

#Elementos de Registro do formulario
&{Cadastro}

...     botaoNovaconta=//a[@href="/r.php?entry_point=login"]
...     nome=//input[@name="firstname"]
...     sobrenome=//input[@name="lastname"]  
...     dia=//select[@id="day"]     
...     mes=//select[@id="month"]   
...     ano=//select[@id="year"]      
...     masculino=//label[@class="_58mt"]//input[@value="2"]
...     celular=//input[@name="reg_email__"]
...     senha=//input[@name="reg_passwd__"]
...     botaoCadastrar=//button[@name="websubmit"]

*** Keywords ***
Dado que eu acesso o site do facebook
    Open Browser                ${geral. URL}                        ${geral. Browser}

Quando clico em criar nova conta
    Wait Until Element Is Visible   ${Cadastro. botaoNovaconta}       5s
    Click Element                   ${Cadastro. botaoNovaconta}

E digito o nome e o sobrenome   
    Wait Until Element Is Visible   ${Cadastro. nome}                 5s
    Input Text                      ${Cadastro. nome}              ${dados_registro. nomeFacebook}
    Input Text                      ${Cadastro. sobrenome}         ${dados_registro. sobrenomeFacebook}

E seleciono a data do meu aniversario
    Select From List By Value       ${Cadastro. dia}                  13
    Select From List By Value       ${Cadastro. mes}                  1 
    Select From List By Value       ${Cadastro. ano}                  2013  

E seleciono o meu genero 
    Wait Until Element Is Visible   ${Cadastro. masculino}              5s
    Click Element                   ${Cadastro. masculino}

E coloco meu numero de telefone 
    Input Text                      ${Cadastro. celular}           ${dados_registro. telefoneFacebook}

E cadastro uma senha
    Input Text                      ${Cadastro. senha}             ${dados_registro. senhaFacebook}

Entao finalizo o cadastro apertando o botao de cadastrar
    Wait Until Element Is Visible   ${Cadastro. botaoCadastrar}        5s
    Click Element                   ${Cadastro. botaoCadastrar}
    Sleep                           5s
    Close Browser