local scriptPlayer = require ("Player")
local scriptInimigo = require ("Inimigo")
local scriptHUD =  require ("HUD")
local scriptColetavel = require ("Coletavel")

local physics = require ("physics")-- Chamar a biblioteca de física 
physics.start ()-- Iniciar o motor de física
physics.setGravity (0, 9.8)-- Definir a gravidade.
physics.setDrawMode ("normal")-- normal, hybrid, debug
display.setStatusBar (display.HiddenStatusBar)-- Remover a barra de notificações.


local bg = display.newImageRect ("imagens/bg.png",800*0.7, 600*0.7)
bg.x = display.contentCenterX
bg.y = display.contentCenterY

local hud = scriptHUD.novo ()

local chao = display.newImageRect ("imagens/chao.png", 4503/5, 613/5)
chao.x = display.contentCenterX
chao.y = display.contentHeight+10
physics.addBody (chao, "static", {friction = 1, box = {x=0, y=0, halfWidth=480, halfHeight=40, angle=0}})
chao.id = "chao"
-- parametros para criar a box{x referente a imagem, y referente a imagem = metade da largura da box=, metade da altura da box=, angulo da box}}
physics.addBody (chao, "static", {friction = 1, box = {x=0, y=0, halfWidth= 480, halfHeight=40, angle=0}})

local inimigo = scriptInimigo.novo (400, 250)

local Player = scriptPlayer.novo (40,200, hud)
-- apos um segundo , cria- se moeda1 = chmassea funçõ - nova moeda " scriptColetavel" x=mth.random, y=-100 -- depois a quantidade da repticao  ( 0 é infinito) nome do timer
timer.performWithDelay(1000, function ()--criado um timer 
    local moeda1 = scriptColetavel.novaMoeda(math.random (0, 480), -100)
    
end, 0, "timerMoeda")-- criamos um nome para o timer 