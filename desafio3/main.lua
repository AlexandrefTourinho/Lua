local physics = require ("physics") -->Chamar a bliblioteca: a bliblioteca interna de fisica á variavel physic
physics.start () --> iniciar a fisica no projeto 
physics.setGravity (0,9.8) --> Definir a renderização (gravidade) da visualização da fisica (usando somente durante o desenvolvimento para testes ) gravidade 0 é sem gravidade 
physics.setDrawMode ("normal") --> definir o modo de renderização (hybrid, normal, debug) durante a fase de programação do projeto colocar Hybrid mostra os dois, normal mostra as imagens, debug mostra somente  o comprotamento do corpo fisico
display.setStatusBar (display.HiddenStatusBar) --> removendo a barra de notificaçao



local backGroup = display.newGroup () --> Back usando para plano de fundo, decorações que nao terão interação com o jogo. sempre tem q ser colocado antes de qualquer coisa pq se trata do fundo -usado para colocar itens de decoração ( grama, arvore, coisas q nao interege )

local mainGroup = display.newGroup () --> Usado para os objetos que terão interação dentro do jogo, grupo principal. coisas q bate toca quebra passa por cima(coisas que interage com o player)

local groupUI = display.newGroup () --> Utilizado para placar, vidas, texto, BOTOES - PODERES que ficarão na frente do jogoporém sem interação.

local bg = display.newImageRect (backGroup, "imagens/bg.jpg", 509*3, 339*3 ) 

bg.x = display.contentCenterX
bg.Y= display.contentCenterY

-- Método direto:
--Inclui o objeto depois da sua craição.

local chao =  display.newImageRect (mainGroup,"imagens/chao.png", 4503/5, 613/5)
chao.x = display.contentCenterX
chao.y = 430
mainGroup:insert(chao)
local joint

local pokebola = display.newImageRect(mainGroup,"imagens/Pokeball.png",673 *0.2, 787 *0.2 )
pokebola.x = 110
pokebola.y = 200
pokebola:setFillColor (1, 0.2, 0.4)
physics.addBody (pokebola, "static", {isSensor=true})


local pokebola1 = display.newImageRect(mainGroup,"imagens/Pokeball.png",673 *0.2, 787 *0.2 )
pokebola1.x = 245
pokebola1.y = 85
physics.addBody (pokebola1, "dynamic")

local jointPivot = physics.newJoint ("pivot", pokebola, pokebola1, pokebola.x, pokebola.y)
jointPivot.isMotorEnabled = true -- Ativa o motor da junta de pivô
jointPivot.motorSpeed = 40 -- Define a velocidade do torque do motor.
jointPivot.maxMotorTorque = 1000 -- Define o valor máximo da velocidade do torque do motor, utilizado para melhor visualização do efeito.
jointPivot.isLimitEnabled = true -- Determina como ativado os limites de rotação.
jointPivot:setRotationLimits (-60, 360)





-- local staticBox = display.newRect (0, 0, 60, 60)
-- staticBox:setFillColor (0.2, 0.2, 1)
-- physics.addBody (staticBox, "static", {isSensor=true})
-- staticBox.x, staticBox.y = display.contentCenterX, 80

-- local shape = display.newRect (0, 0, 40, 100)
-- shape:setFillColor (1, 0.2, 0.4)
-- physics.addBody (shape, "dynamic")
-- shape.x, shape.y, shape.rotation = 100, staticBox.y-40, 0
