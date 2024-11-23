love.window.setTitle("Demons vs Missionaries")

--All the position entities can g0
local boatDriver = 69
local boatPassenger = 420

local leftSide = {1, 2, 3, 4, 5, 6}
local rightSide = {10, 20, 30, 40, 50, 60}

-- Base Entity
Entity = {}
Entity.__index = Entity

function Entity:newPosition(pos)
    self.position = pos
end

function Entity:getPosition()
    return self.position
end

function Entity:draw(color)
    local drawColor = {}

    if color == 1 then drawColor = {1, 0.5, 0} end --Missionary color (Gold)
    if color == 2 then drawColor = {1, 0, 0} end --Demon color (Red)

    if self.position == boatDriver then end
    if self.position == boatPassenger then end

    if self.position == leftSide[1] then self.cords = {600, 500} end
    if self.position == leftSide[2] then self.cords = {625, 500} end
    if self.position == leftSide[3] then self.cords = {650, 500} end
    if self.position == leftSide[4] then self.cords = {675, 500} end
    if self.position == leftSide[5] then self.cords = {700, 500} end
    if self.position == leftSide[6] then self.cords = {725, 500}  end

    if self.position == rightSide[6] then self.cords = {75, 500} end
    if self.position == rightSide[5] then self.cords = {100, 500} end
    if self.position == rightSide[4] then self.cords = {125, 500} end
    if self.position == rightSide[3] then self.cords = {150, 500} end
    if self.position == rightSide[2] then self.cords = {175, 500} end
    if self.position == rightSide[1] then self.cords = {200, 500} end
    
    love.graphics.setColor(drawColor)
    love.graphics.rectangle("fill", self.cords[1], self.cords[2], 10, 50)
    love.graphics.setColor(1,1,1)
end

Missionary = {}
Missionary.__index = Missionary
setmetatable(Missionary, Entity)

function Missionary.new(pos)
    local self = setmetatable({}, Missionary)
    self.position = pos
    self.cords = {0, 0}
    return self
end

Demon = {}
Demon.__index = Demon
setmetatable(Demon, Entity)

function Demon.new(pos)
    local self = setmetatable({}, Demon)
    self.position = pos
    self.cords = {0, 0}
    return self
end

function love.load()
    Missionary1 = Missionary.new(leftSide[1])
    Missionary2 = Missionary.new(leftSide[2])
    Missionary3 = Missionary.new(leftSide[3])

    -- ! Test code
    Missionary4 = Missionary.new(rightSide[1])
    Missionary5 = Missionary.new(rightSide[2])
    Missionary6 = Missionary.new(rightSide[3])

    Demon1 = Demon.new(leftSide[4])
    Demon2 = Demon.new(leftSide[5])
    Demon3 = Demon.new(leftSide[6])

    -- ! Test code
    Demon4 = Demon.new(rightSide[4])
    Demon5 = Demon.new(rightSide[5])
    Demon6 = Demon.new(rightSide[6])
end

function love.update(deltaTime)
  --print(love.mouse.getPosition())
end

function love.draw()

    --Left Ground
    love.graphics.rectangle("fill", 0, 550, 250, 250)
    --Right Ground
    love.graphics.rectangle("fill", 525, 550, 275, 250)
    --Water
    love.graphics.setColor(0, 0, 1)
    love.graphics.rectangle("fill", 250, 555, 275, 45)
    love.graphics.setColor(1,1,1)

    Missionary1:draw(1)
    Missionary2:draw(1)
    Missionary3:draw(1)

    -- ! Test code
    Missionary4:draw(1)
    Missionary5:draw(1)
    Missionary6:draw(1)
  
    Demon1:draw(2)
    Demon2:draw(2)
    Demon3:draw(2)

    -- ! Test code
    Demon4:draw(2)
    Demon5:draw(2)
    Demon6:draw(2)
end