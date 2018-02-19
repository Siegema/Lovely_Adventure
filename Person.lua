--Character Module

local person = {}

person.x = 0;
person.y = sHeight/2;
person.yVelocity = 0
person.speed = 150
person.jumpPower = 200

person.Powers = {
	[1] = "ability1",
	[2] = "ability2",
	[3] = "ability3",
}

function person.Attack()
	print("Hya")
end

function person.SpecialAttack(val)
	local power = person.Powers[val]
	print(power)
end

function person.Move(val)
	person.x = val
end

function person.Jump(val)
	person.yVelocity = val
end

return person
