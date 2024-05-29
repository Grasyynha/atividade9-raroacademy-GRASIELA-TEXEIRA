*** Settings ***
Resource    ../utils/config.robot

Test Setup        Abrir App
Test Teardown     Teardown

*** Test Cases***

Validar a tela de CARROSSEL e seus botões

CT001 - Usuario esta na homepage
    Dado que o usuário está na homepage
    Quando o usuário visualiza o menu carrossel
    Então o usuário verifica se todos os atalhos estão presentes e funcionando corretamente

CT002 - Validar saldo e histórico da conta
    Dado que o usuário está na tela de conta
    Quando o usuário verifica o saldo e histórico
    Então o usuário verifica se os botões disponíveis estão corretos    

CT003 - Verificar se o histórico de transações é exibido corretamente e está atualizado.
    Dado que estou logado na minha conta bancária
    Quando eu navego para a página de histórico de transações
    Então meu histórico de transações deve ser exibido corretamente na tela    

CT004 - Usuário deve conseguir interagir a seção de pix
    Dado que acessei o aplicativo Nubank Clone
    Quando aperto o botão Pix 
    Então tenho acesso às suas funcionalidades

CT005 - O Usuario deve conseguir interagir com a seção de pagar boletos
    Dado que acessei o aplicativo Nubank Clone
    Quando aperto o botão Pagar
    Então consigo visualizar suas funcionalidades

CT006 - O Usuario deve conseguir interagir com a seção de transferir
    Dado que acessei o aplicativo Nubank Clone
    Quando aperto o botão transferir
    Então consigo vizualizar a página
    E fazer uma transferência

CT007 - O usuário deve conseguir interagir com a seção de depositar
    Dado que acessei o aplicativo Nubank Clone
    Quando aperto o botão depositar
    Então posso usar os recursos da seção de depósito

CT008 - Testar a funcionalidade do botão de seleção de método de depósito.
   Dado que o usuário está logado no sistema bancário
   Quando o usuário navega para a página de depósito
   Entao o botão de seleção de método de depósito deve estar visível

CT009 - Verificar a funcionalidade do botão de confirmação de depósito.
   Dado o usuário está logado no sistema bancário
   Quando o usuário navega para a página de depósito
   Então o botão de confirmação de depósito deve estar visível


CT010 - O usuário deve conseguir interagir com a sessão de Empréstimo
    Dado que acessei o aplicativo Nubank Clone
    Quando aperto o botão Empréstimos
    Então posso usar os recursos da seção de empréstimos

CT011 - Verificar se o formulário de solicitação de empréstimo é exibido corretamente.
   Dado que estou logado na minha conta de cliente
   Quando eu navego para a página de solicitação de empréstimo
   Então o formulário de solicitação de empréstimo deve estar visível


CT0012 - Testar a funcionalidade do botão de cálculo de parcelas.
   Dado que estou na página de solicitação de empréstimo
   E o botão de cálculo de parcelas está visível
   Quando eu preencho o valor do empréstimo, o prazo de pagamento e a finalidade do empréstimo
   E eu clico no botão de cálculo de parcelas
   Quando o sistema deve calcular o valor das parcelas corretamente
   E o valor das parcelas deve ser exibido na página


CT013 - Validar tela de Cartão de crédito
    Dado que o usuário está na tela de Cartão de crédito
    Quando o usuário verifica os elementos na tela
    Então o usuário verifica se os botões estão corretos

CT014 - Verificar se o saldo do cartão de crédito é exibido corretamente.
    Dado que o usuário está logado no sistema bancário
    Quando o usuário navega para a página de resumo do cartão de crédito
    Então o saldo do cartão de crédito deve ser exibido corretamente




