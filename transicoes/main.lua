local circulo = display.newCircle ( 80, 50, 30 )
--transiçoes
--comandos: transition.to (variavel, { parametros})

transition.to (circulo, {time = 4000, y = 400})

local criculo1 = display.newCircle ( 150, 50, 30 )
transition.to (criculo1, {time=3000, y=400, delta=true})

local criculo2 = display.newCircle ( 250, 50, 30)
transition.to (criculo2, {time=3000, y=400, iterations=4, transition = easing.outElastic})

local retangulo = display.newRect (200, 250, 50, 70)
transition.to (retangulo, {time=3000, rotation = 360, yScale=2, alpha=0.5, iterations =-1})