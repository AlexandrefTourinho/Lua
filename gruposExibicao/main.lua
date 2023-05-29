-- criando grupos de exibição

local backGroup = display.newGroup () -- Back usando para plano de fundo, decorações que nao terão interação com o jogo.

local mainGroup = display.newGroup () --Usado para os objetos que terão interação dentro do jogo, grupo principal.

local uiGroup = display.newGroup () --Utilizado para placar, vidas, texto, que ficarão na frente do jogoporém sem interação.
-- Método embutido
--Inclui o objeto no grupo já na sua criação.

local bg = display.newImageRect (backGroup, "imagens/bg.jpg", 509*3, 339*3 ) 

bg.x = display.contentCenterX
bg.Y= display.contentCenterY

-- Método direto:
--Inclui o objeto depois da sua craição.

local chao =  display.newImageRect (mainGroup,"imagens/chao.png", 4503/5, 613/5)
chao.x = display.contentCenterX
chao.y = 430
mainGroup:insert(chao)


local nuvem =  display.newImageRect ("imagens/cloud.png", 2360/5, 984/5)
nuvem.x = display.contentCenterX
nuvem.y = display.contentCenterY
mainGroup:insert(nuvem)

local sol =  display.newImageRect (mainGroup,"imagens/sun.png",256/1.5, 256/1.5)
sol.x = 250
sol.y = 100

local arvore1 =  display.newImageRect ("imagens/tree.png", 1024/5, 1024/5)
arvore1.x = 280
arvore1.y = 320
mainGroup:insert(arvore1)

local arvore2 =  display.newImageRect (mainGroup,"imagens/tree.png", 1024/7.5, 1024/7.5)
arvore2.x = 50
arvore2.y = 350

chao:toFront()




