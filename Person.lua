--Character Module

local person = {}

person.x = 0;
person.y = sHeight/2;
person.yVelocity = 0
person.speed = 150
person.jumpPower = 200

function person.Attack()
	print("Hya")
end

function person.Move(val)
	person.x = val
end

function person.Jump(val)
	person.yVelocity = val
end

return person
