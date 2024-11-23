love.window.setTitle("Demons vs Missionaries")

-- * All the position entities can goto
local boatDriver = 69
local boatPassenger = 420

local leftSide = {1, 2, 3, 4, 5, 6}
local rightSide = {10, 20, 30, 40, 50, 60}

-- run this function once to draw shapes to screen once calling this every frame fucks with the moving shapes
function GraphicsLoad()
    --Left Ground
    love.graphics.setColor(0, 1, 0)
    love.graphics.rectangle("fill", 0, 550, 250, 250)
    --Right Ground
    love.graphics.rectangle("fill", 525, 550, 275, 250)
    love.graphics.setColor(1,1,1)
    --Water
    love.graphics.setColor(0, 0, 1)
    love.graphics.rectangle("fill", 250, 555, 275, 45)
    love.graphics.setColor(1,1,1)
end

-- * Base Entity
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

    if color == 1 then drawColor = {1, 0.5, 0} end -- * Missionary color (Gold)
    if color == 2 then drawColor = {1, 0, 0} end -- * Demon color (Red)


    --this is spaghetti as fuck and fucking stupid but i dont know what else to do
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

-- mm missionary position
Missionary = {}
Missionary.__index = Missionary
setmetatable(Missionary, Entity)

function Missionary.new(pos)
    local self = setmetatable({}, Missionary)
    self.position = pos
    self.cords = {0, 0}
    return self
end

--OOP fancy fancy
Demon = {}
Demon.__index = Demon
setmetatable(Demon, Entity)

function Demon.new(pos)
    local self = setmetatable({}, Demon)
    self.position = pos
    self.cords = {0, 0}
    return self
end

Boats = {}
Boats.__index = Boats

function Boats.new()
    local self = setmetatable({}, Boats)
    self.point = 1 -- * 1 = right / 0 - left
    self.isGoing = false
    self.pos = 450
    return self
end

function Boats:draw()
    love.graphics.setColor(0.58, 0.29, 0)
    love.graphics.rectangle("fill", self.pos, 545, 70, 20)
    love.graphics.setColor(1, 1, 1)
end

function Boats:loc()
    print(self.pos) 
end

--local rightCords = 450

function Boats:moveLeft(dt)
    local leftCords = 255

    if self.pos <= leftCords then
        Move = false
        AtRight = false
    end

    if self.pos > leftCords then
        self.pos = self.pos - 100 * dt
    end
end

function Boats:moveRight(dt)
    local rightCords = 450

    if self.pos >= rightCords then
        Move = false
        AtRight = true
    end

    if self.pos < rightCords then
        self.pos = self.pos + 100 * dt
    end
end
    

function love.load()
    Move = false
    AtRight = true

    Boat = Boats.new()

    Missionary1 = Missionary.new(leftSide[1])
    Missionary2 = Missionary.new(leftSide[2])
    Missionary3 = Missionary.new(leftSide[3])


    -- test code is here to see if both sides render the entities remove this shit
    -- ! Test code
    Missionary4 = Missionary.new(rightSide[1])
    Missionary5 = Missionary.new(rightSide[2])
    Missionary6 = Missionary.new(rightSide[3])
    -- !

    Demon1 = Demon.new(leftSide[4])
    Demon2 = Demon.new(leftSide[5])
    Demon3 = Demon.new(leftSide[6])

    -- ! Test code
    Demon4 = Demon.new(rightSide[4])
    Demon5 = Demon.new(rightSide[5])
    Demon6 = Demon.new(rightSide[6])
    --!
end

function love.update(deltaTime)
    function love.keypressed(key)
        if key == "space" then
            Move = true
        end
    end

    if Move == true then
        if AtRight == true then
            Boat:moveLeft(deltaTime)
        end
        if AtRight == false then
            Boat:moveRight(deltaTime)
        end
    end
    print(Move, AtRight)
end

function love.draw()
    local loadOnce = false
    if loadOnce == false then
        GraphicsLoad()
        loadOnce = true
    end

    Boat:draw()

    Missionary1:draw(1)
    Missionary2:draw(1)
    Missionary3:draw(1)

    -- ! Test code
    Missionary4:draw(1)
    Missionary5:draw(1)
    Missionary6:draw(1)
    --!
  
    Demon1:draw(2)
    Demon2:draw(2)
    Demon3:draw(2)

    -- ! Test code
    Demon4:draw(2)
    Demon5:draw(2)
    Demon6:draw(2)
    --!
end