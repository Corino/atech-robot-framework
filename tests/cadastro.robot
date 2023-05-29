*** Settings ***

Resource            ../resources/base.robot
#Resource   ${EXECDIR}/resources/base.robot (Por favor depois me dê um feedback do por que não reconheceu o Resource com Execdir)


*** Test Cases ***
Deve cadastrar um novo usuário

    &{user}            Create Dictionary    
    ...    name=Corino Conti    
    ...    email=corinoconti@hotmail.com    
    ...    password=pwd123

    Remove User By Email    ${user}[email]

    Start Session
    Go to signup
    Register user               ${user}
    Notice should be            Boas vindas ao Mark85, o seu gerenciador de tarefas.         
    


Usuário duplicado
    [Tags]    duplicado


    &{user}            Create Dictionary    
    ...    name=Pedro    
    ...    email=pedro@hotmail.com    
    ...    password=pwd123

    Remove User By Email        ${user}[email]

    Start Session
    Go to signup
    Register user                ${user}
    Register user                ${user}
    Notice should be            Oops! Já existe um cadastro com e-mail informado.

Nome deve ser obrigatório
    [Tags]    nome_obg

    Start Session
    Go to signup
    Valida mensagem campo obrigatorio    Informe seu nome completo

Email deve ser obrigatório
    [Tags]    email_obg

    Start Session
    Go to signup
    Valida mensagem campo obrigatorio    Informe seu e-email

Senha deve ser obrigatória
    [Tags]    senha_obg

    Start Session
    Go to signup
    Valida mensagem campo obrigatorio    Informe uma senha com pelo menos 6 digitos



