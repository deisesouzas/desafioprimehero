*** Settings ***
Resource          ../resource/resource.robot
Test Setup        Abrir navegador
Test Teardown     Fechar navegador

###SETUP ele roda keywork antes de uma suite ou um teste
###TEARDOWN ele roda keywork depois de uma suite ou um teste

*** Test Case ***
Caso de Teste 01: Pesquisar Produto Existente
    Acessar pagina home do site 
    Digitar o nome do produto "Blouse" no campo de pesquisa
    Clicar no botao pesquisar
    Conferir se o produto "Blouse" foi listado no site 

Caso de Teste 02: Pesquisar Produto não Existente
    Acessar pagina home do site 
    Digitar o nome do produto "ItemNaoExistente" no campo de pesquisa
    Clicar no botao pesquisar
    Conferir mensagem de erro "No results were found for your search "ItemNaoExistente"" 


Caso de Teste 03: Listar Produtos
    Acessar pagina home do site 
    Passar o mouse por cima da categoria "Women" no menu principal superior de categorias
    Clicar na sub categoria "Summer Dresses"
    Conferir se os produtos da sub categoria "Summer Dresses" foram mostrados na pagina


Caso de Teste 04: Adicionar Cliente
    Acessar pagina home do site
    Clicar em "Sign in"
    Informar um e-mail válido
    Clicar em "Create an account"
    Preencher os dados obrigatórios
    Submeter cadastro
    Conferir se o cadastro foi efetuado com sucesso
