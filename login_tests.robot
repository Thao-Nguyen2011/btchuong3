*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}                   https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${BROWSER}               chrome
${USERNAME}              Admin
${PASSWORD}              admin123
${INVALID_PASSWORD}      wrongpassword

*** Test Cases ***

Valid Login
    [Documentation]
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    # Đợi form login hiển thị
    Wait Until Element Is Visible    css=input[name="username"]    timeout=10s
    Input Text    css=input[name="username"]    ${USERNAME}
    Input Text    css=input[name="password"]    ${PASSWORD}
    Click Button    css=button[type="submit"]
    Wait Until Element Is Visible    xpath=//h6[text()="Dashboard"]    timeout=10s
    Page Should Contain Element    xpath=//h6[text()="Dashboard"]
    Capture Page Screenshot
    Close Browser

Invalid Login
    [Documentation]
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    css=input[name="username"]    timeout=10s
    Input Text    css=input[name="username"]    ${USERNAME}
    Input Text    css=input[name="password"]    ${INVALID_PASSWORD}
    Click Button    css=button[type="submit"]
    Wait Until Page Contains    Invalid credentials    timeout=10s
    Page Should Contain    Invalid credentials
    Capture Page Screenshot
    Close Browser
