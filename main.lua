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
end

function love.draw()
	love.graphics.setColor(125, 250, 100, 50)
	love.graphics.rectangle("fill", 0, platform.height/2, platform.width, platform.height)
	love.graphics.line(0, sHeight/2, love.graphics.getWidth(), sHeight/2)

	love.graphics.setColor(250, 0, 0, 50)
	love.graphics.rectangle("fill", player.x, player.y-50, 50, 50)
end

