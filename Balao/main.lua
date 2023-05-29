local physics = require ("physics") --> obrigado pora chamar a bliblioteca
physics.start()
    physics.setDrawMode ("normal") 

display.setStatusBar (display.HiddenStatusBar)  --> remover a barra de notificação
local fundo = display.newImageRect("imagens/background.png", 360, 570) --> (fundo é a variavel) display.newImageRect (usado pra chamar a imagem)
fundo.x = display.contentCenterX
fundo.y = display.contentCenterY

local balao = display.newImageRect("imagens/balloon.png", 112, 112)
balao.x = display.contentCenterX
balao.y = display.contentCenterY
physics.addBody ( balao, "dynamic", {radius=50, bouce=0.6} ) -->  dynamic ( interege com outros objetos) bouce ( usado para fazer um retorno aposbater em um objeto ) radius (vai definir o formato do corpo fisico (redondo.. usado sempre a metade do objeto ))


local plataforma = display.newImageRect("imagens/platform.png", 30*10, 50)
plataforma.x =display.contentCenterX
plataforma.y = display.contentHeight - 25
physics.addBody( plataforma, "static") --> fisica estatica, nao interage com a gravidade (rocha)

local numToques = 0 --> variavel (numToques)

local toquesText = display.newText (numToques, display.contentCenterX, 50, native.systemFont, 40) --> chama a variavel toquesText (numToques) (display )
toquesText:setFillColor (0,0,0) --> usado para definir a cor do numero

local function cima () --> chamando a funcão  para fazer a ação subir
    balao:applyLinearImpulse (0, -0.75, balao.x, balao.y) --> inpulso X na orizontal ( balao.X) impulso Y na vertical (balao.Y) (sempre usando por porcentagem) ( sempre usar numero, numeros, depois X e Y)
    -->
    numToques = numToques + 1 --> contando o numero de toques( conta quantos pontos eu quizer dar portoque)
    toquesText.text = numToques--> soma a variavel (Toques) + (numToques) para somar valores 
end --> toda funcao deve ser fechada
local function zerou () --> funcao usada para zerar o placar
    numToques = 0 --> usado para o valor de pontos que recomeca o jogo
    toquesText.text = numToques
end

plataforma:addEventListener ( "collision", zerou) --> quando acontecer essa colisao sera atualizado para zero
balao:addEventListener ("tap", cima) -- atribuimos a variavel balao para um (tap) atribui a funçao cima
