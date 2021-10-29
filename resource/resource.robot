*** Settings ***
Library            SeleniumLibrary
Library            String

*** Variables ***
${URL}                http://automationpractice.com
${BROWSER}            Chrome

&{PESSOA}              nome=Robot    sobrenome=Framework    pwd=123456
...                    endereco=Rua QA, Bairro Robot    cidade=Lauro de Freitas
...                    id_estado=9  cep=12345  telefone=99999999



*** Keywords ***
###SETUP E TEARDOWN
Abrir navegador  
    Open Browser      about:blank    ${BROWSER}
 
Fechar navegador
    Close Browser

##passo-a-passo
Acessar pagina home do site 
    Go To                http://automationpractice.com 
    Title Should Be      My Store

Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Input Text        name=search_query    ${PRODUTO}    

Clicar no botao pesquisar
    Click Element    xpath=//button[@name="submit_search"]

Conferir se o produto "${PRODUTO}" foi listado no site
    wait Until Element Is Visible     xpath=//*[@id="center_column"]//*[@src='http://automationpractice.com/img/p/7/7-home_default.jpg']

Conferir mensagem de erro "${MSG_ERROR}"
    Wait until Element Is Visible    xpath=//p[@class='alert alert-warning']
    Element Text Should Be           xpath=//p[@class='alert alert-warning']    ${MSG_ERROR}

Passar o mouse por cima da categoria "${CATEGORIA}" no menu principal superior de categorias
    Wait Until Element Is Visible        xpath=//a[@title='${CATEGORIA}']
    Mouse Over                           xpath=//a[@title='${CATEGORIA}']

Clicar na sub categoria "${SUBCAT}"
    Wait Until Element Is Visible        xpath=//*[@id="block_top_menu"]//a[@title="${SUBCAT}"] 
    Click Element                        xpath=//*[@id="block_top_menu"]//a[@title="${SUBCAT}"]

Conferir se os produtos da sub categoria "${SUBCAT}" foram mostrados na pagina
    Wait Until Element Is Visible        xpath=//span[@class="cat-name"]

Clicar em "Sign in"
    Click Element    xpath=//*[@id="header"]//*[@class="login"][contains(text(),"Sign in")]
    

Informar um e-mail válido
    Wait Until Element Is Visible   id=email_create
    # Gerar uma palavra aleatória e usar como e-mail
    ${EMAIL}                        Generate Random String
    Input Text                      id=email_create    ${EMAIL}@testerobot.com

Clicar em "Create an account"
    Click Button    id=SubmitCreate
    

Preencher os dados obrigatórios
    Wait Until Element Is Visible   xpath=//*[@id="account-creation_form"]//h3[contains(text(),"Your personal information")]
    Click Element                   id=id_gender2
    Input Text                      id=customer_firstname    ${PESSOA.nome}
    Input Text                      id=customer_lastname     ${PESSOA.sobrenome}
    Input Text                      id=passwd                ${PESSOA.pwd}
    Input Text                      id=address1              ${PESSOA.endereco}
    Input Text                      id=city                  ${PESSOA.cidade}
    Set Focus To Element            id=id_state
    Select From List By Index       id=id_state              ${PESSOA.id_estado}
    Input Text                      id=postcode              ${PESSOA.cep}
    Input Text                      id=phone_mobile          ${PESSOA.telefone}

Submeter cadastro
    Click Button    submitAccount

Conferir se o cadastro foi efetuado com sucesso
    Wait Until Element Is Visible    xpath=//*[@id="center_column"]/p
    Element Text Should Be           xpath=//*[@id="center_column"]/p
    ...    Welcome to your account. Here you can manage all of your personal information and orders.
    Element Text Should Be           xpath=//*[@id="header"]/div[2]//div[1]/a/span    ${PESSOA.nome} ${PESSOA.sobrenome}    