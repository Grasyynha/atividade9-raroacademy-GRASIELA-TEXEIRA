*** Settings ***
Resource    ../../base.robot

Test Setup        Abrir App
Test Teardown     Teardown

*** Test Cases***

Validar o cadastro de Produto

CT001 - Cadastrar um novo produto
    Dado que estou na página de cadastro de produto
    Quando preencho a descrição com "Produto A"
    e preencho a quantidade em estoque com 10
    e preencho o valor unitário com 50.00
    e clico em "Salvar"
    Então o produto "Produto A" deve estar listado no estoque

CT002 - Controle de Estoque
    Dado que o produto "Produto A" tem 10 unidades em estoque
    Quando incremento a quantidade em 5 unidades
    Então o produto "Produto A" deve ter 15 unidades em estoque

CT003 - Decrementar quantidade de produto
    Dado que o produto "Produto A" tem 10 unidades em estoque
    Quando decremento a quantidade em 5 unidades
    Então o produto "Produto A" deve ter 5 unidades em estoque
