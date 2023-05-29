*** Settings ***
Documentation        Página de cadastro

Library        Browser


*** Keyword ***

Go to signup
    Go To            http://localhost:3000/signup
    Get Text           css=form h1        equal        Faça seu cadastro

Register user
    [Arguments]        ${user}

    Fill Text          css=input[name=name]        ${user}[name]
    Fill Text          css=input[name=email]       ${user}[email]
    Fill Text          css=input[name=password]    ${user}[password]

    Click            css=button[type=submit] >> text=Cadastrar

Notice should be 
    [Arguments]      ${message}

    ${notice}        Set Variable    css=.notice p

    Wait For Elements State    ${notice}        visible    5
    Get Text    ${notice}        equal          ${message}

Valida mensagem campo obrigatorio
    [Arguments]    ${message}

    ${alert}        Set Variable    css=.alert-error >> text=${message}

    Click            css=button[type=submit] >> text=Cadastrar
    Wait For Elements State    ${alert}    visible    5
    Get Text    ${alert}    equal    ${message}