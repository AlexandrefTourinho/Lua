--Fisica

local physics = require("physics") -->Chamar a bliblioteca: a bliblioteca interna de fisica á variavel physic
physics.start ()--iniciar a fisica no projeto 
--Definir a gravidade do projeto: Definimos a gravidade 1° X e depois Y do projeto.
physics.setGravity (0,9.8)
-- Definir a renderização da visualização da fisica (usando somente durante o desenvolvimento para testes ) 

physics.setDrawMode ("hybrid") -->Modos : Normal: Aparece apenas as imagens, corpo fisico invisiveis (padrao do sistema), hybrid: Mostra as imagens e os corpos fisicos, debug: Mostra apenas os corpos fisicos.


local retangulo = display.newRect (150, display.contentCenterY, 150, 100 ) --> adicionando nosso 1 obejeto fisico ( se for algo que colida tem que ser, obrigatorio DYNAMICOS)

physics.addBody (retangulo, "dynamic") --> Corpo dinamico: interage com a gravidade e colide com todos os corpos


local chao = display.newRect (display.contentCenterX, 400, 450, 3  )

physics.addBody (chao, "static") --> Corpo estatico: nao se movimenta e colide apenas com dinamico

local circulo = display.newCircle (250, 50 ,30)

physics.addBody (circulo, "kinematic", {radius =30}) --> Corpo cinematico: nao interage com a gravidade e colide apenas com dinamico 

local quadrado = display.newRect ( display.contentCenterX, 0, 50 ,50)
physics.addBody (quadrado, "dynamic", {bounce=0.5, friction=0.5, density=0}) --> bouce () friction () density
quadrado:applyTorque (80) --> faz o objeto girar enttorno do proprio eixo 







