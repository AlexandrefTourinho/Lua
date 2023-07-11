local physics = require ("physics") -->Chamar a bliblioteca: a bliblioteca interna de fisica á variavel physic
physics.start () --> iniciar a fisica no projeto 
physics.setGravity (0,1) --> Definir a renderização (gravidade) da visualização da fisica (usando somente durante o desenvolvimento para testes ) gravidade 0 é sem gravidade 
physics.setDrawMode ("hybrid") --> definir o modo de renderização (hybrid, normal, debug) durante a fase de programação do projeto colocar Hybrid mostra os dois, normal mostra as imagens, debug mostra somente  o comprotamento do corpo fisico
display.setStatusBar (display.HiddenStatusBar) --> removendo a barra de notificaçao

local backGroup = display.newGroup () --> Back usando para plano de fundo, decorações que nao terão interação com o jogo. sempre tem q ser colocado antes de qualquer coisa pq se trata do fundo -usado para colocar itens de decoração ( grama, arvore, coisas q nao interege )

local mainGroup = display.newGroup () --> Usado para os objetos que terão interação dentro do jogo, grupo principal. coisas q bate toca quebra passa por cima(coisas que interage com o player)

local groupUI = display.newGroup () --> Utilizado para placar, vidas, texto, BOTOES - PODERES que ficarão na frente do jogoporém sem interação.

display.setStatusBar ( display.HiddenStatusBar)  --> remover a barra de notificação

local fundo = display.newImageRect(backGroup,"imagens/fundo.jpg", 1000, 1000) --> (fundo é a variavel) display.newImageRect (usado pra chamar a imagem)
fundo.x = display.contentCenterX
fundo.y = display.contentCenterY

local Tolo = display.newImageRect(mainGroup,"imagens/Tolo.png", 398/2, 626/2)
Tolo.x = display.contentCenterX
Tolo.y = 420
physics.addBody ( Tolo, "kynamic", {radius=50, bouce=0.6} )
Tolo.isFixedRotation = true
Tolo.myName= "Romarindo"




local Bola = display.newImageRect(mainGroup,"imagens/bola.png", 225/2, 225/2)
Bola.x = display.contentCenterX
Bola.y = 120
physics.addBody ( Bola, "dynamic", {radius=50, bouce=0.6} )
Bola.myName = "Redondinha"


local numToques = 0 --> variavel (numToques)

local toquesText = display.newText (numToques, display.contentCenterX, 02, native.systemFont, 50) --> chama a variavel toquesText (numToques) (display )
toquesText:setFillColor (1,0,0) --> usado para definir a cor do numero

local function onCollision (event)
    -- Quando a fase de evento for began então
        if (event.phase == "began" ) then
    -- Variáveis criadas para facilitar a escrita do código.
            local Tolo = event.Tolo
            local Bola = event.Bola
    -- Quando o myName do objeto 1 for ... e o nome do obj2 for ...
            if ((Tolo.myName == "Romarindo" --[[jogador player]] and Bola.myName == "Redondinha"--[[bola]]) or (Tolo.myName == "Romarindo" --[[jogador]] and Bola.myName == "Redondinha"--[[Projétil player]] )) then 
            -- Se o obj1 for ... then 
                if (Tolo.myName == "Romarindo") then
            -- Remove o projétil do jogo.
                    display.remove (Tolo)
                else 
                    display.remove (Bola)
                end 

local function cima () --> chamando a funcão  para fazer a ação subir
    Bola:applyLinearImpulse (0, -0.75, Bola.x, Bola.y) --> inpulso X na orizontal ( bola.X) impulso Y na vertical (bala.Y) (sempre usando por porcentagem) ( sempre usar numero, numeros, depois X e Y)
    -->
    numToques = numToques + 1 --> contando o numero de toques( conta quantos pontos eu quizer dar portoque)
    toquesText.text = numToques--> soma a variavel (Toques) + (numToques) para somar valores         
    end --> toda funcao deve ser fechada

local function zerou () --> funcao usada para zerar o placar
    numToques = 0 --> usado para o valor de pontos que recomeca o jogo
    toquesText.text = numToques
end

Tolo:addEventListener("collision", zerou)
Bola:addEventListener ("tap", cima) -- atribuimos a variavel balao para um (tap) atribui a funçao cima




