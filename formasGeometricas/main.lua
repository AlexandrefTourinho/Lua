local retangulo = display.newRect ( 120, 80, 200, 140 )
retangulo:setFillColor (1,0.5,0.9)

local circulo = display.newCircle  ( 330, 80, 80 )
circulo:setFillColor (0.5,0.9)

local quadrado = display.newRect ( 530, 80, 140, 140 )
quadrado:setFillColor (1,0.5,0.9)

-- Adicionar retângulo arrendondado:
-- Comandos: display.newRoundedRect (x, y, largura, altura, raio das bordas)
--local retanguloArrendondado = display.newEounderRect
local retanguloArrendondado = display.newRoundedRect ( 790, 80,200,  140, 30 )
retanguloArrendondado:setFillColor (0.3,0.9,1)

-- adicionar uma linha:  
-- Comandos: display.newLine ( x inicial , y inicial, x final, y final)

local linha = display.newLine ( 0, 250, 1200, 250)

-- Criar um poligono:

-- comandos: display.newPolygon ( x, y, vertices)
local localizacaoX = 200    
local localizacaoY = 350

local vertices = {  0, -110, 27, -35, 105, -35, 43, 16, 65, 90, 0, 45, -65, 90,- 43, 15, -105, -35, -27, -35 }

local estrela = display.newPolygon ( localizacaoX, localizacaoY, vertices)

-- criar um novo texto:
-- comandos : display.newText ("Texto que quero inserir", x, y fonte, fontSize )
local helloWorld = display.newText ( "Hello World", 500, 350, native.systemFont, 50 )

local parametros = {
    text = "olá Mundo", 
    x = 500,
    y= 450,
    font = "Arial" ,
    fontSize = 50,
    align = "right"

}

local olaMundo = display.newText (parametros) 

local opcoes={
    text = "Alexandre", 
    x = 730,
    y = 550,
    font = "Arial" ,
    fontSize = 50,
  
}
local textoRelevo = display.newEmbossedText (opcoes)

--Adicionar cor ao objeto/texto:
--Comandos: variavel : setFilllColor(cinza, vermelho, verde, azul, alfa)
helloWorld: setFillColor (0.9, 1.4, 0.5)
helloWorld.alfa = 0.5


local color = {
    -- destaque:
highlight = {r= 1, g = 1, b = 1},
--sombra:
shdow = {r= 1, g = 0.9, b= 0.2}

}
textoRelevo: setEmbossColor ( color )

--Gradiente :
-- Comandos : variaveis = { type = , color1 = {, ,}, color2= {, ,},  directions= "" }

local gradiente = {
    type = "gradiente",
    color1 = {1,0.1,0.9},
    color2 = {0.8, 0.8, 0.8},
    direction = "down"
}

estrela:setFillColor (gradiente)







