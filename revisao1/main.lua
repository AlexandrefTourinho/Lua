local physics = require ("physics") -->Chamar a bliblioteca: a bliblioteca interna de fisica á variavel physic
physics.start () --> iniciar a fisica no projeto 
physics.setGravity (0,0) --> Definir a renderização (gravidade) da visualização da fisica (usando somente durante o desenvolvimento para testes ) gravidade 0 é sem gravidade 
physics.setDrawMode ("hybrid") --> definir o modo de renderização (hybrid, normal, debug) durante a fase de programação do projeto colocar Hybrid mostra os dois, normal mostra as imagens, debug mostra somente  o comprotamento do corpo fisico
display.setStatusBar (display.HiddenStatusBar) --> removendo a barra de notificaçao

local backGroup = display.newGroup () --> Back usando para plano de fundo, decorações que nao terão interação com o jogo. sempre tem q ser colocado antes de qualquer coisa pq se trata do fundo -usado para colocar itens de decoração ( grama, arvore, coisas q nao interege )

local mainGroup = display.newGroup () --> Usado para os objetos que terão interação dentro do jogo, grupo principal. coisas q bate toca quebra passa por cima(coisas que interage com o player)

local groupUI = display.newGroup () --> Utilizado para placar, vidas, texto, BOTOES - PODERES que ficarão na frente do jogoporém sem interação.

--Variavel de controle
local pontos = 0 --> criando numeros de pontos para soma
local vidas = 5 --> criando limite de vidas para o jogo

--> sempre usar clareza para variavel ( se é nuvem colocar nuvem, pedra colocar pedra ) para nao ter problema no codigo 
local fundo = display.newImageRect (backGroup,"imagens/fundo.jpg", 970*2, 546*2) --> colocando imagens no projeto - adicionando no grupo ( backGroup)
fundo.x = display.contentCenterX --> dimensionando a imagen ( X para os lados - centralizada)
fundo.y = display.contentCenterY --> dimensionando a imagen ( Y para cima ou baixo centralizada )

local pontosText = display.newText (groupUI, "Pontos: " .. pontos, 90, 30, native.systemFont,30) --> adicionando placar na tela (variavel pontos) (display para mostra na tela) adicionando no grupo  groupUI - localizacao (100, 30) com a fonte definido nativo
pontosText:setFillColor ( 1, 9, 0 )  --> colocando a cor

local vidasText = display.newText (groupUI, "Vidas: " ..vidas, 300, 30, native.systemFont,30)  --> adicionando vidas na tela (variavel quantidade de vidas) (display para mostra na tela) adicionando no grupo  groupUI - localizacao (200, 30) com a fonte definido nativo
vidasText:setFillColor ( 1, 9, 0 ) --> colocando a cor das vidas


local mzumbi= display.newImageRect (mainGroup,"imagens/matadorzumbi.png", 225*2, 225*2) --> colocando imagem matador (com x2 para colocar um tamanho maior) - adicionando no grupo ( mainGroup - aonde deve ficar os player)
mzumbi.x = 130 --> dimensionando a imagem ( X para os lados - direcionado para esquerda (130))
mzumbi.y = 500 --> dimensionando a imagem ( Y para cima ou baixo direcionado para baixo (500))
mzumbi.myName = "Matador de zumbi" --> cirnado o nome do player (interno) usado para colisao se nao colocar naop vai conseguir chamar para a acao de colidir
physics.addBody (mzumbi, "kinematic") --> add um corpo fisico na imagem e definando o tipo de interaçao (kinematic) sem isso ele nao vai interagir 

local botaoCima = display.newImageRect(mainGroup,"imagens/button.png", 1280/20 , 1279/20) --> criando botao
botaoCima.x = 240
botaoCima.y = 700
botaoCima.rotation = -90

local botaoBaixo = display.newImageRect(mainGroup,"imagens/button.png", 1280/20 , 1279/20) --> criando botao
botaoBaixo.x = 160 --> localizacao do botao
botaoBaixo.y = 700
botaoBaixo.rotation = 90 --> add rotaçao do botao 

local function cima () --> add funcao para ir para cima 
    mzumbi.y = mzumbi.y - 10 --> localizacao de onde o player va ise movimentar e usamos (-10) para definir a quantidade de pixel
end
    
local function baixo () --> add funcao para ir para baixo
    mzumbi.y = mzumbi.y + 10 --> localizacao de onde o player va ise movimentar e usamos (-10) para definir a quantidade de pixel
end

local zumbi = display.newImageRect (mainGroup,"imagens/zumbi.png", 238*1.5, 212*1.5) --> colocando primeiro imagem zumbi - adicionando no grupo ( mainGroup - aonde deve ficar os player)
zumbi.x= 520 --> dimensionando a imagem ( X para os lados - direcionado para o centro (520))
zumbi.y= 500



local zumbi1 = display.newImageRect (mainGroup,"imagens/zumbi2.png", 249*3, 130*2.5) --> colocando a segunda imagem zumbi - adicionando no grupo ( mainGroup - aonde deve ficar os player)
zumbi1.x= 730 --> dimensionando a imagem ( X para os lados - direcionado para a direita (730))
zumbi1.y= 500



local zumbi2 = display.newImageRect (mainGroup,"imagens/zumbi3.png", 225*2, 225*2) --> colocando a terceira imagem zumbi 3 - adicionando no grupo ( mainGroup - aonde deve ficar os player)
zumbi2.x= 980 --> dimensionando a imagem ( X para os lados - direcionado para a direita (730))
zumbi2.y= 500

