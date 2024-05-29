*** Settings ***
Library    AppiumLibrary

Resource    ../base.robot

*** Variables ***


# Botões do carrossel
${BOTAO_PIX}        xpath=//android.widget.ScrollView/android.widget.HorizontalScrollView[1]/android.widget.Button[1]
${BOTÃO_PAGAR_BOLETOS}    xpath=//android.widget.ScrollView/android.widget.HorizontalScrollView[1]/android.widget.Button[2]
${BOTAO_TRANSFERIR}    xpath=//android.widget.ScrollView/android.widget.HorizontalScrollView[1]/android.widget.Button[3]
${BOTÃO_DEPOSITAR}    xpath=//android.widget.ScrollView/android.widget.HorizontalScrollView[1]/android.widget.Button[4]
${BOTÃO_EMPRESTIMO}    xpath=//android.widget.ScrollView/android.widget.HorizontalScrollView[1]/android.widget.Button[4]
${BOTÃO_RECARGA_CEL}    xpath=//android.widget.ScrollView/android.widget.HorizontalScrollView[1]/android.widget.Button[2]
${BOTÃO_COBRAR_CARROSSEL}    xpath=//android.widget.ScrollView/android.widget.HorizontalScrollView[1]/android.widget.Button[3]
${BOTÃO_DOAÇÃO}    xpath=//android.widget.ScrollView/android.widget.HorizontalScrollView[1]/android.widget.Button[4]
${BOTAO_ENCONTRAR_ATALHOS}    xpath=//android.widget.ScrollView/android.widget.HorizontalScrollView[1]/android.widget.Button[5]

# Página  de PIX
${PAGINA_PIX}        xpath= //android.widget.ImageView[@content-desc="Minha área Pix\nTudo o que você precisa para pagar, transferir ou cobrar.\nPagar\nTransferir\nCobrar"]

${BOTÃO_PAGAR}        xpath=//android.widget.ImageView[@content-desc="Minha área Pix\nTudo o que você precisa para pagar, transferir ou cobrar.\nPagar\nTransferir\nCobrar"]/android.widget.Button[2]
${BOTÃO_TRANSFERIR}    xpath=//android.widget.ImageView[@content-desc="Minha área Pix\nTudo o que você precisa para pagar, transferir ou cobrar.\nPagar\nTransferir\nCobrar"]/android.widget.Button[3]
${BOTÃO_COBRAR}        xpath=//android.widget.ImageView[@content-desc="Minha área Pix\nTudo o que você precisa para pagar, transferir ou cobrar.\nPagar\nTransferir\nCobrar"]/android.widget.Button[4]
${MINHAS_CHAVES}        xpath= //android.widget.ImageView/[@content-desc="Minhas chaves"]
${LIMITE_PIX}        xpath= //android.widget.ImageView/[@content-desc="Meu limite Pix"]
${ME_AJUDA}        xpath= //android.widget.ImageView/ [@content-desc="Me ajuda"]

# Página pagar boletos
${PAGINA_PAGAR_BOLETOS}    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View[1]/android.view.View/android.view.View
${FUNC_PAGAR_COM_PIX}    xpath= //android.widget.ImageView/[@content-desc="Pagar com Pix\nLeia um QR Code ou cole o código."]
${FUNC_PAGAR_FATURA_CARTÕES}    xpath= //android.widget.ImageView/[@content-desc="Pagar fatura do cartão\nLibera o limite do seu Cartão de Crédito."]
${FUNC_PAGAR_BOLETO}    xpath= //android.widget.ImageView/[@content-desc="Pagar um boleto\nContas de luz, água, etc."]

# Página de Transferência
${INPUT_TRANSFERENCIA}    xpath=//android.widget.EditText

# Página Depósito
${PAGINA_DEPOSITO}    xpath= //android.widget.ImageView/[@content-desc="Como você quer depositar na sua conta do Nubank"]
${DEPOSITO_PIX}    xpath= //android.widget.ImageView/[@content-desc="Pix\nSem custo e cai na hora, mesmo de madrugada e fim de semana."]
${DEPOSITO_BOLETO}    xpath= //android.widget.ImageView/[@content-desc="Boleto\nSem custo e pode levar 3 dias úteis para o dinheiro cair."]
${DEPOSITO_TED_DOC}    xpath=//android.view.View[@content-desc="TED/DOC\nPode ter custo e cai somente em horário comercial de dias úteis."]
${DEPOSITO_TRAZER_SALARIO}    xpath=//android.view.View[@content-desc="Trazer seu salário\nReceba todo mês direto aqui na sua conta, sem custo."]

# Página empréstimo
${PAGINA_EMPRESTIMO}    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View[2]
${EMPRESTIMOS_TEXTO1}    xpath=//android.view.View[@content-desc="O valor disponível no momento é de R$ 10.000,00"]
${EMPRESTIMOS_TEXTO2}    xpath=//android.view.View[@content-desc="Este valor pode mudar diariamente devido à nossa análise de crédito."]
${EMPRESTIMOS_LINK}    xpath=//android.view.View[@content-desc="Entenda como funciona >"]
${BOTÃO_NOVO_EMPRESTIMO}    xpath=//android.widget.Button[@content-desc="NOVO EMPRÉSTIMO"]


*** Keywords ***

Verificar Atalhos no Carrossel
    
    # Passo 1: Abrir o aplicativo e garantir que está na homepage
    Open Application    ${APPIUM:APP}    com.ricardodalarme.nubank_clone
    Wait Until Element Is Visible    ${BOTAO_PIX}    timeout=30s
    
    # Passo 2: Verificar a presença de todos os botões do carrossel
    Element Should Be Visible    ${BOTAO_PIX}
    Element Should Be Visible    ${BOTÃO_PAGAR_BOLETOS}
    Element Should Be Visible    ${BOTAO_TRANSFERIR}
    Element Should Be Visible    ${BOTÃO_DEPOSITAR}
    Element Should Be Visible    ${BOTÃO_EMPRESTIMO}
    Element Should Be Visible    ${BOTÃO_RECARGA_CEL}
    Element Should Be Visible    ${BOTÃO_COBRAR_CARROSSEL}
    Element Should Be Visible    ${BOTÃO_DOAÇÃO}
    Element Should Be Visible    ${BOTAO_ENCONTRAR_ATALHOS}
    
    # Passo 3: Verificar funcionalidade de cada botão
    Click Button    ${BOTAO_PIX}
    Wait Until Element Is Visible    ${PAGINA_PIX}    timeout=30s
    Go Back
    
    Click Button    ${BOTÃO_PAGAR_BOLETOS}
    Wait Until Element Is Visible    ${PAGINA_PAGAR_BOLETOS}    timeout=30s
    Go Back
    
    Click Button    ${BOTAO_TRANSFERIR}
    Wait Until Element Is Visible    ${INPUT_TRANSFERENCIA}    timeout=30s
    Go Back
    
    Click Button    ${BOTÃO_DEPOSITAR}
    Wait Until Element Is Visible    ${PAGINA_DEPOSITO}    timeout=30s
    Go Back
    
    Click Button    ${BOTÃO_EMPRESTIMO}
    Wait Until Element Is Visible    ${PAGINA_EMPRESTIMO}    timeout=30s
    Go Back

Verificar Botões na Tela de Conta
       
    # Passo 1: Abrir o aplicativo e navegar até a tela de conta
    Open Application    ${APPIUM:APP}    com.ricardodalarme.nubank_clone
    Wait Until Element Is Visible    ${SALDO}    timeout=30s
    
    # Passo 2: Verificar a presença dos elementos de saldo e histórico
    Element Should Be Visible    ${SALDO}
    Element Should Be Visible    ${HISTORICO}    
    
Quando aperto o botão Pix
    Espera o elemento para clicar    ${BOTAO_PIX}


Quando aperto o botão Pagar
    Espera o elemento para clicar    ${BOTÃO_PAGAR_BOLETOS}

Então consigo visualizar suas funcionalidades
    Wait Until Page Contains Element    ${PAGINA_PAGAR_BOLETOS}
    Checa se o elemento está habilitado    ${FUNC_PAGAR_COM_PIX}    ${FUNC_PAGAR_FATURA_CARTÕES}    ${FUNC_PAGAR_BOLETO}   

Quando aperto o botão transferir
    Espera o elemento para clicar    ${BOTAO_TRANSFERIR}

Então consigo vizualizar a página
    Wait Until Page Contains Element    ${INPUT_TRANSFERENCIA} 
    ${hint}=    Get Element Attribute    ${INPUT_TRANSFERENCIA}    hint
    Should Contain    ${hint}    Qual é o valor da transferência?\nSaldo disponível em conta R$ 181,79    

E fazer uma transferência
    Espera o elemento para fazer o inputtext    ${INPUT_TRANSFERENCIA}    "20,00"


Quando aperto o botão depositar
    Espera o elemento para clicar    ${BOTÃO_DEPOSITAR}


Então posso usar os recursos da seção de depósito
   Wait Until Element Is Visible    ${DEPOSITO_PIX}
   Page Should Contain Text    Como você quer depositar na sua conta do Nubank
   Element Should Be Enabled    ${DEPOSITO_PIX}
   Page Should Contain Text    Pix&#10;Sem custo e cai na hora, mesmo de madrugada e fim de semana.
   Element Should Be Enabled    ${DEPOSITO_BOLETO}
   Page Should Contain Text    Boleto&#10;Sem custo e pode levar 3 dias úteis para o dinheiro cair.
   Element Should Be Enabled    ${DEPOSITO_TED_DOC}
   Page Should Contain Text    TED/DOC&#10;Pode ter custo e cai somente em horário comercial de dias úteis.
   Element Should Be Enabled    ${DEPOSITO_TRAZER_SALARIO}
   Page Should Contain Text    Trazer seu salário&#10;Receba todo mês direto aqui na sua conta, sem custo.

Quando aperto o botão Empréstimos
    Swipe By Percent    50    50    5    50
    Espera o elemento para clicar    ${BOTÃO_EMPRESTIMO}

Então posso usar os recursos da seção de empréstimos
    Wait Until Page Contains Element    ${PAGINA_EMPRESTIMO}
    Checa se o elemento está visível    ${EMPRESTIMOS_TEXTO1}    ${EMPRESTIMOS_TEXTO2}    ${BOTÃO_NOVO_EMPRESTIMO}    ${EMPRESTIMOS_LINK}

Quando aperto o botão Recarga de celular
    Swipe By Percent    90    50    15    50
    Espera o elemento para clicar    ${BOTÃO_RECARGA_CEL}        


Quando faço um swipe do carrossel de botões
    Swipe By Percent    90    50    15    50

Então consigo clicar no botão
    Espera o elemento para clicar e checa se está habilitado    ${BOTÃO_DOAÇÃO}    

Então consigo clicar no botão criar atalhos
    Espera o elemento para clicar e checa se está habilitado    ${BOTAO_ENCONTRAR_ATALHOS} 