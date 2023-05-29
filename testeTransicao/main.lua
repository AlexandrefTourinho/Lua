local bg = display.newImageRect("imagens/sky.png", 960*3, 240*3)
bg.x = display.contentCenterX
bg.y = display.contentCenterY

local chao = display.newImageRect("imagens/ground.png", 1028, 256)
chao.x = display.contentCenterX
chao.y = 490

local player = display.newImageRect("imagens/player.png", 532/3, 469/3)
player.x = 50
player.y = 300
transition.to (player, {transition = easing.outInElastic, time=3000, rotation = -90, yScale=1, alpha=1, iterations =-1})



-- Andar para a direita
local function direita ()
     player.x =player.x + 2
end

local botaoDireita = display.newImageRect("imagens/button.png", 1280/20 , 1279/20)
botaoDireita.x = 300
botaoDireita.y = 430
botaoDireita:addEventListener ("tap", direita)

local function esquerdo ()
   player.x = player.x  - 2
end

local botaoEsquerdo = display.newImageRect("imagens/button.png", 1280/20 , 1279/20)
botaoEsquerdo.x = 220
botaoEsquerdo.y = 430
botaoEsquerdo.rotation = 180
botaoEsquerdo:addEventListener("tap", esquerdo)
local localizacaoX = 200    
local localizacaoY = 350

local vertices = {  0, -110, 27, -35, 105, -35, 43, 16, 65, 90, 0, 45, -65, 90,- 43, 15, -105, -35, -27, -35 }

local estrela = display.newPolygon ( 250, 230, vertices)

transition.to (estrela,   { time=3000, y=200, rotation = 360, yScale=2, alpha=0.5, iterations =-1, transition=easing.inBounce})
estrela:setFillColor( 1, 0.9, 1 )
