# 🧪 Automação de Formulário - DemoQA (Robot Framework)

## 📌 Descrição

Projeto de automação de testes end-to-end utilizando Robot Framework para simular o preenchimento completo de um formulário web.

O teste foi desenvolvido com base no formulário disponível no site DemoQA, amplamente utilizado para prática de automação de testes.

## 🌐 Site utilizado

https://demoqa.com/automation-practice-form

## 🚀 Tecnologias utilizadas

* Robot Framework
* SeleniumLibrary
* Python

## 🧪 Cenário automatizado

O projeto realiza a automação completa do formulário de cadastro, incluindo:

* Preenchimento de campos de texto (nome, email, telefone, etc.)
* Seleção de gênero (radio button)
* Seleção de hobbies (checkbox)
* Seleção de data de nascimento (date picker)
* Upload de arquivo
* Preenchimento de endereço
* Seleção de estado e cidade
* Submissão do formulário

Esse tipo de formulário reúne os principais elementos de interface utilizados em aplicações reais, como inputs, botões, seletores e upload de arquivos ([devassure.io][1]).

## 📂 Estrutura do projeto

O projeto segue boas práticas de organização em automação:

* **resources/** → keywords reutilizáveis e elementos
* **suites/** → cenários de teste
* **results/** → relatórios e evidências de execução

## ▶️ Como executar o projeto

1. Instalar dependências:

```
pip install -r requirements.txt
```

2. Executar os testes:

```
robot suites/
```

## 📊 Resultados

Após a execução, são gerados automaticamente:

* log.html
* report.html

Os arquivos ficam disponíveis na pasta **results/** com detalhes da execução dos testes.

## 🎯 Objetivo do projeto

Este projeto tem como objetivo praticar e demonstrar habilidades em:

* Automação de testes web
* Interação com diferentes tipos de elementos HTML
* Estruturação de testes automatizados
* Boas práticas com Robot Framework

## 📌 Observações

Este projeto foi desenvolvido para fins educacionais, simulando um cenário real de automação de formulários.

## 👨‍💻 Autor

Daniel Silveira Keide
📧 [ysilveira@yahoo.com.br](mailto:ysilveira@yahoo.com.br)
🔗 LinkedIn: https://www.linkedin.com/in/daniel-silveira-keide-32393611a

[1]: https://www.devassure.io/docs/DevAssure/Use%20Cases/Complex%20Use%20Cases/Forms/?utm_source=chatgpt.com "Forms | DevAssure"
