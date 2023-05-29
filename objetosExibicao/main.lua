--adicionar uma nova imagem na tela:
-- Comandop: display.newImageReact ("pasta/arquivo.formato", largura, altura)
local bg = display.newImageRect ("imagens/bg.jpg", 1280*1.25, 720*1.25)

-- Definir a localização do objeto.
--Comando: variavel .linha que vou definir = localizaçãi na linha.

bg.x = display.contentCenterX -- Comando que centraliza a variavel em  qualquer resolução.
bg.y = display.contentCenterY -- Cuidar X e Y

local pikachu = display.newImageRect ("imagens/pikachu.png", 1191*0.25, 1254*0.25)

pikachu.x = display.contentCenterX 
pikachu.y = display.contentCenterY 

local charmander =  display.newImageRect ("imagens/charmander.png", 507 *0.8, 492 *0.8)

charmander.x = 200
charmander.y = 480
----
--criando um retÂngulo:
-- comandos: display.newRect(localizacão x, localização Y, largura, altura)

local retangulo= display.newRect(750, 380, 100, 70)

-- criando um circulo
--Comandos: display.newCircle ( x, y, radius(raio(metade do circulo)))
local circulo = display.newCircle (150, 80, 50)

local pokebola = display.newImageRect("imagens/pokeball.png",673 *0.2, 787 *0.2 )

pokebola.x = 145
pokebola.y = 85


local mystery =  display.newImageRect("imagens/mystery.png", 493 *0.5, 506 * 0.5 )  

mystery.x = 745
mystery.y = 320