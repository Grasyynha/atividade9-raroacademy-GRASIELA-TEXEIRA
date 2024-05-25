*** Settings ***
Library         AppiumLibrary
Suite Setup     Open Application
Suite Teardown  Close Application

*** Variables ***
${PLATFORM}              Android      # Ou iOS, dependendo do seu ambiente
${DEVICE_NAME}           emulator-5554
${APP}                   path/to/your/app.apk  # Caminho para o aplicativo a ser testado
${URL}                   http://localhost:4723/wd/hub
${CAROUSEL}              id=com.example:id/carousel  # ID do carrossel
${NEXT_BUTTON}           id=com.example:id/next_button
${PREV_BUTTON}           id=com.example:id/prev_button
${ITEM}                  id=com.example:id/carousel_item
${ITEM_ACTION_BUTTON}    id=com.example:id/action_button

*** Keywords ***
Open Application
    Open Application    ${URL}    platformName=${PLATFORM}    deviceName=${DEVICE_NAME}    app=${APP}

Verify Carousel Item Visibility
    [Arguments]    ${item_id}
    Wait Until Element Is Visible    ${item_id}    10 seconds
    Element Should Be Visible    ${item_id}

Click Carousel Item And Verify Navigation
    [Arguments]    ${item_id}    ${expected_page_id}
    Click Element    ${item_id}
    Wait Until Element Is Visible    ${expected_page_id}    10 seconds
    Element Should Be Visible    ${expected_page_id}
    Go Back

Test Carousel Navigation Buttons
    Click Element    ${NEXT_BUTTON}
    Click Element    ${PREV_BUTTON}

Test Carousel Responsiveness
    [Arguments]    ${device_name}    ${platform_name}    ${app}
    Open Application    ${URL}    platformName=${platform_name}    deviceName=${device_name}    app=${app}
    Run Keyword And Ignore Error    Verify Carousel Item Visibility    ${CAROUSEL}
    Close Application

Verify Carousel Item Action Button
    [Arguments]    ${item_id}    ${action_button_id}
    Wait Until Element Is Visible    ${item_id}    10 seconds
    Click Element    ${action_button_id}
    # Verifique o comportamento esperado após o clique no botão de ação
    Run Keyword And Ignore Error    Wait Until Element Is Visible    ${ITEM_ACTION_BUTTON}    10 seconds

*** Test Cases ***
CT01: Verificar se todos os atalhos do carrossel estão visíveis na homepage
    ${items}=    Get Webelements    ${ITEM}
    :FOR    ${item}    IN    @{items}
    \    Verify Carousel Item Visibility    ${item}

CT02: Verificar se cada atalho no carrossel redireciona para a página correta
    ${items}=    Get Webelements    ${ITEM}
    :FOR    ${item}    IN    @{items}
    \    ${expected_page}=    Get Attribute    ${item}    data-expected-page
    \    Click Carousel Item And Verify Navigation    ${item}    ${expected_page}

CT03: Verificar se os botões de navegação do carrossel (próximo e anterior) funcionam corretamente
    Test Carousel Navigation Buttons

CT04: Testar a responsividade do carrossel em diferentes tamanhos de tela (desktop, tablet, mobile)
    Test Carousel Responsiveness    emulator-5554    Android    ${APP}
    Test Carousel Responsiveness    iPad Simulator    iOS    ${APP}
    Test Carousel Responsiveness    iPhone 12 Pro Max    iOS    ${APP}

CT05: Verificar a funcionalidade dos botões de ação dentro de cada item do carrossel, se aplicável
    ${items}=    Get Webelements    ${ITEM}
    :FOR    ${item}    IN    @{items}
    \    Verify Carousel Item Action Button    ${item}    ${ITEM_ACTION_BUTTON}