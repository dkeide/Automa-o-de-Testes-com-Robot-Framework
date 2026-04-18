*** Settings ***
Library    RequestsLibrary
Library    Collections

# Importando Dados
Resource    data/api_data.robot

# Importando Shared
Resource    shared/common.robot

# Importando as Keywords/Pages
Resource    pages/api_keywords.robot