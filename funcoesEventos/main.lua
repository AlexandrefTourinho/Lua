-- -- Incluindo funções 
-- local function detectarTap (event) 
--     --determina o evento
--      -- comando para iniciar a função local function nome da função seguindo de parenteses
-- -- o codigo sera executado quando o botão for tocado.
-- -- trostring : sara sequenciar
-- --event. target: nomear o objeto do evento, ou objeto tocado
-- print("objeto tocado:"..tostring(event.target))

-- return true -- "zera" todos os dados depois da funçaõ executada.

-- end -- fechar a função 

-- local botaoTap = display. newRect (200, 200, 200, 50)
-- botaoTap:addEventListener ("tap", detectarTap) -- add um ouvinte tep na função
-- -- toda vez que o usuario clicar ele identifica o objeto

-- local function tapDuplo (event)

--     if(event.numTaps == 2) then
--         print ("Objeto tocado duas vezes:"..tostring (event.target) )

--     else
--         return true 
--     end --fecha o if/else
-- end -- fecha a function

-- local botaoDuplo = display.newRect (100,300,200,50)
-- botaoDuplo:setFillColor (0.9,0,0.5)
-- botaoDuplo:addEventListener ("tap", tapDuplo) 

-- -- evento de toque (touch)

-- -- Evento de toque (touth)
-- -- fases de toque:
-- --Began = Primeira fase de toque, quando o usuario encosta na tela
-- -- moved = Qaundo o usuario mantem o toque e move pela tela.
-- --ended = Quando o usuario retira o dedo da tela.
-- --cancelled = Quando o  evento de toque é cancelado do sistema.

-- local function fasesToque (event)
-- -- Se a fase de toque for igual a began a began entao
--     if(event.phase == "began") then
--         print("Objeto tocado:"..tostring (event.target))
-- -- Se a fase de toque for igual a moved a moved entao

--     elseif (event.phase =="moved") then
--         print ("Localização de toque nas seguintes coordenadas: x="..event. y)
-- -- Se a fase de toque for igual a ended a ended entao

--     elseif (event.phase =="ended" or "cancelled") then
--         print ("Touch terminado no objeto: " ..tostring (event.target))
--     end
--     return true
-- end

-- local botaoTouch = display.newRect (200, 400, 200, 50)
-- botaoTouch:setFillColor (0.9, 0.2, 0)
-- botaoTouch:addEventListener ("touch",fasesToque)


system.activate("multitouch")

local retangulo = display.newRect (display.contentCenterX, display.contentCenterY, 280,440)
retangulo:setFillColor (0.9, 0.2, 0)

local function eventoTouch (event)
    print ("Fase de toque: " ..event.phase )
    print ("Localização x:" .. tostring (event.x), "Localização y:" .. tostring (event.y))
    print ("ID de toque exclusivo:" .. tostring (event.id))
    print ("--------------------")
    return true
end

retangulo:addEventListener ("touch", eventoTouch)