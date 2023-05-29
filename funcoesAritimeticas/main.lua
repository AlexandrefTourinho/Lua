-- variavel global -- (deve ser evitado)

vidas = 2
print (vidas)
print ("O valor de vidas: ".. vidas)

-- Variável Locais (só é lida dentro do Script)
--(local) é utilizado somente na criação da variavel--

local pontos = 10
print (pontos)
print("O valor de pontos: " .. pontos)

--Operações Aritméticas--- soma
-- local (significa que a variavel  é local) laranjas ( nome da variavel ) = (atributos valor) 10 (valor atributo a variavel)

local laranjas = 10

laranjas = laranjas + 5
print (laranjas)
local bananas = 5
print ("O valor das laranjas é")

bananas = 20


-- Soma entre variáveis --

local cesta = 0

cesta = laranjas + bananas

print (" A soma entre as varáveis laranjas e bananas é :" .. cesta )

--Subtração--

cesta = laranjas - bananas 
bananas = bananas - 1

--Multiplicação --

local carro = 8
carro = carro * 2
print ("Quantidade de carro: "..carro)

--Dividindo pela multiplicação --

carro = carro * 0.5
print (carro)
print ("Divisão pela multiplicação ".. carro)
print ("Na sua cesta possuem " .. cesta .. " frutas")

--Divisão--
local gato = 6
gato = gato /2
print ("A divisao final é : " ..gato)

local arvore = 97.5
arvore = arvore / 4