-- Chamar a biblioteca de física 
local physics = require ("physics")
-- Iniciar o motor de física
physics.start ()
-- Definir a gravidade.
physics.setGravity (0, 0)
-- Definir o modo de renderização 
physics.setDrawMode ("normal") -- normal, hybrid, debug

-- Remover a barra de notificações.
display.setStatusBar (display.HiddenStatusBar)

-- criar os grupos de exibição.
local grupoBg = display.newGroup() -- Objetos decorativos, cenário (não tem interação)
local grupoMain = display.newGroup() -- Bloco principal (tudo que precisar interagir com o player fica nesse grupo)
local grupoUI = display.newGroup() -- Interface do usuário (placares, botões...)

-- Criar variáveis de pontos e vidas para atribuição de valor.
local pontos = 0
local vidas = 5

-- Adicionar background
--           (grupo, "pasta/nome do arquivo.formato", largura, altura)
local bg = display.newImageRect (grupoBg, "imagens/bg.jpg", 728*1.2, 410*1.2)
-- localização da imagem
bg.x = display.contentCenterX -- localização horizontal
bg.y = display.contentCenterY -- localização vertical 

-- Adicionar placar na tela. 
-- (grupo, "Escreve o que irá aparecer na tela", localizaçãoX, localizaçãoY, fonte, tamanho da fonte)
local pontosText = display.newText (grupoUI, "Pontos: " .. pontos, 100, 30, native.systemFont, 20)
-- Altera a cor da variável.
pontosText:setFillColor (0/255, 0/255, 0/255)

local vidasText = display.newText (grupoUI, "Vidas: " .. vidas, 200, 30, native.systemFont, 20)
vidasText:setFillColor (0, 0, 0)

-- Adicionar herói 
local player = display.newImageRect (grupoMain, "imagens/harry.png", 324*0.3, 324*0.3)
player.x = 30
player.y = 370
player.myName = "Harry"
-- Adicionar corpo físico a imagem.
physics.addBody (player, "kinematic") -- colide apenas com dinâmico e não tem interferência da gravidade.

-- Criar botões: 
local botaoCima = display.newImageRect (grupoMain,"imagens/button.png", 1280/22, 1279/22)
botaoCima.x = 240
botaoCima.y = 440
botaoCima.rotation = -90 -- faz a rotação da imagem em x graus.

local botaoBaixo = display.newImageRect (grupoMain, "imagens/button.png", 1280/22, 1279/22)
botaoBaixo.x = 80
botaoBaixo.y = 440
botaoBaixo.rotation = 90

-- Adicionar funções de movimentação
local function cima ()
    player.y = player.y - 10
end 

local function baixo  ()
    player.y = player.y + 10
end 

-- Adicionar o ouvinte e a função ao botão.
botaoCima:addEventListener ("tap", cima)
botaoBaixo:addEventListener ("tap", baixo)

-- Adicionar botão de tiro:
local botaoTiro = display.newImageRect (grupoMain, "imagens/tiro.png", 360/5, 360/5)
botaoTiro.x = display.contentCenterX 
botaoTiro.y = 440

-- Função para atirar: 
local function atirar ()
    -- Toda vez que a função for executada cria-se um novo "tiro"
    local feiticoPlayer = display.newImageRect (grupoMain, "imagens/laserAzul.png", 583*0.1, 428*0.1)
    -- a localização é a mesma do player
    feiticoPlayer.x = player.x 
    feiticoPlayer.y = player.y 
    physics.addBody (feiticoPlayer, "dynamic", {isSensor=true}) -- determinamos que o projétil é um sensor, o que ativa a detecção contínua de colisão.
    -- Transição do projétil para linha x=500 em 900 milisegundos.
    transition.to (feiticoPlayer, {x=500, time=900, 
    -- Quando a transição for completa
                    onComplete = function () 
    -- Removemos o projétil do display.                    
                     display.remove (feiticoPlayer) 
                    end})
    feiticoPlayer.myName = "Stupefy"
    feiticoPlayer:toBack () -- Joga o elemento pra trás dentro do grupo de exibição dele.
end 

botaoTiro:addEventListener ("tap", atirar)

-- Adicionando inimigo
local inimigo = display.newImageRect (grupoMain, "imagens/voldemort.png", 500*0.3, 500*0.3)
inimigo.x = 270
inimigo.y = 370
inimigo.myName = "Voldemort"
physics.addBody (inimigo, "kinematic")
local direcaoInimigo = "cima"

-- Função para inimigo atirar: 
local function inimigoAtirar ()
    local tiroInimigo = display.newImageRect (grupoMain, "imagens/laserVerde.png", 583*0.1, 428*0.1)
    tiroInimigo.x = inimigo.x - 50
    tiroInimigo.y = inimigo.y 
    tiroInimigo.rotation = 180
    physics.addBody (tiroInimigo, "dynamic", {isSensor=true})
    transition.to (tiroInimigo, {x=-200, time=900,
                    onComplete = function () 
                        display.remove (tiroInimigo) 
                    end})
    tiroInimigo.myName = "AvadaKedavra"
end

-- Criando o timer de disparo do inimigo:
-- Comandos timer: (tempo repetição, função, quantidade de repetições)
inimigo.timer = timer.performWithDelay (math.random (1000, 1500), inimigoAtirar, 0)

-- Movimentação do inimigo: 
local function movimentarInimigo ()
-- se a localização x não for igual a nulo então
    if not (inimigo.x == nil ) then 
-- Quando a direção do inimigo for cima então
        if (direcaoInimigo == "cima" ) then 
            inimigo.y = inimigo.y - 1
--  Se a localização y do inimigo for menor ou igual a 50 então 
            if (inimigo.y <= 50 ) then
            -- altera a variável para "baixo"
                direcaoInimigo = "baixo"
            end -- if (inimigo.y.....)
-- se a direção do inimigo for igual a baixo então        
        elseif (direcaoInimigo == "baixo" ) then
            inimigo.y = inimigo.y + 1 
-- Se a localização y do inimigo for maior ou igual a 400 então 
            if (inimigo.y >= 400 ) then 
                direcaoInimigo = "cima"
            end --if (inimigo.y ....)
        end -- if (direcaoInimigo....)
-- Se não 
    else 
        print ("Inimigo morreu!")
-- Runtime: representa todo o jogo (evento é executado para todos), enterframe: está ligado ao valor de FPS do jogo (frames por segundo), no caso, a função vai ser executada 60 vezes por segundo.
        Runtime:removeEventListener ("enterFrame", movimentarInimigo)
    end 
end 

Runtime:addEventListener ("enterFrame", movimentarInimigo)

-- Função de colisão: 
local function onCollision (event)
-- Quando a fase de evento for began então
    if (event.phase == "began" ) then
-- Variáveis criadas para facilitar a escrita do código.
        local obj1 = event.object1
        local obj2 = event.object2
-- Quando o myName do objeto 1 for ... e o nome do obj2 for ...
        if ((obj1.myName == "Stupefy" --[[Projétil player]] and obj2.myName == "Voldemort"--[[Inimigo]]) or (obj1.myName == "Voldemort" --[[Inimigo]] and obj2.myName == "Stupefy"--[[Projétil player]] )) then 
        -- Se o obj1 for ... then 
            if (obj1.myName == "Stupefy") then
        -- Remove o projétil do jogo.
                display.remove (obj1)
            else 
                display.remove (obj2)
            end 
-- Somar 10 pontos a cada colisão 
            pontos = pontos + 10
-- Atualizo os pontos na tela.
            pontosText.text = "Pontos: " .. pontos
-- Se obj1 for Player e o 2 for projétil do inimigo ou vice versa então    
        elseif ((obj1.myName == "Harry" and obj2.myName == "AvadaKedavra") or (obj1.myName == "AvadaKedavra" and obj2.myName == "Harry")) then 
            if (obj1.myName == "AvadaKedavra") then
                display.remove (obj1)
            else 
                display.remove (obj2)
            end 
-- Reduz uma vida do player a cada colisão 
        vidas = vidas - 1
        vidasText.text = "Vidas: " .. vidas
            if (vidas <= 0) then 
                Runtime:removeEventListener ("collision", onCollision)
                Runtime:removeEventListener ("enterFrame", movimentarInimigo)
                timer.pause (inimigo.timer)
                botaoBaixo:removeEventListener ("tap", baixo)
                botaoCima:removeEventListener ("tap", cima)
                botaoTiro:removeEventListener ("tap", atirar)

                local gameOver = display.newImageRect (grupoUI, "imagens/gameOver.png", 1080/5, 1080/5)
                gameOver.x = display.contentCenterX
                gameOver.y = display.contentCenterY
            end 
        end -- fecha o if myName
    end -- Fecha o if event.phase
end -- fecha a function

Runtime:addEventListener ("collision",onCollision)