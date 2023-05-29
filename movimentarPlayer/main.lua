local bg = display.newImageRect("imagens/sky.png", 960*3, 240*3)
bg.x = display.contentCenterX
bg.y = display.contentCenterY

local chao = display.newImageRect("imagens/ground.png", 1028, 256)
chao.x = display.contentCenterX
chao.y = 490

local player = display.newImageRect("imagens/player.png", 532/3, 469/3)
player.x = 50
player.y = 300

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

-- subir
local function cima ()
    player.y = player.y - 4
end

local moverCima = display.newImageRect ("imagens/button.png", 1280/30 , 1279/30)
moverCima.x = 260
moverCima.y = 400
moverCima.rotation = -90
moverCima:addEventListener ("tap", cima)

--Andar para baixo

local function baixo ()
   player.y = player.y + 4
end


local botaoBaixo = display.newImageRect ("imagens/button.png", 1280/20 , 1279/30)
botaoBaixo.x = 260
botaoBaixo.y = 450
botaoBaixo.rotation = 90
botaoBaixo:addEventListener ("tap", baixo)

local function diagonalDireito ()
    player.x = player.x + 5
    player.y = player.y - 5
end
local botaodiagonalDireito = display.newImageRect ("imagens/button.png", 1280/20 , 1279/30)
botaodiagonalDireito.x = 300
botaodiagonalDireito.y = 400
botaodiagonalDireito.rotation = 315
botaodiagonalDireito:addEventListener ("tap", diagonalDireito)

local function diagonalDireitaBx ()
    player.y = player.y + 30
    player.x = player.x  + 30
end

local botaoDiagonalBx = display.newImageRect ("imagens/button.png", 1280/20 , 1279/30)
botaoDiagonalBx.x = 320
botaoDiagonalBx.y = 475
botaoDiagonalBx.rotation = 45
botaoDiagonalBx:addEventListener ("tap", diagonalDireitaBx)

local function diagonal1 ()
    player.y = player.y -2
    player.x = player.x -2
end

local botaoCimaEsquerdo = display.newImageRect ("imagens/button.png",1280/20 , 1279/30)
botaoCimaEsquerdo.x = 200
botaoCimaEsquerdo.y = 475
botaoCimaEsquerdo.rotation = 225
botaoCimaEsquerdo:addEventListener ("tap", diagonal1)

local function diagonalEsquerdo ()
    player.y = player.y +2
    player.x = player.x -2
end

local botaoDiagoBE = display.newImageRect ("imagens/button.png",1280/20 , 1279/30)
botaoDiagoBE.x = 200
botaoDiagoBE.y = 470
botaoDiagoBE.rotation = 140
botaoDiagoBE:addEventListener ("tap", diagonalEsquerdo)

-- local botaoCima = display.newImageRect("imagens/button.png", 1280/30 , 1279/30)
-- botaoCima.x = 260
-- botaoCima.y = 400
-- botaoCima.rotation = 270
-- botaoCima:addEventListener ("tap", Cima)

-- local function baixo ()
--     player.y = player.y +40
-- end

-- local botaoBaixo = display.newImageRect("imagens/button.png", 1280/30 , 1279/30)
-- botaoBaixo.x = 260
-- botaoBaixo.y = 450
-- botaoBaixo.rotation = 90
-- botaoBaixo.addEventListener("tap", baixo)