*** Settings ***
Resource    ../main.robot

*** Variables ***

#Elementos de Registro do formulario
&{formulario}
...  PrimeiroNome=//input[@placeholder="First Name"]
...  UltimoNome=//input[@placeholder="Last Name"]
...  Email=//input[@placeholder="name@example.com"]
...  Male=//label[@for="gender-radio-1"]
...  telefone=//input[@id="userNumber"]
...  DataDeAniversario=//input[@id="dateOfBirthInput"]
...  selecionarMes=//select[@class='react-datepicker__month-select']
...  selecionarAno=//select[@class='react-datepicker__year-select']
...  selecionarDia=//div[@aria-label='Choose Sunday, November 10th, 1996']
...  digitaAssunto=//input[@id="subjectsInput"]
...  Hobbies=//label[@for="hobbies-checkbox-1"]
...  Imagem=//input[@id="uploadPicture"]
...  upload=C:/Users/Usuario/Downloads/pexels-parimoofarhaan-32105666.jpg
...  digitaDescricao=//textarea[@placeholder="Current Address"]
...  dropdownEstado=//div[@id="state"]
...  selecionarEstado=//div[@id="state"]//input
...  confirmarEstado=(//div[contains(@class,'menu')]//div[contains(@class,'option')])[1]
...  dropdownCidade=//div[@id="city"]
...  selecionarCidade=//div[@id="city"]//input
...  confirmarCidade=(//div[contains(@class,'menu')]//div[contains(@class,'option')])[1]
...  botaoSubmit=//button[@id="submit"]
...  sroll_fim_pagina=window.scrollTo(0, document.body.scrollHeight)

*** Keywords ***

Dado que eu acesso o site 
    Open Browser                            ${geral. URL}                           ${geral. Browser}
    Maximize Browser Window
    Sleep                                   1s
    
Quando digito nome e sobrenome
    Input Text                              ${formulario. PrimeiroNome}             ${dados_registro. nome}  
    Input Text                              ${formulario. UltimoNome}               ${dados_registro. sobrenome}
    

E digito o email
    Input Text                              ${formulario. Email}                    ${dados_registro. meuEmail}

E seleciono o sexo
    Wait Until Element Is Visible           ${formulario. Male}                     5s
    Click Element                           ${formulario. Male}

E seleciono meu telefone
    Input Text                              ${formulario. telefone}                 ${dados_registro. meuTelefone}

E coloco a data do meu data do meu aniversario
    Wait Until Element Is Visible           ${formulario. DataDeAniversario}        5s
    Click Element                           ${formulario. DataDeAniversario}
    Select From List By Value               ${formulario. selecionarMes}            ${dados_registro. mes} 
    Select From List By Value               ${formulario. selecionarAno}            ${dados_registro. ano}
    Wait Until Element Is Visible           ${formulario. selecionarDia}            5s
    Click Element                           ${formulario. selecionarDia}

E digito algum assunto
    Input Text                              ${formulario. digitaAssunto}            ${dados_registro. assunto}
    Sleep                                   3s
E seleciono meu hobbie
    Wait Until Element Is Visible           ${formulario. Hobbies}                  5s
    Click Element                           ${formulario. Hobbies}

E carrego uma imagem 
    Choose File                             ${formulario. Imagem}                   ${formulario. upload}

E digito uma descricao
    Wait Until Element Is Visible           ${formulario. digitaDescricao}          5s
    Input Text                              ${formulario. digitaDescricao}          ${dados_registro. descricao}
    Execute JavaScript                      ${formulario. sroll_fim_pagina}
    Sleep                                   1s  

E seleciono estado e cidade
    Click Element                           ${formulario. dropdownEstado}           
    Input Text                              ${formulario. selecionarEstado}         ${dados_registro. estado}
    Click Element                           ${formulario. confirmarEstado}         
    Wait Until Element Is Visible           ${formulario. dropdownCidade}           5s 
    Click Element                           ${formulario. dropdownCidade} 
    Input Text                              ${formulario. selecionarCidade}         ${dados_registro. cidade}
    Click Element                           ${formulario. confirmarCidade}                
    Sleep                                   3s
      
Entao clico em submit  
    Wait Until Element Is Visible           ${formulario. botaoSubmit}              5S  
    Click Element                           ${formulario. botaoSubmit}              
    Sleep                                   5s    
    Close Browser