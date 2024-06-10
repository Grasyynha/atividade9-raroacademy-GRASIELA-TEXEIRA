*** Settings ***
Resource    ../../base.robot

${botaoNovo}             xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/Button1"]
${botaoAceitarVersao}    xpath=//android.widget.Button[@resource-id="android:id/button1"]
${estoqueProduto}        xpath=//android.widget.LinearLayout[@resource-id="br.com.pztec.estoque:id/linha_parte1"]
${botaoSaidaEstoque}     xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/saida"]
${botaoMenu}             xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/Button3"]


*** Test Cases ***
Cadastrar um novo produto

    Espera o elemento para clicar    ${botaoNovo}

    Wait Until Element Is Visible    ${campoCodigo}
    
    Input Text    ${campoCodigo}
    Input Text    ${campoDescricao}
    Input Text    ${campoUnidade}
    Input Text    ${campoQuantidade}   
    
    Click Button    id=salvar
    Wait Until Element Is Visible    xpath=//td[text()='Produto A']
    Element Should Be Visible    xpath=//td[text()='Produto A']
    [Teardown]    Close Browser

Incrementar quantidade de produto
 
    Open Browser    ${URL}    ${BROWSER}
    Go To    ${URL}/produto/ProdutoA
    Input Text    id=incremento    5
    Click Button    id=incrementar
    Wait Until Element Text Is    id=quantidade    15
    Element Text Should Be    id=quantidade    15
    [Teardown]    Close Browser

Decrementar quantidade de produto
   
    Open Browser    ${URL}    ${BROWSER}
    Go To    ${URL}/produto/ProdutoA
    Input Text    id=decremento    5
    Click Button    id=decrementar
    Wait Until Element Text Is    id=quantidade    5
    Element Text Should Be    id=quantidade    5
    [Teardown]    Close Browser

Decrementar quantidade de produto para valor negativo
   
    Open Browser    ${URL}    ${BROWSER}
    Go To    ${URL}/produto/ProdutoA
    Input Text    id=decremento    15
    Click Button    id=decrementar
    Wait Until Element Is Visible    xpath=//div[@class='error' and contains(text(), 'Estoque não pode ficar negativo')]
    Element Should Be Visible    xpath=//div[@class='error' and contains(text(), 'Estoque não pode ficar negativo')]
    [Teardown]    Close Browser


Funcionalidade de Backup/Restore

*** Test Cases ***
Realizar backup do sistema
  
    Open Browser    ${URL}    ${BROWSER}
    Go To    ${URL}/backup
    Click Button    id=realizar_backup
    Wait Until Element Is Visible    xpath=//div[contains(text(), 'Backup realizado com sucesso')]
    Element Should Be Visible    xpath=//div[contains(text(), 'Backup realizado com sucesso')]
    [Teardown]    Close Browser

Restaurar sistema a partir de backup

    Open Browser    ${URL}    ${BROWSER}
    Go To    ${URL}/restore
    Choose File    id=arquivo_backup    ${CURDIR}/Estoque/backup.csv
    Click Button    id=restaurar
    Wait Until Element Is Visible    xpath=//div[contains(text(), 'Restore realizado com sucesso')]
    Element Should Be Visible    xpath=//div[contains(text(), 'Restore realizado com sucesso')]
    [Teardown]    Close Browser


Funcionalidade de Exportação/Importação de Dados
robot


*** Test Cases ***
Exportar dados do sistema
    
    Open Browser    ${URL}    ${BROWSER}
    Go To    ${URL}/exportar
    Click Button    id=exportar
    Wait Until Element Is Visible    xpath=//div[contains(text(), 'Exportação realizada com sucesso')]
    Element Should Be Visible    xpath=//div[contains(text(), 'Exportação realizada com sucesso')]
    [Teardown]    Close Browser

Importar dados para o sistema
   
    Open Browser    ${URL}    ${BROWSER}
    Go To    ${URL}/importar
    Choose File    id=arquivo_importacao    ${CURDIR}/Estoque/importacao.csv
    Click Button    id=importar
    Wait Until Element Is Visible    xpath=//div[contains(text(), 'Importação realizada com sucesso')]
    Element Should Be Visible    xpath=//div[contains(text(), 'Importação realizada com sucesso')]
    [Teardown]    Close Browser


Funcionalidade de Relatórios

*** Test Cases ***
Gerar relatório de entradas e saídas de produtos
   
    Open Browser    ${URL}    ${BROWSER}
    Go To    ${URL}/relatorios
    Input Text    id=data_inicio    2024-01-01
    Input Text    id=data_fim    2024-01-31
    Click Button    id=gerar_relatorio
    Wait Until Element Is Visible    xpath=//a[@href='relatorio.pdf']
    Element Should Be Visible    xpath=//a[@href='relatorio.pdf']
    [Teardown]    Close Browser

Gerar inventário de estoque
    
    Open Browser    ${URL}    ${BROWSER}
    Go To    ${URL}/inventario
    Click Button    id=gerar_inventario
    Wait Until Element Is Visible    xpath=//a[@href='inventario.pdf']
    Element Should Be Visible    xpath=//a[@href='inventario.pdf']
    [Teardown]    Close Browser


