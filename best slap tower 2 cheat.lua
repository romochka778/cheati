local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()

local Window = Library.CreateLib("by roma", "RJTheme8")

local Tab = Window:NewTab("create")

local Section = Tab:NewSection("")

local colors = {
	-- Цвет фона у Секций
    SchemeColor = Color3.fromRGB(150, 72, 148),
	-- Цвет фона в правой части UI
	Background = Color3.fromRGB(15,15,15),
	-- Цвет фона в левой части UI
    Header = Color3.fromRGB(15,15,15),
	-- Цвет текста
    TextColor = Color3.fromRGB(255,255,255),
	-- Цвет фона у кнопок
    ElementColor = Color3.fromRGB(20, 20, 20)
}

Section:NewButton("infinite yield", "ButtonInfo", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/romochka778/cheati/refs/heads/main/infinityield.lua'))()
end)

Section:NewButton("dex explorer", "ButtonInfo", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/romochka778/cheati/refs/heads/main/moon%20dex.lua"))()
end)

local Tab = Window:NewTab("slap tower")

local Section = Tab:NewSection("teleports")

Section:NewButton("troll button", "ButtonInfo", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Gudock2.CFrame
end)

Section:NewButton("end", "ButtonInfo", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-24.0864487, 356.118561, 321.273163, -1, 0, 0, 0, 1, 0, 0, 0, -1)
end)

Section:NewButton("green slap", "ButtonInfo", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(37.1160278, 7.48364258, -5.29842377, 0, 0, -1, 0, 1, 0, 1, 0, 0)
end)

Section:NewButton("silver slap", "ButtonInfo", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-339.273163, 6.11857033, -13.7744875, 0, 0, 1, 0, 1, -0, -1, 0, 0)
end)

Section:NewButton("red slap", "ButtonInfo", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(162.273178, 6.11792183, -25.2002029, 0, 0, -1, 0, 1, 0, 1, 0, 0)
end)

Section:NewButton("spawn", "ButtonInfo", function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpawnLocation.CFrame
end)

local Section = Tab:NewSection("other")



Section:NewToggle("troll", "ToggleInfo", function(state)
    if state then
         a = 0
    while wait(0.2) do
      wait(0.1)
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-57.9999924, 100.5, -17, -1, 0, 0, 0, 1, 0, 0, 0, -1)
      wait(0.2)
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-57.9999924, 100.5, -3.99999905, -1, 0, 0, 0, 1, 0, 0, 0, -1)
      wait(0.2)
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Gudock2.CFrame
      wait(0.2)
      if a == 1 then
        break
      end
    end
    else
        a += 1
    end
end)



local Section = Tab:NewSection("player")

Section:NewButton("tp tool", "ButtonInfo", function()
 mouse = game.Players.LocalPlayer:GetMouse()
tool = Instance.new("Tool")
tool.RequiresHandle = false
tool.Name = "TP TOOL"
tool.Activated:connect(function()
local pos = mouse.Hit+Vector3.new(0,2.5,0)
pos = CFrame.new(pos.X,pos.Y,pos.Z)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
end)
tool.Parent = game.Players.LocalPlayer.Backpack
end)

Section:NewButton("flytool", "ButtonInfo", function()
  -- ГЛОБАЛЬНЫЕ ПЕРЕМЕННЫЕ
local flightPower = 50 -- Мощность полета
local maxFlightPower = 100 -- Максимальная мощность полета
local minFlightPower = 10 -- Минимальная мощность полета
local speedIncrement = 5 -- Прирост скорости при увеличении
local flyingTool = nil

local bodyPosition = Instance.new("BodyPosition")
local bodyGyro = Instance.new("BodyGyro")

local isFlying = false
local particleEmitter = nil -- Эмиттер частиц

local localPlayer = game.Players.LocalPlayer
local characterModel = localPlayer.Character or localPlayer.CharacterAdded:wait()
local torso = characterModel:FindFirstChild("UpperTorso") or characterModel:FindFirstChild("Torso")

local playerMouse = localPlayer:GetMouse()
local flightGui = nil -- GUI для отображения состояния полета

-- ФУНКЦИЯ ИНИЦИАЛИЗАЦИИ ИНСТРУМЕНТА И ИНТЕРФЕЙСА
local function initializeTool()
    -- Создание инструмента "FlyTool" и размещение его в рюкзаке игрока
    flyingTool = Instance.new("Tool")
    flyingTool.Name = "FlyTool"
    flyingTool.RequiresHandle = false
    flyingTool.Parent = localPlayer.Backpack

    bodyGyro.maxTorque = Vector3.new(math.huge, math.huge, math.huge)
    bodyPosition.maxForce = Vector3.new(math.huge, math.huge, math.huge)

    script.Parent = flyingTool

    -- Создание GUI для отображения состояния полета
    flightGui = Instance.new("ScreenGui", localPlayer:WaitForChild("PlayerGui"))
    local statusLabel = Instance.new("TextLabel", flightGui)
    statusLabel.Size = UDim2.new(0, 200, 0, 50)
    statusLabel.Position = UDim2.new(0.5, -100, 0, 50)
    statusLabel.Text = "Flight Power: " .. flightPower
    statusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    statusLabel.BackgroundTransparency = 1
    statusLabel.TextScaled = true

    -- Обновление текста с мощностью полета
    local function updateFlightPower()
        statusLabel.Text = "Flight Power: " .. flightPower
    end

    -- События изменения мощности полета с использованием стрелок
    playerMouse.KeyDown:Connect(function(key)
        if key == Enum.KeyCode.Up then
            flightPower = math.min(flightPower + speedIncrement, maxFlightPower)
            updateFlightPower()
        elseif key == Enum.KeyCode.Down then
            flightPower = math.max(flightPower - speedIncrement, minFlightPower)
            updateFlightPower()
        elseif key == Enum.KeyCode.F then
            if isFlying then
                onToolDeactivated()
            else
                onToolActivated()
            end
        end
    end)
end

initializeTool()

-- ФУНКЦИИ УПРАВЛЕНИЯ ПОЛЕТОМ
-- Обработчик активации инструмента
function onToolActivated()
    if not torso then
        warn("Торс не найден, полет невозможен.")
        return
    end

    -- Настройка компонентов для полета
    bodyPosition.Parent = torso
    bodyPosition.Position = torso.Position + Vector3.new(0, 10, 0)
    bodyGyro.Parent = torso

    characterModel.Humanoid.PlatformStand = true

    -- Создание эффекта частиц
    particleEmitter = Instance.new("ParticleEmitter", torso)
    particleEmitter.Texture = "rbxassetid://243098098" -- ID текстуры частицы
    particleEmitter.Rate = 100
    particleEmitter.Lifetime = NumberRange.new(1, 2)
    particleEmitter.Speed = NumberRange.new(5, 10)
    particleEmitter.VelocitySpread = 180

    for _, motor in ipairs(torso:GetChildren()) do
        if motor:IsA("Motor") then
            motor.MaxVelocity = 0
            motor.CurrentAngle = -1
            if motor.Name == "Left Hip" then
                motor.CurrentAngle = 1
            end
        end
    end

    isFlying = true
    while isFlying do
        local mousePos = playerMouse.Hit.p
        bodyGyro.CFrame = CFrame.new(torso.Position, mousePos) * CFrame.fromEulerAnglesXYZ(-math.pi / 2, 0, 0)
        bodyPosition.Position = torso.Position + (mousePos - torso.Position).unit * flightPower
        wait(0.1) -- Уменьшение частоты обновления для улучшения производительности
    end
end

-- Обработчик деактивации инструмента
function onToolDeactivated()
    if not torso then
        warn("Торс не найден, невозможно остановить полет.")
        return
    end

    bodyGyro.Parent = nil
    bodyPosition.Parent = nil
    isFlying = false

    if particleEmitter then
        particleEmitter:Destroy()
        particleEmitter = nil
    end

    characterModel.Humanoid.PlatformStand = false

    for _, motor in ipairs(torso:GetChildren()) do
        if motor:IsA("Motor") then
            motor.MaxVelocity = 1
        end
    end
end

flyingTool.Unequipped:Connect(function() isFlying = false end)
flyingTool.Activated:Connect(onToolActivated)
flyingTool.Deactivated:Connect(onToolDeactivated)
end)

Section:NewTextBox("JumpHeight", "TextboxInfo", function(j)
    game.Players.LocalPlayer.Character.Humanoid.JumpHeight = j
end)

Section:NewTextBox("Speed", "TextboxInfo", function(s)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)
