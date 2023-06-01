local physics = require("physics") -->Chamar a bliblioteca: a bliblioteca interna de fisica á variavel physic
physics.start () --> iniciar a fisica no projeto 
physics.setGravity (2,9.8) --> Definir a renderização da visualização da fisica (usando somente durante o desenvolvimento para testes ) 
physics.setDrawMode ("hybrid")

display.setStatusBar (display.HiddenStatusBar) --> removendo a barra de notificaçao

local cima = display.newRect (display.contentCenterX, 0, 500, 50)
physics.addBody (cima, "static")
cima.myName = "Teto"

local baixo = display.newRect (display.contentCenterX, 480, 500, 50)
physics.addBody (baixo, "static")
baixo.myName = "chao"

local esquerda = display.newRect (-15, display.contentCenterY, 50,500)
physics.addBody (esquerda, "static")
esquerda.myName = "Parede Esquerda"

local direita = display.newRect (330, display.contentCenterY, 50, 500)
physics.addBody (direita, "static")
direita.myName = "Parede direita" --> nomeia a funcao de colisao 

local bola1= display.newImageRect ("imagens/bola1.png", 481*0.2, 518*0.2)
bola1.x= display.contentCenterX
bola1.y= display.contentCenterY
physics.addBody (bola1, {bounce=0.8, radius=48})
bola1.myName = "Bola um"

local bola2= display.newImageRect ("imagens/bola2.png", 500*0.2, 500*0.2)
bola2.x= display.contentCenterX
bola2.y = 100
physics.addBody (bola2, {bounce=0.5, radius=45})
bola2.myName = "Bola dois"

-- colisão local: 

local function colisaoLocal (event)

    if (event.phase == "began") then    --> se a fase de colisão  for igual a began então


        print ("Algo colidiu!") --> print a colisão
     --> se nao 
    else
        --> Print do fim da colisão
        print ("Fim da colisão")

    end
end

bola1:addEventListener ("collision", colisaoLocal)

-- colisao Global
local function colisaoGlobal (event)

    if (event.phase == "began") then 

        print ("began: "..event.object2.myName.. "e" .. event.object2.myName)

    elseif (event.phase == "ended") then

        print ("ended: "..event.object1.myName.. "e" .. event.object1.myName.. "e" .. event.object2.myName)
    end
end


Runtime:addEventListener ("collision", colisaoGlobal)

