--Main Game


--Globals
gravity = 100

function love.load()
	platform = {}
	platform.width = love.graphics.getWidth()
	platform.height = love.graphics.getHeight()
	sHeight = love.graphics.getHeight()

	--player = {}
	player = require("Person")
	player.specialBar = require("EnergyBar")
	player.storedEnergy = 0.0

	ground = player.y
end

function love.update(dt)
	if love.keyboard.isDown('a') then
		player.Move(player.x - (player.speed * dt))
	elseif love.keyboard.isDown('d') then
		player.Move(player.x + (player.speed * dt))
	end

	if love.keyboard.isDown('space') then
		if player.yVelocity == 0 then
			player.Jump(player.jumpPower)
		end
	end

	if player.yVelocity ~= 0 then
		player.y = player.y - (player.yVelocity * dt)
		player.yVelocity = player.yVelocity - (gravity * dt)
	end

	if player.y >= ground then
		player.yVelocity = 0
		player.y = ground
	end

	if love.keyboard.isDown('i') then
		if player.storedEnergy < player.specialBar.amount then
			player.storedEnergy = player.storedEnergy + 0.5
		end
	end

	updateBar()
end

function love.keyreleased(key)
	if key == "i" then
		if player.storedEnergy > 100 then
			local val = math.floor(player.storedEnergy)
			player.specialBar.amount = player.specialBar.amount - val
			player.SpecialAttack(val/100)
		end
		player.storedEnergy = 0
	end
end

function updateBar()
	if player.specialBar.amount < 300.0 then
		player.specialBar.amount = player.specialBar.amount + 0.2
	end
end

function love.draw()
	love.graphics.setColor(125, 250, 100, 50)
	love.graphics.rectangle("fill", 0, platform.height/2, platform.width, platform.height)
	love.graphics.line(0, sHeight/2, love.graphics.getWidth(), sHeight/2)

	love.graphics.setColor(250, 0, 0, 50)
	love.graphics.rectangle("fill", player.x, player.y-50, 50, 50)

	love.graphics.setColor(255, 0, 255)
	love.graphics.rectangle("fill", 0, 0, player.specialBar.amount, 20)

	love.graphics.setColor(255, 255, 255, 150)
	love.graphics.rectangle("fill", 0, 0, player.storedEnergy, 20)
end
