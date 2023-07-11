local physics = require ("physics")
physics.start ()
physics.setGravity (0, 9.8)
physics.setDrawMode ("hybrid")

display.setStatusBar (display.HiddenStatusBar)

local joint 
-- Junta de pivô
-- local staticBox = display.newRect (0, 0, 60, 60)
-- staticBox:setFillColor (0.2, 0.2, 1)
-- physics.addBody (staticBox, "static", {isSensor=true})
-- staticBox.x, staticBox.y = display.contentCenterX, 80

-- local shape = display.newRect (0, 0, 40, 100)
-- shape:setFillColor (1, 0.2, 0.4)
-- physics.addBody (shape, "dynamic")
-- shape.x, shape.y, shape.rotation = 100, staticBox.y-40, 0

-- -- Criação da junta de pivô ("tipo de junta", objA, objB, ancoraX, ancoraY)
-- local jointPivot = physics.newJoint ("pivot", staticBox, shape, staticBox.x, staticBox.y)
-- jointPivot.isMotorEnabled = true -- Ativa o motor da junta de pivô
-- jointPivot.motorSpeed = 40 -- Define a velocidade do torque do motor.
-- jointPivot.maxMotorTorque = 1000 -- Define o valor máximo da velocidade do torque do motor, utilizado para melhor visualização do efeito.
-- jointPivot.isLimitEnabled = true -- Determina como ativado os limites de rotação.
-- jointPivot:setRotationLimits (-60, 125)
----------------------------------------------------------------------
-- Junta de distância
-- local staticBox = display.newRect (0, 0, 60, 60)
-- staticBox:setFillColor (0.2, 0.2, 1)
-- physics.addBody (staticBox, "static", {isSensor=true})
-- staticBox.x, staticBox.y = 200, 180

-- local shape = display.newRect (0, 0, 40, 100)
-- shape:setFillColor (1, 0.2, 0.4)
-- physics.addBody (shape, "dynamic", {bounce=1})
-- shape.x, shape.y = 200, 80

-- -- ("tipo de junta", objA, objB, ancoraObjA.x, ancoraObjA.y, ancoraObjB.x, ancoraObjB.y)
-- local jointDistance = physics.newJoint ("distance", staticBox, shape, staticBox.x, staticBox.y-10, shape.x, shape.y)
-- jointDistance.frequency = 0.8 -- Define a frequência de amortecimento em Hz, quanto maior o valor mais macio.
-- jointDistance.dampingRatio = 0.8 -- Nível de amortecimento, onde 1 é amortecimento crítico.
-- --jointDistance.length = staticBox.y - shape.y -- Define a distância entre os pontos de ancoragem.

-- shape:applyLinearImpulse (0.3, 0, shape.x, shape.y-5)   
---------------------------------------------------------
-- Junta do pistão 

-- local staticBox = display.newRect (0, 0, 60, 60)
-- staticBox:setFillColor (0.2, 0.2, 1)
-- physics.addBody (staticBox, "static", {isSensor=true})
-- staticBox.x, staticBox.y = display.contentCenterX, 360

-- local shape = display.newRect (0, 0, 140, 30)
-- shape:setFillColor (1, 0.2, 0.4)
-- physics.addBody (shape, "dynamic", {bounce=1})
-- shape.x, shape.y = display.contentCenterX, 310

-- -- Criação da junta de pistão ("tipo de junta", objA, objB, ancoraX, ancoraY, eixoX, eixoY)
-- local jointPiston = physics.newJoint ("piston", staticBox, shape, shape.x, shape.y, 0, 1)

-- jointPiston.isMotorEnabled = true -- Habilita o motor da junta
-- jointPiston.motorSpeed = -30 -- Define a velocidade do motor (valor negativo faz a movimentação inversa)
-- jointPiston.maxMotorForce = 1000 -- Define o valor maximo da força do motor
-- jointPiston.isLimitEnabled = true -- Define que a junta possui limites de movimentação.
-- jointPiston:setLimits (-140, 0) -- Define os limites de movimentação positiva e negativa.
--------------------------------------------------------
-- Junta de fricção
local bodies = {} -- String/tabela para armazenamento dos corpos.
local bodiesGroup = display.newGroup ()
local joints = {} -- String/tabela para armazenamento das juntas.




local shape1 = display.newRect (bodiesGroup, 0, 0, 40, 40)
shape1:setFillColor (1, 0.2, 0.4)
physics.addBody (shape1, "dynamic")
shape1.x, shape1.y, shape1.rotation = display.contentCenterX-60, 170, 0
shape1.angularVelocity = 200 -- Adiciona um impulso angular ao shape (rotação ao redor do próprio eixo)
bodies [#bodies+1] = shape1 -- adiciona o shape a tabela/string bodies sem sobrescrever. 

local shape2 = display.newRect (bodiesGroup, 0, 0, 40, 40)
shape2:setFillColor (1, 0.2, 0.4)
physics.addBody (shape2, "dynamic")
shape2.x, shape2.y, shape2.rotation = display.contentCenterX+60, 170, 0
shape2.angularVelocity = 200
bodies [#bodies+1] = shape2

local dirtField = display.newRect (bodiesGroup, 0, 0, 120, 190)
dirtField.type = "dirt"
dirtField:setFillColor (0.4, 0.25, 0.2)
physics.addBody (dirtField, "static", {isSensor=true})
dirtField.x, dirtField.y = display.contentCenterX-60, 335
bodies [#bodies+1] = dirtField

local grassField = display.newRect (bodiesGroup, 0, 0, 120, 190)
grassField.type = "grass"
grassField:setFillColor (0.1, 0.4, 0.3)
physics.addBody (grassField, "static", {isSensor=true})
grassField.x, grassField.y = display.contentCenterX+60, 335
bodies [#bodies+1] = grassField
bodiesGroup.alpha = 0 -- Define que todos os elementos do grupo possuem alfa 0

transition.to (bodiesGroup, {time=600, alpha=1, transition=easing.outQuad}) -- Transição do grupo para o alfa 1 em 600 milisegundos com efeito outQuad.

local function handleCollision (self, event)
	if (event.phase == "began") then
-- Cria duas variáveis para armazenar limite de força e torque
		local forceLimit = 0
		local torqueLimit = 0
-- Se o tipo do outro objeto colidido for ... então
		if (event.other.type == "dirt") then
		-- Altera os valores limites de força e torque
			forceLimit = 0.22
			torqueLimit = 0.022
		-- Se não
		else 
		-- Altera para outros valores.
			forceLimit = 0.28
			torqueLimit = 0.028
		end 
-- Cria um timer com função temporária para criação das juntas 10 milisegundos após a colisão
		timer.performWithDelay (10, 
				function ()
			-- Cria-se a junta já dentro da string joints, onde o objA é o colidido e o B o ouvinte da função, e as âncoras são criadas de acordo com a localização do objB.
					joints[#joints+1]= physics.newJoint ("friction", event.other, self, self.x, self.y)
			-- Altera os valores máximos de força e torqude de acordo com o obtido no if acima.
					joints[#joints].maxForce = forceLimit
					joints[#joints].maxTorque = torqueLimit
				end -- Fecha a function do timer.
				) -- Fecha o timer
	end -- Fecha o if Began
end  -- Fecha a function

shape1.collision = handleCollision
shape1:addEventListener ("collision", shape1)

shape2.collision = handleCollision
shape2:addEventListener ("collision",shape2)