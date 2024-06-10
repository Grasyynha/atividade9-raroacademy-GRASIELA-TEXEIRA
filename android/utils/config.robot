*** Settings ***
Resource    ../../base.robot
Resource   


*** Variables ***
${ANDROID_AUTOMATION_NAME}    UIAutomator2
${ANDROID_PLATFORM_NAME}    Android
${APP_PACKAGE}                 br.com.pztec.estoque
${APP_ACTIVITY}               .ListaAssunto

*** Keywords ***
Abrir App
    Open Application    ${APPIUM:URL}    autoGrantPermissions=${True}    automationName=${ANDROID_AUTOMATION_NAME}    platformName=${ANDROID_PLATFORM_NAME}     AppiumUdid=${APPIUM:UDID}    app=${APPIUM:APP}    appPackage=${APP_PACKAGE}    appActivity=${APP_ACTIVITY}

Teardown
    Run Keyword If Test Failed    Capture Page Screenshot
    Close All Applications