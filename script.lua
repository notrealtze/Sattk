local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()

local Window = WindUI:CreateWindow({
    Title = "SCA|SAKTKIA51",
    Icon = "star",
    Folder = "SCASAKTKIA51",
    Size = UDim2.fromOffset(580, 46),
    NewElements = true,
    HideSearchBar = false,
})

WindUI:AddTheme({
    Name = "My Theme",
    Accent = WindUI:Gradient({
        ["0"]   = { Color = Color3.fromHex("#3d2a00"), Transparency = 0 },
        ["100"] = { Color = Color3.fromHex("#7a5200"), Transparency = 0 },
    }, { Rotation = 45 }),
    Background = WindUI:Gradient({
        ["0"]   = { Color = Color3.fromHex("#101010"), Transparency = 0 },
        ["100"] = { Color = Color3.fromHex("#1a1200"), Transparency = 0 },
    }, { Rotation = 45 }),
    Outline = Color3.fromHex("#c9a84c"),
    Text = Color3.fromHex("#f5d97e"),
    Placeholder = Color3.fromHex("#7a6a3a"),
    Button = WindUI:Gradient({
        ["0"]   = { Color = Color3.fromHex("#4a3200"), Transparency = 0 },
        ["100"] = { Color = Color3.fromHex("#8a6200"), Transparency = 0 },
    }, { Rotation = 45 }),
    Icon = Color3.fromHex("#c9a84c"),
})

WindUI:SetTheme("My Theme")

local premium = false

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

local WeaponsFolder = workspace:WaitForChild("Weapons")
local KillersFolder = workspace:WaitForChild("Killers")

local ESPFolder = Instance.new("Folder")
ESPFolder.Name = "WeaponESP"

local function protectGui(gui)
    if syn and syn.protect_gui then
        syn.protect_gui(gui)
        gui.Parent = CoreGui
    else
        gui.Name = "\0\1\2\3"
        gui.Parent = CoreGui
    end
end

protectGui(ESPFolder)

local function createESP(model)
    local primaryPart = model.PrimaryPart
    if not primaryPart then return end

    local billboard = Instance.new("BillboardGui")
    billboard.Name = "WeaponESP_" .. model.Name
    billboard.Adornee = primaryPart
    billboard.AlwaysOnTop = true
    billboard.StudsOffsetWorldSpace = Vector3.new(0, 2, 0)
    billboard.Size = UDim2.fromOffset(120, 60)
    billboard.SizeOffset = Vector2.new(0, 0)
    billboard.ResetOnSpawn = false
    billboard.ClipsDescendants = false
    billboard.Parent = ESPFolder

    local mainFrame = Instance.new("Frame", billboard)
    mainFrame.Name = "MainFrame"
    mainFrame.BorderSizePixel = 0
    mainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    mainFrame.BackgroundTransparency = 0.5
    mainFrame.Size = UDim2.fromScale(1, 1)
    mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    mainFrame.Position = UDim2.fromScale(0.5, 0.5)

    local corner = Instance.new("UICorner", mainFrame)
    corner.CornerRadius = UDim.new(0.2, 0)

    local stroke = Instance.new("UIStroke", mainFrame)
    stroke.Color = Color3.fromRGB(255, 255, 255)

    local strokeGradient = Instance.new("UIGradient", stroke)
    strokeGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 235, 46)),
        ColorSequenceKeypoint.new(0.329, Color3.fromRGB(255, 235, 46)),
        ColorSequenceKeypoint.new(0.798, Color3.fromRGB(255, 219, 219)),
        ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 219, 219)),
    }

    local frameGradient = Instance.new("UIGradient", mainFrame)
    frameGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 235, 46)),
        ColorSequenceKeypoint.new(0.329, Color3.fromRGB(255, 235, 46)),
        ColorSequenceKeypoint.new(0.798, Color3.fromRGB(255, 219, 219)),
        ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 219, 219)),
    }

    local weaponName = Instance.new("TextLabel", mainFrame)
    weaponName.Name = "WeaponName"
    weaponName.TextWrapped = true
    weaponName.BorderSizePixel = 0
    weaponName.TextScaled = true
    weaponName.BackgroundTransparency = 1
    weaponName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    weaponName.FontFace = Font.new("rbxasset://fonts/families/Arial.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    weaponName.TextColor3 = Color3.fromRGB(255, 255, 255)
    weaponName.AnchorPoint = Vector2.new(0.5, 0.5)
    weaponName.Size = UDim2.fromScale(0.6, 0.9)
    weaponName.Position = UDim2.fromScale(0.5, 0.5)
    weaponName.Text = model.Name

    local nameStroke = Instance.new("UIStroke", weaponName)
    nameStroke.Color = Color3.fromRGB(255, 197, 0)

    local nameStrokeGradient = Instance.new("UIGradient", nameStroke)
    nameStrokeGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 0, 0)),
        ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 219, 219)),
    }

    local distance = Instance.new("TextLabel", mainFrame)
    distance.Name = "Distance"
    distance.TextWrapped = true
    distance.BorderSizePixel = 0
    distance.TextScaled = true
    distance.BackgroundTransparency = 1
    distance.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    distance.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    distance.TextColor3 = Color3.fromRGB(255, 255, 255)
    distance.AnchorPoint = Vector2.new(0.5, 0.5)
    distance.Size = UDim2.fromScale(0.85, 0.45)
    distance.Position = UDim2.fromScale(0.5, 1.35)
    distance.Text = "DISTANCE: 0M"
    distance.ZIndex = 10

    local distStroke = Instance.new("UIStroke", distance)
    distStroke.Color = Color3.fromRGB(0, 0, 0)
    distStroke.Thickness = 2

    RunService.Heartbeat:Connect(function()
        local char = Players.LocalPlayer.Character
        if not char then return end
        local root = char:FindFirstChild("HumanoidRootPart")
        if root and primaryPart and primaryPart.Parent then
            local dist = math.floor((root.Position - model:GetPivot().Position).Magnitude)
            distance.Text = "DISTANCE: " .. dist .. "M"
        end
    end)

    return billboard
end

local espEnabled = false
local espConnections = {}

local function enableESP()
    for _, model in ipairs(WeaponsFolder:GetChildren()) do
        createESP(model)
    end
    table.insert(espConnections, WeaponsFolder.ChildAdded:Connect(function(child)
        createESP(child)
    end))
end

local function disableESP()
    for _, v in ipairs(ESPFolder:GetChildren()) do
        v:Destroy()
    end
    for _, c in ipairs(espConnections) do
        c:Disconnect()
    end
    espConnections = {}
end

local killerESPFolder = Instance.new("Folder")
killerESPFolder.Name = "KillerESP"
protectGui(killerESPFolder)

local playerESPFolder = Instance.new("Folder")
playerESPFolder.Name = "PlayerESP"
protectGui(playerESPFolder)

local killerDrawings = {}
local killerBillboards = {}

local killerESPEnabled = false
local killerESPConnections = {}
local drawBoxes = false
local drawLines = false
local drawOverride = false
local drawStyle = "2D"
local killerBoxColor = Color3.fromRGB(255, 50, 50)
local killerNameColor = Color3.fromRGB(255, 80, 80)

local PlayersFolder = workspace:WaitForChild("Characters to kill")

local playerDrawings = {}
local playerBillboards = {}

local playerESPEnabled = false
local playerESPConnections = {}
local playerDrawBoxes = false
local playerDrawLines = false
local playerDrawOverride = false
local playerDrawStyle = "2D"
local playerBoxColor = Color3.fromRGB(50, 150, 255)
local playerNameColor = Color3.fromRGB(80, 180, 255)

local mysteryBoxESPEnabled = false
local mysteryBoxBillboards = {}
local mysteryBoxESPFolder = Instance.new("Folder")
mysteryBoxESPFolder.Name = "MysteryBoxESP"
protectGui(mysteryBoxESPFolder)

local papESPEnabled = false
local papBillboards = {}
local papESPFolder = Instance.new("Folder")
papESPFolder.Name = "PAPEsp"
protectGui(papESPFolder)

local function createMysteryBoxBillboard(box)
    local primary = box.PrimaryPart or box:FindFirstChildOfClass("BasePart")
    if not primary then return end

    local billboard = Instance.new("BillboardGui")
    billboard.Name = "MysteryBoxESP_" .. box.Name
    billboard.Adornee = primary
    billboard.AlwaysOnTop = true
    billboard.StudsOffsetWorldSpace = Vector3.new(0, 4, 0)
    billboard.Size = UDim2.fromOffset(140, 58)
    billboard.ResetOnSpawn = false
    billboard.ClipsDescendants = false
    billboard.Parent = mysteryBoxESPFolder

    local frame = Instance.new("Frame", billboard)
    frame.BorderSizePixel = 0
    frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    frame.BackgroundTransparency = 0.3
    frame.Size = UDim2.fromScale(1, 1)
    frame.AnchorPoint = Vector2.new(0.5, 0.5)
    frame.Position = UDim2.fromScale(0.5, 0.5)

    local corner = Instance.new("UICorner", frame)
    corner.CornerRadius = UDim.new(0, 4)

    local topBar = Instance.new("Frame", frame)
    topBar.BorderSizePixel = 0
    topBar.BackgroundColor3 = Color3.fromRGB(0, 220, 180)
    topBar.Size = UDim2.new(1, 0, 0, 2)
    topBar.Position = UDim2.fromScale(0, 0)
    local topCorner = Instance.new("UICorner", topBar)
    topCorner.CornerRadius = UDim.new(0, 4)

    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Color3.fromRGB(0, 220, 180)
    stroke.Thickness = 1.2

    local gradient = Instance.new("UIGradient", stroke)
    gradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 220, 180)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(180, 255, 240)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 220, 180)),
    }

    local titleLabel = Instance.new("TextLabel", frame)
    titleLabel.BorderSizePixel = 0
    titleLabel.BackgroundTransparency = 1
    titleLabel.FontFace = Font.new("rbxasset://fonts/families/Code.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    titleLabel.TextColor3 = Color3.fromRGB(0, 220, 180)
    titleLabel.TextXAlignment = Enum.TextXAlignment.Center
    titleLabel.TextScaled = true
    titleLabel.AnchorPoint = Vector2.new(0.5, 0)
    titleLabel.Size = UDim2.new(0.92, 0, 0.42, 0)
    titleLabel.Position = UDim2.new(0.5, 0, 0.05, 0)
    titleLabel.Text = "MYSTERY BOX"
    local tStroke = Instance.new("UIStroke", titleLabel)
    tStroke.Color = Color3.fromRGB(0, 0, 0)
    tStroke.Thickness = 1.5

    local divider = Instance.new("Frame", frame)
    divider.BorderSizePixel = 0
    divider.BackgroundColor3 = Color3.fromRGB(0, 100, 200)
    divider.Size = UDim2.new(0.85, 0, 0, 1)
    divider.AnchorPoint = Vector2.new(0.5, 0)
    divider.Position = UDim2.new(0.5, 0, 0.5, 0)

    local weaponLabel = Instance.new("TextLabel", frame)
    weaponLabel.Name = "WeaponLabel"
    weaponLabel.BorderSizePixel = 0
    weaponLabel.BackgroundTransparency = 1
    weaponLabel.FontFace = Font.new("rbxasset://fonts/families/Code.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    weaponLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    weaponLabel.TextXAlignment = Enum.TextXAlignment.Center
    weaponLabel.TextScaled = true
    weaponLabel.AnchorPoint = Vector2.new(0.5, 0)
    weaponLabel.Size = UDim2.new(0.92, 0, 0.36, 0)
    weaponLabel.Position = UDim2.new(0.5, 0, 0.54, 0)
    weaponLabel.Text = "..."
    local wStroke = Instance.new("UIStroke", weaponLabel)
    wStroke.Color = Color3.fromRGB(0, 0, 0)
    wStroke.Thickness = 1

    local distLabel = Instance.new("TextLabel", frame)
    distLabel.Name = "DistLabel"
    distLabel.BorderSizePixel = 0
    distLabel.BackgroundTransparency = 1
    distLabel.FontFace = Font.new("rbxasset://fonts/families/Code.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    distLabel.TextColor3 = Color3.fromRGB(120, 120, 120)
    distLabel.TextXAlignment = Enum.TextXAlignment.Center
    distLabel.TextScaled = true
    distLabel.AnchorPoint = Vector2.new(0.5, 0)
    distLabel.Size = UDim2.new(0.92, 0, 0.3, 0)
    distLabel.Position = UDim2.new(0.5, 0, 1.08, 0)
    distLabel.Text = "0M"
    distLabel.ZIndex = 10
    local dStroke = Instance.new("UIStroke", distLabel)
    dStroke.Color = Color3.fromRGB(0, 0, 0)
    dStroke.Thickness = 1.5

    local chosenWeapon = box:FindFirstChild("ChosenWeapon")

    local conn = RunService.Heartbeat:Connect(function()
        if not primary or not primary.Parent then return end
        local char = Players.LocalPlayer.Character
        local root = char and char:FindFirstChild("HumanoidRootPart")
        if root then
            distLabel.Text = math.floor((root.Position - primary.Position).Magnitude) .. "M"
        end
        if chosenWeapon and chosenWeapon.Value ~= "" then
            weaponLabel.Text = chosenWeapon.Value
        else
            weaponLabel.Text = "???"
        end
    end)

    mysteryBoxBillboards[box] = { billboard = billboard, conn = conn }
end

local function removeMysteryBoxBillboard(box)
    local data = mysteryBoxBillboards[box]
    if data then
        data.conn:Disconnect()
        data.billboard:Destroy()
        mysteryBoxBillboards[box] = nil
    end
end

local mysteryBoxConn = nil

local function enableMysteryBoxESP()
    local boxFolder = workspace:FindFirstChild("Mystery Box")
    if not boxFolder then return end
    local boxModel = boxFolder:FindFirstChild("Box")
    if boxModel then
        createMysteryBoxBillboard(boxModel)
    end
    mysteryBoxConn = boxFolder.ChildAdded:Connect(function(child)
        if child.Name == "Box" then
            createMysteryBoxBillboard(child)
        end
    end)
end

local function disableMysteryBoxESP()
    for box, _ in pairs(mysteryBoxBillboards) do
        removeMysteryBoxBillboard(box)
    end
    if mysteryBoxConn then
        mysteryBoxConn:Disconnect()
        mysteryBoxConn = nil
    end
end

local function createPAPBillboard(papModel)
    local primary = papModel.PrimaryPart or papModel:FindFirstChildOfClass("BasePart")
    if not primary then return end

    local billboard = Instance.new("BillboardGui")
    billboard.Name = "PAPESP"
    billboard.Adornee = primary
    billboard.AlwaysOnTop = true
    billboard.StudsOffsetWorldSpace = Vector3.new(0, 4.5, 0)
    billboard.Size = UDim2.fromOffset(140, 52)
    billboard.ResetOnSpawn = false
    billboard.ClipsDescendants = false
    billboard.Parent = papESPFolder

    local frame = Instance.new("Frame", billboard)
    frame.BorderSizePixel = 0
    frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    frame.BackgroundTransparency = 0.3
    frame.Size = UDim2.fromScale(1, 1)
    frame.AnchorPoint = Vector2.new(0.5, 0.5)
    frame.Position = UDim2.fromScale(0.5, 0.5)

    local corner = Instance.new("UICorner", frame)
    corner.CornerRadius = UDim.new(0, 4)

    local topBar = Instance.new("Frame", frame)
    topBar.BorderSizePixel = 0
    topBar.BackgroundColor3 = Color3.fromRGB(180, 0, 255)
    topBar.Size = UDim2.new(1, 0, 0, 2)
    topBar.Position = UDim2.fromScale(0, 0)
    local topCorner = Instance.new("UICorner", topBar)
    topCorner.CornerRadius = UDim.new(0, 4)

    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Color3.fromRGB(180, 0, 255)
    stroke.Thickness = 1.2

    local gradient = Instance.new("UIGradient", stroke)
    gradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(180, 0, 255)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 100, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(180, 0, 255)),
    }

    local titleLabel = Instance.new("TextLabel", frame)
    titleLabel.BorderSizePixel = 0
    titleLabel.BackgroundTransparency = 1
    titleLabel.FontFace = Font.new("rbxasset://fonts/families/Code.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    titleLabel.TextColor3 = Color3.fromRGB(200, 80, 255)
    titleLabel.TextXAlignment = Enum.TextXAlignment.Center
    titleLabel.TextScaled = true
    titleLabel.AnchorPoint = Vector2.new(0.5, 0.5)
    titleLabel.Size = UDim2.new(0.92, 0, 0.5, 0)
    titleLabel.Position = UDim2.new(0.5, 0, 0.35, 0)
    titleLabel.Text = "PACK-A-PUNCH"
    local tStroke = Instance.new("UIStroke", titleLabel)
    tStroke.Color = Color3.fromRGB(0, 0, 0)
    tStroke.Thickness = 1.5

    local distLabel = Instance.new("TextLabel", frame)
    distLabel.Name = "DistLabel"
    distLabel.BorderSizePixel = 0
    distLabel.BackgroundTransparency = 1
    distLabel.FontFace = Font.new("rbxasset://fonts/families/Code.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    distLabel.TextColor3 = Color3.fromRGB(120, 120, 120)
    distLabel.TextXAlignment = Enum.TextXAlignment.Center
    distLabel.TextScaled = true
    distLabel.AnchorPoint = Vector2.new(0.5, 0)
    distLabel.Size = UDim2.new(0.92, 0, 0.3, 0)
    distLabel.Position = UDim2.new(0.5, 0, 1.08, 0)
    distLabel.Text = "0M"
    distLabel.ZIndex = 10
    local dStroke = Instance.new("UIStroke", distLabel)
    dStroke.Color = Color3.fromRGB(0, 0, 0)
    dStroke.Thickness = 1.5

    local conn = RunService.Heartbeat:Connect(function()
        if not primary or not primary.Parent then return end
        local char = Players.LocalPlayer.Character
        local root = char and char:FindFirstChild("HumanoidRootPart")
        if root then
            distLabel.Text = math.floor((root.Position - primary.Position).Magnitude) .. "M"
        end
    end)

    papBillboards[papModel] = { billboard = billboard, conn = conn }
end

local function disablePAPESP()
    for model, data in pairs(papBillboards) do
        data.conn:Disconnect()
        data.billboard:Destroy()
        papBillboards[model] = nil
    end
end

local function enablePAPESP()
    local papFolder = workspace:FindFirstChild("PACKAPUNCH")
    if not papFolder then return end
    local papModel = papFolder:FindFirstChild("PackAPunch")
    if papModel then
        createPAPBillboard(papModel)
    end
end

local hitboxEnabled = false
local hitboxSize = 10
local hitboxColor = Color3.fromRGB(255, 50, 50)
local hitboxTransparency = 0.7
local hitboxMaterial = Enum.Material.ForceField
local noCollideEnabled = false
local originalHRP = {}

local function applyHRP(hrp)
    if not originalHRP[hrp] then
        originalHRP[hrp] = {
            Size = hrp.Size,
            Transparency = hrp.Transparency,
            Material = hrp.Material,
            Color = hrp.Color,
            CanCollide = hrp.CanCollide,
            Massless = hrp.Massless,
        }
    end
    hrp.Size = Vector3.new(hitboxSize, hitboxSize, hitboxSize)
    hrp.Transparency = hitboxTransparency
    hrp.Material = hitboxMaterial
    hrp.Color = hitboxColor
    if noCollideEnabled then
        hrp.CanCollide = false
    end
end

local function applyHitboxes()
    for _, model in ipairs(KillersFolder:GetChildren()) do
        local hrp = model:FindFirstChild("HumanoidRootPart")
        if hrp then applyHRP(hrp) end
    end
end

local function restoreHitboxes()
    for hrp, original in pairs(originalHRP) do
        if hrp and hrp.Parent then
            hrp.Size = original.Size
            hrp.Transparency = original.Transparency
            hrp.Material = original.Material
            hrp.Color = original.Color
            hrp.CanCollide = original.CanCollide
            hrp.Massless = original.Massless
        end
    end
    originalHRP = {}
end

local hitboxConnection = nil
local hitboxDescConnections = {}

local function watchKillerRespawn(model)
    local conn = model.DescendantAdded:Connect(function(desc)
        if not hitboxEnabled then return end
        if desc.Name ~= "HumanoidRootPart" then return end
        task.defer(function()
            task.wait(1)
            if not hitboxEnabled then return end
            for hrp in pairs(originalHRP) do
                if not hrp.Parent then
                    originalHRP[hrp] = nil
                end
            end
            if desc.Parent then applyHRP(desc) end
        end)
    end)
    hitboxDescConnections[model] = conn
end

local function enableHitboxes()
    applyHitboxes()
    for _, model in ipairs(KillersFolder:GetChildren()) do
        watchKillerRespawn(model)
    end
    hitboxConnection = KillersFolder.ChildAdded:Connect(function(child)
        task.defer(function()
            task.wait(1)
            if not hitboxEnabled then return end
            local hrp = child:FindFirstChild("HumanoidRootPart")
            if hrp then applyHRP(hrp) end
            watchKillerRespawn(child)
        end)
    end)
end

local function disableHitboxes()
    restoreHitboxes()
    if hitboxConnection then
        hitboxConnection:Disconnect()
        hitboxConnection = nil
    end
    for _, conn in pairs(hitboxDescConnections) do
        conn:Disconnect()
    end
    hitboxDescConnections = {}
end

RunService.Heartbeat:Connect(function()
    if not noCollideEnabled then return end
    for _, model in ipairs(KillersFolder:GetChildren()) do
        local hrp = model:FindFirstChild("HumanoidRootPart")
        if hrp and hrp.CanCollide then
            hrp.CanCollide = false
        end
    end
end)

local function worldToViewport(pos)
    local camera = workspace.CurrentCamera
    if not camera then return Vector2.new(0, 0), 0, false end
    local ok, sp, onScreen = pcall(function()
        return camera:WorldToViewportPoint(pos)
    end)
    if not ok then return Vector2.new(0, 0), 0, false end
    return Vector2.new(sp.X, sp.Y), sp.Z, onScreen
end

local function createKillerBillboard(model)
    local primaryPart = model.PrimaryPart or model:FindFirstChildOfClass("BasePart")
    if not primaryPart then return end

    local billboard = Instance.new("BillboardGui")
    billboard.Name = "KillerESP_" .. model.Name
    billboard.Adornee = primaryPart
    billboard.AlwaysOnTop = true
    billboard.StudsOffsetWorldSpace = Vector3.new(0, 3.2, 0)
    billboard.Size = UDim2.fromOffset(110, 52)
    billboard.ResetOnSpawn = false
    billboard.ClipsDescendants = false
    billboard.Parent = killerESPFolder

    local mainFrame = Instance.new("Frame", billboard)
    mainFrame.BorderSizePixel = 0
    mainFrame.BackgroundColor3 = Color3.fromRGB(8, 8, 8)
    mainFrame.BackgroundTransparency = 0.25
    mainFrame.Size = UDim2.fromScale(1, 1)
    mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    mainFrame.Position = UDim2.fromScale(0.5, 0.5)

    local corner = Instance.new("UICorner", mainFrame)
    corner.CornerRadius = UDim.new(0, 4)

    local topBar = Instance.new("Frame", mainFrame)
    topBar.BorderSizePixel = 0
    topBar.BackgroundColor3 = Color3.fromRGB(200, 30, 30)
    topBar.Size = UDim2.new(1, 0, 0, 2)
    topBar.Position = UDim2.fromScale(0, 0)
    local topCorner = Instance.new("UICorner", topBar)
    topCorner.CornerRadius = UDim.new(0, 4)

    local stroke = Instance.new("UIStroke", mainFrame)
    stroke.Color = Color3.fromRGB(180, 20, 20)
    stroke.Thickness = 1

    local nameLabel = Instance.new("TextLabel", mainFrame)
    nameLabel.BorderSizePixel = 0
    nameLabel.BackgroundTransparency = 1
    nameLabel.FontFace = Font.new("rbxasset://fonts/families/Code.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    nameLabel.TextXAlignment = Enum.TextXAlignment.Center
    nameLabel.TextScaled = true
    nameLabel.AnchorPoint = Vector2.new(0.5, 0)
    nameLabel.Size = UDim2.new(0.92, 0, 0.44, 0)
    nameLabel.Position = UDim2.new(0.5, 0, 0.06, 0)
    nameLabel.Text = model.Name
    local nameStroke = Instance.new("UIStroke", nameLabel)
    nameStroke.Color = Color3.fromRGB(0, 0, 0)
    nameStroke.Thickness = 1.5

    local divider = Instance.new("Frame", mainFrame)
    divider.BorderSizePixel = 0
    divider.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    divider.Size = UDim2.new(0.85, 0, 0, 1)
    divider.AnchorPoint = Vector2.new(0.5, 0)
    divider.Position = UDim2.new(0.5, 0, 0.5, 0)

    local hpLabel = Instance.new("TextLabel", mainFrame)
    hpLabel.Name = "HPLabel"
    hpLabel.BorderSizePixel = 0
    hpLabel.BackgroundTransparency = 1
    hpLabel.FontFace = Font.new("rbxasset://fonts/families/Code.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    hpLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
    hpLabel.TextXAlignment = Enum.TextXAlignment.Center
    hpLabel.TextScaled = true
    hpLabel.AnchorPoint = Vector2.new(0.5, 0)
    hpLabel.Size = UDim2.new(0.92, 0, 0.36, 0)
    hpLabel.Position = UDim2.new(0.5, 0, 0.54, 0)
    hpLabel.Text = "HP: ?"
    local hpStroke = Instance.new("UIStroke", hpLabel)
    hpStroke.Color = Color3.fromRGB(0, 0, 0)
    hpStroke.Thickness = 1

    local distLabel = Instance.new("TextLabel", mainFrame)
    distLabel.Name = "DistLabel"
    distLabel.BorderSizePixel = 0
    distLabel.BackgroundTransparency = 1
    distLabel.FontFace = Font.new("rbxasset://fonts/families/Code.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    distLabel.TextColor3 = Color3.fromRGB(160, 160, 160)
    distLabel.TextXAlignment = Enum.TextXAlignment.Center
    distLabel.TextScaled = true
    distLabel.AnchorPoint = Vector2.new(0.5, 0)
    distLabel.Size = UDim2.new(0.92, 0, 0.3, 0)
    distLabel.Position = UDim2.new(0.5, 0, 1.08, 0)
    distLabel.Text = "0M"
    distLabel.ZIndex = 10
    local distStroke = Instance.new("UIStroke", distLabel)
    distStroke.Color = Color3.fromRGB(0, 0, 0)
    distStroke.Thickness = 1.5

    local conn = RunService.Heartbeat:Connect(function()
        local char = Players.LocalPlayer.Character
        if not char then return end
        local root = char:FindFirstChild("HumanoidRootPart")
        if not root then return end
        if not primaryPart or not primaryPart.Parent then return end
        local dist = math.floor((root.Position - primaryPart.Position).Magnitude)
        distLabel.Text = dist .. "M"
        local humanoid = model:FindFirstChildOfClass("Humanoid")
        if humanoid then
            local hp = math.floor(humanoid.Health)
            local maxHp = math.floor(humanoid.MaxHealth)
            hpLabel.Text = "HP: " .. hp .. "/" .. maxHp
        end
    end)

    killerBillboards[model] = { billboard = billboard, conn = conn }
end

local function removeKillerBillboard(model)
    local data = killerBillboards[model]
    if data then
        data.conn:Disconnect()
        data.billboard:Destroy()
        killerBillboards[model] = nil
    end
end

local drawRenderConnection = nil

local function renderDrawings(camera, screenSize, screenCenter, myRoot, drawings, boxEnabled, boxStyle, boxColor, linesEnabled)
    for model, data in pairs(drawings) do
        local primaryPart = data.primaryPart
        if not primaryPart or not primaryPart.Parent then
            if data.shadows then for _, s in ipairs(data.shadows) do s.Visible = false end end
            for _, l in ipairs(data.corners) do l.Visible = false end
            data.line.Visible = false
            if data.hpBarBg then data.hpBarBg.Visible = false end
            if data.hpBarFill then data.hpBarFill.Visible = false end
            data.nameText.Visible = false
            data.hpText.Visible = false
            data.distText.Visible = false
            if data.toolText then data.toolText.Visible = false end
            continue
        end

        local rootPos = primaryPart.Position
        local sp, spOnScreen = camera:WorldToViewportPoint(rootPos)
        local onScreen = spOnScreen and sp.Z > 0 and sp.X > 0 and sp.X < screenSize.X and sp.Y > 0 and sp.Y < screenSize.Y
        local screenPos = Vector2.new(sp.X, sp.Y)

        if not onScreen then
            if data.shadows then for _, s in ipairs(data.shadows) do s.Visible = false end end
            for _, l in ipairs(data.corners) do l.Visible = false end
            data.line.Visible = false
            if data.hpBarBg then data.hpBarBg.Visible = false end
            if data.hpBarFill then data.hpBarFill.Visible = false end
            data.nameText.Visible = false
            data.hpText.Visible = false
            data.distText.Visible = false
            if data.toolText then data.toolText.Visible = false end
            continue
        end

        if myRoot then
            data.distText.Text = math.floor((myRoot.Position - rootPos).Magnitude) .. "m"
        end

        local hpRatio = 1
        local humanoid = model:FindFirstChildOfClass("Humanoid")
        if humanoid then
            local hp = math.floor(humanoid.Health)
            local maxHp = math.floor(humanoid.MaxHealth)
            hpRatio = math.clamp(hp / math.max(maxHp, 1), 0, 1)
            data.hpText.Text = hp .. "/" .. maxHp
            data.hpText.Color = Color3.fromRGB(255, 255, 255)
        end
        if data.toolText then
            local char = model:FindFirstChildOfClass("Model")
            local tool = char and char:FindFirstChildOfClass("Tool") or model:FindFirstChildOfClass("Tool")
            data.toolText.Text = tool and tool.Name or ""
            data.toolText.Visible = tool ~= nil
        end

        if boxEnabled then
            if boxStyle == "3D" then
                local m = data.model
                if m and m.Parent then
                    local cf = m:GetBoundingBox()
                    local size = m:GetExtentsSize() / 2
                    local corners3d = {
                        Vector3.new( size.X,  size.Y,  size.Z),
                        Vector3.new(-size.X,  size.Y,  size.Z),
                        Vector3.new(-size.X, -size.Y,  size.Z),
                        Vector3.new( size.X, -size.Y,  size.Z),
                        Vector3.new( size.X,  size.Y, -size.Z),
                        Vector3.new(-size.X,  size.Y, -size.Z),
                        Vector3.new(-size.X, -size.Y, -size.Z),
                        Vector3.new( size.X, -size.Y, -size.Z),
                    }
                    local projected = {}
                    local allVisible = true
                    for _, offset in ipairs(corners3d) do
                        local worldPt = cf * offset
                        local sp2 = camera:WorldToViewportPoint(worldPt)
                        if sp2.Z <= 0 then allVisible = false end
                        table.insert(projected, Vector2.new(sp2.X, sp2.Y))
                    end
                    if allVisible then
                        local edges = {
                            {1,2},{2,3},{3,4},{4,1},
                            {5,6},{6,7},{7,8},{8,5},
                            {1,5},{2,6},{3,7},{4,8},
                        }
                        for i, e in ipairs(edges) do
                            data.corners[i].From    = projected[e[1]]
                            data.corners[i].To      = projected[e[2]]
                            data.corners[i].Color   = boxColor
                            data.corners[i].Visible = true
                        end
                        local minY = math.huge
                        local maxY = -math.huge
                        for _, p in ipairs(projected) do
                            if p.Y < minY then minY = p.Y end
                            if p.Y > maxY then maxY = p.Y end
                        end
                        data.nameText.Position = Vector2.new(screenPos.X, minY - 17)
                        data.hpText.Position   = Vector2.new(screenPos.X, maxY + 2)
                        data.distText.Position = Vector2.new(screenPos.X, maxY + 17)
                        if data.toolText then data.toolText.Position = Vector2.new(screenPos.X, maxY + 32) end
                    else
                        for _, l in ipairs(data.corners) do l.Visible = false end
                        data.nameText.Position = Vector2.new(screenPos.X, screenPos.Y - 30)
                        data.hpText.Position   = Vector2.new(screenPos.X, screenPos.Y - 16)
                        data.distText.Position = Vector2.new(screenPos.X, screenPos.Y - 1)
                    end
                end
            else
                local tspV = camera:WorldToViewportPoint(rootPos + Vector3.new(0, 2.8, 0))
                local bspV = camera:WorldToViewportPoint(rootPos + Vector3.new(0, -3, 0))
                local h = math.abs(bspV.Y - tspV.Y)
                local w = h * 0.52
                local bx = screenPos.X - w / 2
                local by = tspV.Y
                local x2, y2 = bx + w, by + h

                local cl = math.min(6, w * 0.3, h * 0.3)
                local pts = {
                    {Vector2.new(bx,    by),    Vector2.new(bx+cl, by)},
                    {Vector2.new(bx,    by),    Vector2.new(bx,    by+cl)},
                    {Vector2.new(x2,    by),    Vector2.new(x2-cl, by)},
                    {Vector2.new(x2,    by),    Vector2.new(x2,    by+cl)},
                    {Vector2.new(bx,    y2),    Vector2.new(bx+cl, y2)},
                    {Vector2.new(bx,    y2),    Vector2.new(bx,    y2-cl)},
                    {Vector2.new(x2,    y2),    Vector2.new(x2-cl, y2)},
                    {Vector2.new(x2,    y2),    Vector2.new(x2,    y2-cl)},
                }
                if data.shadows then
                    for i, p in ipairs(pts) do
                        data.shadows[i].From    = p[1]
                        data.shadows[i].To      = p[2]
                        data.shadows[i].Visible = true
                    end
                    for i = 9, 12 do data.shadows[i].Visible = false end
                end
                for i, p in ipairs(pts) do
                    data.corners[i].From    = p[1]
                    data.corners[i].To      = p[2]
                    data.corners[i].Color   = boxColor
                    data.corners[i].Visible = true
                end
                for i = 9, 12 do data.corners[i].Visible = false end

                data.nameText.Position = Vector2.new(screenPos.X, by - 16)
                data.hpText.Position   = Vector2.new(screenPos.X, y2 + 14)
                data.distText.Position = Vector2.new(screenPos.X, y2 + 25)
                if data.toolText then data.toolText.Position = Vector2.new(screenPos.X, y2 + 36) end

                if data.hpBarBg then
                    local barX = bx - 5
                    local barH = h * hpRatio
                    data.hpBarBg.From    = Vector2.new(barX, by)
                    data.hpBarBg.To      = Vector2.new(barX, y2)
                    data.hpBarBg.Visible = true
                    data.hpBarFill.From  = Vector2.new(barX, y2)
                    data.hpBarFill.To    = Vector2.new(barX, y2 - barH)
                    data.hpBarFill.Color = Color3.fromRGB(
                        math.floor((1 - hpRatio) * 255),
                        math.floor(hpRatio * 220),
                        60
                    )
                    data.hpBarFill.Visible = true
                end
            end
        else
            if data.shadows then for _, s in ipairs(data.shadows) do s.Visible = false end end
            for _, l in ipairs(data.corners) do l.Visible = false end
            if data.hpBarBg then data.hpBarBg.Visible = false end
            if data.hpBarFill then data.hpBarFill.Visible = false end
            data.nameText.Position = Vector2.new(screenPos.X, screenPos.Y - 30)
            data.hpText.Position   = Vector2.new(screenPos.X, screenPos.Y - 16)
            data.distText.Position = Vector2.new(screenPos.X, screenPos.Y - 1)
            if data.toolText then data.toolText.Position = Vector2.new(screenPos.X, screenPos.Y + 14) end
        end

        if linesEnabled then
            data.line.From    = screenCenter
            data.line.To      = screenPos
            data.line.Visible = true
        else
            data.line.Visible = false
        end

        data.nameText.Visible = true
        data.hpText.Visible   = true
        data.distText.Visible = true
    end
end

local function startDrawRender()
    if drawRenderConnection then return end
    drawRenderConnection = RunService.RenderStepped:Connect(function()
        local camera = workspace.CurrentCamera
        if not camera then return end
        local screenSize = camera.ViewportSize
        local screenCenter = Vector2.new(screenSize.X / 2, screenSize.Y)
        local char = Players.LocalPlayer.Character
        local myRoot = char and char:FindFirstChild("HumanoidRootPart")
        renderDrawings(camera, screenSize, screenCenter, myRoot, killerDrawings, drawBoxes, drawStyle, killerBoxColor, drawLines)
        renderDrawings(camera, screenSize, screenCenter, myRoot, playerDrawings, playerDrawBoxes, playerDrawStyle, playerBoxColor, playerDrawLines)
    end)
end

local function stopDrawRender()
    if not next(killerDrawings) and not next(playerDrawings) then
        if drawRenderConnection then
            drawRenderConnection:Disconnect()
            drawRenderConnection = nil
        end
    end
end

local function createKillerDrawings(model)
    local primaryPart = model.PrimaryPart or model:FindFirstChildOfClass("BasePart")

    local shadows = {}
    for i = 1, 12 do
        local s = Drawing.new("Line")
        s.Visible   = false
        s.Color     = Color3.fromRGB(0, 0, 0)
        s.Thickness = 3.5
        shadows[i]  = s
    end

    local corners = {}
    for i = 1, 12 do
        local l = Drawing.new("Line")
        l.Visible   = false
        l.Color     = killerBoxColor
        l.Thickness = 1.5
        corners[i]  = l
    end

    local line = Drawing.new("Line")
    line.Visible   = false
    line.Color     = killerBoxColor
    line.Thickness = 1

    local hpBarBg = Drawing.new("Line")
    hpBarBg.Visible   = false
    hpBarBg.Color     = Color3.fromRGB(30, 30, 30)
    hpBarBg.Thickness = 4

    local hpBarFill = Drawing.new("Line")
    hpBarFill.Visible   = false
    hpBarFill.Color     = Color3.fromRGB(255, 255, 255)
    hpBarFill.Thickness = 4

    local nameText = Drawing.new("Text")
    nameText.Visible       = false
    nameText.Color         = Color3.fromRGB(255, 255, 255)
    nameText.Size          = 13
    nameText.Font          = Drawing.Fonts.Monospace
    nameText.Outline       = true
    nameText.OutlineColor  = Color3.fromRGB(0, 0, 0)
    nameText.Text          = model.Name
    nameText.Center        = true

    local hpText = Drawing.new("Text")
    hpText.Visible      = false
    hpText.Color        = Color3.fromRGB(200, 200, 200)
    hpText.Size         = 11
    hpText.Font         = Drawing.Fonts.Monospace
    hpText.Outline      = true
    hpText.OutlineColor = Color3.fromRGB(0, 0, 0)
    hpText.Text         = "HP: ?"
    hpText.Center       = true

    local distText = Drawing.new("Text")
    distText.Visible      = false
    distText.Color        = Color3.fromRGB(140, 140, 140)
    distText.Size         = 10
    distText.Font         = Drawing.Fonts.Monospace
    distText.Outline      = true
    distText.OutlineColor = Color3.fromRGB(0, 0, 0)
    distText.Center       = true

    killerDrawings[model] = {
        model       = model,
        primaryPart = primaryPart,
        humanoid    = model:FindFirstChildOfClass("Humanoid"),
        shadows     = shadows,
        corners     = corners,
        line        = line,
        hpBarBg     = hpBarBg,
        hpBarFill   = hpBarFill,
        nameText    = nameText,
        hpText      = hpText,
        distText    = distText,
    }

    startDrawRender()
end

local function removeKillerDrawings(model)
    local data = killerDrawings[model]
    if data then
        for _, l in ipairs(data.shadows) do l:Remove() end
        for _, l in ipairs(data.corners) do l:Remove() end
        data.line:Remove()
        data.hpBarBg:Remove()
        data.hpBarFill:Remove()
        data.nameText:Remove()
        data.hpText:Remove()
        data.distText:Remove()
        killerDrawings[model] = nil
    end
    stopDrawRender()
end

local function refreshKillerESP()
    for model in pairs(killerDrawings) do removeKillerDrawings(model) end
    for model in pairs(killerBillboards) do removeKillerBillboard(model) end
    if not killerESPEnabled then return end
    for _, model in ipairs(KillersFolder:GetChildren()) do
        if drawOverride then createKillerDrawings(model) else createKillerBillboard(model) end
    end
end

local function enableKillerESP()
    for _, model in ipairs(KillersFolder:GetChildren()) do
        if drawOverride then createKillerDrawings(model) else createKillerBillboard(model) end
    end
    table.insert(killerESPConnections, KillersFolder.ChildAdded:Connect(function(child)
        if drawOverride then createKillerDrawings(child) else createKillerBillboard(child) end
    end))
    table.insert(killerESPConnections, KillersFolder.ChildRemoved:Connect(function(child)
        removeKillerDrawings(child)
        removeKillerBillboard(child)
    end))
end

local function disableKillerESP()
    for model in pairs(killerDrawings) do removeKillerDrawings(model) end
    for model in pairs(killerBillboards) do removeKillerBillboard(model) end
    for _, c in ipairs(killerESPConnections) do c:Disconnect() end
    killerESPConnections = {}
end


local function createPlayerBillboard(model)
    local primaryPart = model.PrimaryPart or model:FindFirstChildOfClass("BasePart")
    if not primaryPart then return end

    local billboard = Instance.new("BillboardGui")
    billboard.Name = "PlayerESP_" .. model.Name
    billboard.Adornee = primaryPart
    billboard.AlwaysOnTop = true
    billboard.StudsOffsetWorldSpace = Vector3.new(0, 3.2, 0)
    billboard.Size = UDim2.fromOffset(110, 52)
    billboard.ResetOnSpawn = false
    billboard.ClipsDescendants = false
    billboard.Parent = playerESPFolder

    local mainFrame = Instance.new("Frame", billboard)
    mainFrame.BorderSizePixel = 0
    mainFrame.BackgroundColor3 = Color3.fromRGB(8, 8, 8)
    mainFrame.BackgroundTransparency = 0.25
    mainFrame.Size = UDim2.fromScale(1, 1)
    mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    mainFrame.Position = UDim2.fromScale(0.5, 0.5)

    local corner = Instance.new("UICorner", mainFrame)
    corner.CornerRadius = UDim.new(0, 4)

    local topBar = Instance.new("Frame", mainFrame)
    topBar.BorderSizePixel = 0
    topBar.BackgroundColor3 = Color3.fromRGB(30, 120, 220)
    topBar.Size = UDim2.new(1, 0, 0, 2)
    topBar.Position = UDim2.fromScale(0, 0)
    local topCorner = Instance.new("UICorner", topBar)
    topCorner.CornerRadius = UDim.new(0, 4)

    local stroke = Instance.new("UIStroke", mainFrame)
    stroke.Color = Color3.fromRGB(30, 100, 200)
    stroke.Thickness = 1

    local nameLabel = Instance.new("TextLabel", mainFrame)
    nameLabel.BorderSizePixel = 0
    nameLabel.BackgroundTransparency = 1
    nameLabel.FontFace = Font.new("rbxasset://fonts/families/Code.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    nameLabel.TextXAlignment = Enum.TextXAlignment.Center
    nameLabel.TextScaled = true
    nameLabel.AnchorPoint = Vector2.new(0.5, 0)
    nameLabel.Size = UDim2.new(0.92, 0, 0.44, 0)
    nameLabel.Position = UDim2.new(0.5, 0, 0.06, 0)
    nameLabel.Text = model.Name
    local nameStroke = Instance.new("UIStroke", nameLabel)
    nameStroke.Color = Color3.fromRGB(0, 0, 0)
    nameStroke.Thickness = 1.5

    local divider = Instance.new("Frame", mainFrame)
    divider.BorderSizePixel = 0
    divider.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    divider.Size = UDim2.new(0.85, 0, 0, 1)
    divider.AnchorPoint = Vector2.new(0.5, 0)
    divider.Position = UDim2.new(0.5, 0, 0.5, 0)

    local hpLabel = Instance.new("TextLabel", mainFrame)
    hpLabel.Name = "HPLabel"
    hpLabel.BorderSizePixel = 0
    hpLabel.BackgroundTransparency = 1
    hpLabel.FontFace = Font.new("rbxasset://fonts/families/Code.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    hpLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
    hpLabel.TextXAlignment = Enum.TextXAlignment.Center
    hpLabel.TextScaled = true
    hpLabel.AnchorPoint = Vector2.new(0.5, 0)
    hpLabel.Size = UDim2.new(0.92, 0, 0.36, 0)
    hpLabel.Position = UDim2.new(0.5, 0, 0.54, 0)
    hpLabel.Text = "HP: ?"
    local hpStroke = Instance.new("UIStroke", hpLabel)
    hpStroke.Color = Color3.fromRGB(0, 0, 0)
    hpStroke.Thickness = 1

    local distLabel = Instance.new("TextLabel", mainFrame)
    distLabel.Name = "DistLabel"
    distLabel.BorderSizePixel = 0
    distLabel.BackgroundTransparency = 1
    distLabel.FontFace = Font.new("rbxasset://fonts/families/Code.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    distLabel.TextColor3 = Color3.fromRGB(160, 160, 160)
    distLabel.TextXAlignment = Enum.TextXAlignment.Center
    distLabel.TextScaled = true
    distLabel.AnchorPoint = Vector2.new(0.5, 0)
    distLabel.Size = UDim2.new(0.92, 0, 0.3, 0)
    distLabel.Position = UDim2.new(0.5, 0, 1.08, 0)
    distLabel.Text = "0M"
    distLabel.ZIndex = 10
    local distStroke = Instance.new("UIStroke", distLabel)
    distStroke.Color = Color3.fromRGB(0, 0, 0)
    distStroke.Thickness = 1.5

    local conn = RunService.Heartbeat:Connect(function()
        local char = Players.LocalPlayer.Character
        if not char then return end
        local root = char:FindFirstChild("HumanoidRootPart")
        if not root then return end
        if not primaryPart or not primaryPart.Parent then return end
        local dist = math.floor((root.Position - primaryPart.Position).Magnitude)
        distLabel.Text = dist .. "M"
        local humanoid = model:FindFirstChildOfClass("Humanoid")
        if humanoid then
            local hp = math.floor(humanoid.Health)
            local maxHp = math.floor(humanoid.MaxHealth)
            hpLabel.Text = "HP: " .. hp .. "/" .. maxHp
        end
    end)

    playerBillboards[model] = { billboard = billboard, conn = conn }
end

local function removePlayerBillboard(model)
    local data = playerBillboards[model]
    if data then
        data.conn:Disconnect()
        data.billboard:Destroy()
        playerBillboards[model] = nil
    end
end



local function createPlayerDrawings(model)
    local primaryPart = model.PrimaryPart or model:FindFirstChildOfClass("BasePart")

    local corners = {}
    for i = 1, 12 do
        local l = Drawing.new("Line")
        l.Visible   = false
        l.Color     = playerBoxColor
        l.Thickness = 1.8
        corners[i]  = l
    end

    local line = Drawing.new("Line")
    line.Visible   = false
    line.Color     = playerBoxColor
    line.Thickness = 1.2

    local playerShadows = {}
    for i = 1, 12 do
        local s = Drawing.new("Line")
        s.Visible   = false
        s.Color     = Color3.fromRGB(0, 0, 0)
        s.Thickness = 3.5
        playerShadows[i] = s
    end

    local nameText = Drawing.new("Text")
    nameText.Visible       = false
    nameText.Color         = Color3.fromRGB(255, 255, 255)
    nameText.Size          = 13
    nameText.Font          = Drawing.Fonts.Monospace
    nameText.Outline       = true
    nameText.OutlineColor  = Color3.fromRGB(0, 0, 0)
    nameText.Text          = model.Name
    nameText.Center        = true

    local hpText = Drawing.new("Text")
    hpText.Visible      = false
    hpText.Color        = Color3.fromRGB(200, 200, 200)
    hpText.Size         = 11
    hpText.Font         = Drawing.Fonts.Monospace
    hpText.Outline      = true
    hpText.OutlineColor = Color3.fromRGB(0, 0, 0)
    hpText.Text         = "HP: ?"
    hpText.Center       = true

    local distText = Drawing.new("Text")
    distText.Visible      = false
    distText.Color        = Color3.fromRGB(140, 140, 140)
    distText.Size         = 10
    distText.Font         = Drawing.Fonts.Monospace
    distText.Outline      = true
    distText.OutlineColor = Color3.fromRGB(0, 0, 0)
    distText.Center       = true

    local toolText = Drawing.new("Text")
    toolText.Visible      = false
    toolText.Color        = Color3.fromRGB(180, 180, 180)
    toolText.Size         = 10
    toolText.Font         = Drawing.Fonts.Monospace
    toolText.Outline      = true
    toolText.OutlineColor = Color3.fromRGB(0, 0, 0)
    toolText.Text         = ""
    toolText.Center       = true

    local hpBarBg = Drawing.new("Line")
    hpBarBg.Visible   = false
    hpBarBg.Color     = Color3.fromRGB(30, 30, 30)
    hpBarBg.Thickness = 4

    local hpBarFill = Drawing.new("Line")
    hpBarFill.Visible   = false
    hpBarFill.Color     = Color3.fromRGB(255, 255, 255)
    hpBarFill.Thickness = 4

    playerDrawings[model] = {
        model       = model,
        primaryPart = primaryPart,
        humanoid    = model:FindFirstChildOfClass("Humanoid"),
        shadows     = playerShadows,
        corners     = corners,
        line        = line,
        hpBarBg     = hpBarBg,
        hpBarFill   = hpBarFill,
        nameText    = nameText,
        hpText      = hpText,
        distText    = distText,
        toolText    = toolText,
    }

    startDrawRender()
end

local function removePlayerDrawings(model)
    local data = playerDrawings[model]
    if data then
        if data.shadows then for _, l in ipairs(data.shadows) do l:Remove() end end
        for _, l in ipairs(data.corners) do l:Remove() end
        data.line:Remove()
        data.hpBarBg:Remove()
        data.hpBarFill:Remove()
        data.nameText:Remove()
        data.hpText:Remove()
        data.distText:Remove()
        data.toolText:Remove()
        playerDrawings[model] = nil
    end
    stopDrawRender()
end

local function refreshPlayerESP()
    for model in pairs(playerDrawings) do removePlayerDrawings(model) end
    for model in pairs(playerBillboards) do removePlayerBillboard(model) end
    if not playerESPEnabled then return end
    for _, model in ipairs(PlayersFolder:GetChildren()) do
        if playerDrawOverride then createPlayerDrawings(model) else createPlayerBillboard(model) end
    end
end

local function enablePlayerESP()
    for _, model in ipairs(PlayersFolder:GetChildren()) do
        if playerDrawOverride then createPlayerDrawings(model) else createPlayerBillboard(model) end
    end
    table.insert(playerESPConnections, PlayersFolder.ChildAdded:Connect(function(child)
        if playerDrawOverride then createPlayerDrawings(child) else createPlayerBillboard(child) end
    end))
    table.insert(playerESPConnections, PlayersFolder.ChildRemoved:Connect(function(child)
        removePlayerDrawings(child)
        removePlayerBillboard(child)
    end))
end

local function disablePlayerESP()
    for model in pairs(playerDrawings) do removePlayerDrawings(model) end
    for model in pairs(playerBillboards) do removePlayerBillboard(model) end
    for _, c in ipairs(playerESPConnections) do c:Disconnect() end
    playerESPConnections = {}
end
local autoHealEnabled = false
local healThreshold = 50
local autoHealConnection = nil

local function startAutoHeal()
    local backpack = Players.LocalPlayer:WaitForChild("Backpack")
    local energy = backpack:WaitForChild("Energy")
    autoHealConnection = RunService.Heartbeat:Connect(function()
        if not autoHealEnabled then return end
        local char = Players.LocalPlayer.Character
        if not char then return end
        local humanoid = char:FindFirstChildOfClass("Humanoid")
        if not humanoid then return end
        if humanoid.Health > healThreshold then return end
        local equipped = humanoid:FindFirstChildOfClass("Tool") or char:FindFirstChildOfClass("Tool")
        local hum = humanoid
        if energy.Parent ~= char then
            energy.Parent = char
        end
        hum:EquipTool(energy)
        task.wait()
        local activatable = energy:FindFirstChildOfClass("LocalScript") or energy
        energy:Activate()
        task.wait()
        if equipped then
            hum:EquipTool(equipped)
        else
            hum:UnequipTools()
        end
    end)
end

local function stopAutoHeal()
    if autoHealConnection then
        autoHealConnection:Disconnect()
        autoHealConnection = nil
    end
end

local ElementsSection = Window:Section({ Title = "Elements" })
local ConfigSection   = Window:Section({ Title = "Cfgs" })

local WeaponsTab = ElementsSection:Tab({
    Title  = "Weapons",
    Icon   = "crosshair",
    Locked = false,
})

local VisualsTab = ElementsSection:Tab({
    Title  = "Visuals",
    Icon   = "eye",
    Locked = false,
})

local KillerTab = ElementsSection:Tab({
    Title  = "Player",
    Icon   = "user",
    Locked = false,
})

local HitboxTab = ElementsSection:Tab({
    Title  = "Killer Hitboxes",
    Icon   = "box",
    Locked = false,
})

KillerTab:Toggle({
    Flag     = "AutoHeal",
    Title    = "Auto Heal",
    Desc     = "Requires the Energy Drink gamepass",
    Value    = false,
    Locked   = false,
    Callback = function(state)
        autoHealEnabled = state
        if state then
            task.spawn(startAutoHeal)
        else
            stopAutoHeal()
        end
    end,
})

KillerTab:Slider({
    Flag  = "HealthInt",
    Title = "Health Int",
    Step  = 1,
    Value = {
        Min     = 1,
        Max     = 100,
        Default = 50,
    },
    Callback = function(value)
        healThreshold = value
    end,
})

WeaponsTab:Toggle({
    Flag     = "WeaponsEsp",
    Title    = "Weapon ESP",
    Desc     = "Shows all weapons in the game",
    Value    = false,
    Locked   = false,
    Callback = function(state)
        espEnabled = state
        if espEnabled then enableESP() else disableESP() end
    end,
})

WeaponsTab:Space()

local gunList = {}
for _, model in ipairs(WeaponsFolder:GetChildren()) do
    table.insert(gunList, model.Name)
end

local selectedGun = gunList[1]
local tweenActive = false
local tpDelay = 5

WeaponsTab:Slider({
    Flag  = "TpDelay",
    Title = "TP Delay",
    Step  = 0.5,
    Value = {
        Min     = 0.5,
        Max     = 10,
        Default = 5,
    },
    Callback = function(value)
        tpDelay = value
    end,
})

WeaponsTab:Dropdown({
    Flag     = "GunDropdown",
    Title    = "Select Gun",
    Desc     = "Choose which gun to collect",
    Values   = gunList,
    Value    = selectedGun,
    Callback = function(value)
        selectedGun = value
    end,
})

WeaponsTab:Button({
    Title    = "Auto Find Gun",
    Desc     = "collects the gun",
    Locked   = false,
    Callback = function()
        if tweenActive then return end
        local target = WeaponsFolder:FindFirstChild(selectedGun)
        if not target then return end
        local char = Players.LocalPlayer.Character
        if not char then return end
        local root = char:FindFirstChild("HumanoidRootPart")
        if not root then return end
        tweenActive = true
        local tween = TweenService:Create(root, TweenInfo.new(0.15, Enum.EasingStyle.Linear), {
            CFrame = CFrame.new(target:GetPivot().Position + Vector3.new(0, 3, 0))
        })
        tween:Play()
        tween.Completed:Wait()
        local hitbox = target:FindFirstChild("Hitbox")
        if hitbox then
            local prompt = hitbox:FindFirstChildOfClass("ProximityPrompt")
            if prompt then fireproximityprompt(prompt) end
        end
        tweenActive = false
    end,
})

WeaponsTab:Button({
    Title    = "Auto Collect All Guns",
    Desc     = "Self explanatory",
    Locked   = false,
    Callback = function()
        if tweenActive then return end
        local char = Players.LocalPlayer.Character
        if not char then return end
        local root = char:FindFirstChild("HumanoidRootPart")
        if not root then return end
        tweenActive = true
        for _, target in ipairs(WeaponsFolder:GetChildren()) do
            if not tweenActive then break end
            local tween = TweenService:Create(root, TweenInfo.new(0.15, Enum.EasingStyle.Linear), {
                CFrame = CFrame.new(target:GetPivot().Position + Vector3.new(0, 3, 0))
            })
            tween:Play()
            tween.Completed:Wait()
            local hitbox = target:FindFirstChild("Hitbox")
            if hitbox then
                local prompt = hitbox:FindFirstChildOfClass("ProximityPrompt")
                if prompt then fireproximityprompt(prompt) end
            end
            task.wait(tpDelay)
        end
        tweenActive = false
    end,
})

WeaponsTab:Button({
    Title    = "Stop Grabbing",
    Desc     = "Stops any active teleport to guns",
    Locked   = false,
    Callback = function()
        tweenActive = false
    end,
})

WeaponsTab:Button({
    Title    = "Refill Ammo",
    Desc     = "Self explanatory",
    Locked   = false,
    Callback = function()
        if tweenActive then return end
        local char = Players.LocalPlayer.Character
        if not char then return end
        local root = char:FindFirstChild("HumanoidRootPart")
        if not root then return end

        local area = workspace:FindFirstChild("AREA51")
        local plantRoom = area and area:FindFirstChild("PlantRoom")
        local boxOfShells = plantRoom and plantRoom:FindFirstChild("Box of Shells")
        local ammoBox = boxOfShells and boxOfShells:FindFirstChild("Box")

        if not ammoBox then
            WindUI:Notify({ Title = "Refill Ammo", Content = "Ammo box not found", Icon = "x" })
            return
        end

        tweenActive = true
        local originalCF = root.CFrame

        local tweenTo = TweenService:Create(root, TweenInfo.new(0.15, Enum.EasingStyle.Linear), {
            CFrame = CFrame.new(ammoBox.Position + Vector3.new(0, 3, 0))
        })
        tweenTo:Play()
        tweenTo.Completed:Wait()
        task.wait(0.1)

        local tweenBack = TweenService:Create(root, TweenInfo.new(0.15, Enum.EasingStyle.Linear), {
            CFrame = originalCF
        })
        tweenBack:Play()
        tweenBack.Completed:Wait()
        tweenActive = false
    end,
})

VisualsTab:Toggle({
    Flag     = "KillerEsp",
    Title    = "Killer ESP",
    Desc     = "Shows all killers in the game",
    Value    = false,
    Locked   = false,
    Callback = function(state)
        killerESPEnabled = state
        if state then enableKillerESP() else disableKillerESP() end
    end,
})

VisualsTab:Space()

VisualsTab:Toggle({
    Flag     = "DrawBoxes",
    Title    = "Drawing Boxes",
    Value    = false,
    Locked   = false,
    Callback = function(state)
        drawBoxes = state
    end,
})

VisualsTab:Toggle({
    Flag     = "DrawLines",
    Title    = "Drawing Lines",
    Value    = false,
    Locked   = false,
    Callback = function(state)
        drawLines = state
    end,
})

VisualsTab:Toggle({
    Flag     = "DrawOverride",
    Title    = "Drawing Override",
    Value    = false,
    Locked   = false,
    Callback = function(state)
        drawOverride = state
        if killerESPEnabled then refreshKillerESP() end
    end,
})

VisualsTab:Dropdown({
    Flag     = "DrawStyle",
    Title    = "Box Style",
    Values   = {"2D", "3D"},
    Value    = "2D",
    Callback = function(value)
        drawStyle = value
    end,
})

VisualsTab:Space()

VisualsTab:Colorpicker({
    Title    = "Box & Line Color",
    Default  = Color3.fromRGB(255, 50, 50),
    Transparency = 0,
    Locked   = false,
    Callback = function(color)
        killerBoxColor = color
        for _, data in pairs(killerDrawings) do
            for _, l in ipairs(data.corners) do l.Color = color end
            data.line.Color = color
        end
        for _, data in pairs(killerBillboards) do
            local frame = data.billboard:FindFirstChild("MainFrame")
            if frame then
                local stroke = frame:FindFirstChildOfClass("UIStroke")
                if stroke then stroke.Color = color end
            end
        end
    end,
})

VisualsTab:Colorpicker({
    Title    = "Name Color",
    Default  = Color3.fromRGB(255, 80, 80),
    Transparency = 0,
    Locked   = false,
    Callback = function(color)
        killerNameColor = color
        for _, data in pairs(killerDrawings) do
            data.nameText.Color = color
        end
        for _, data in pairs(killerBillboards) do
            local frame = data.billboard:FindFirstChild("MainFrame")
            if frame then
                local label = frame:FindFirstChildWhichIsA("TextLabel")
                if label then label.TextColor3 = color end
            end
        end
    end,
})


VisualsTab:Space()

VisualsTab:Toggle({
    Flag     = "PlayerEsp",
    Title    = "Player ESP",
    Desc     = "Shows all players in the game",
    Value    = false,
    Locked   = false,
    Callback = function(state)
        playerESPEnabled = state
        if state then enablePlayerESP() else disablePlayerESP() end
    end,
})

VisualsTab:Toggle({
    Flag     = "PlayerDrawBoxes",
    Title    = "Player Drawing Boxes",
    Value    = false,
    Locked   = false,
    Callback = function(state)
        playerDrawBoxes = state
    end,
})

VisualsTab:Toggle({
    Flag     = "PlayerDrawLines",
    Title    = "Player Drawing Lines",
    Value    = false,
    Locked   = false,
    Callback = function(state)
        playerDrawLines = state
    end,
})

VisualsTab:Toggle({
    Flag     = "PlayerDrawOverride",
    Title    = "Player Drawing Override",
    Value    = false,
    Locked   = false,
    Callback = function(state)
        playerDrawOverride = state
        if playerESPEnabled then refreshPlayerESP() end
    end,
})

VisualsTab:Dropdown({
    Flag     = "PlayerDrawStyle",
    Title    = "Player Box Style",
    Values   = {"2D", "3D"},
    Value    = "2D",
    Callback = function(value)
        playerDrawStyle = value
    end,
})

VisualsTab:Space()

VisualsTab:Colorpicker({
    Title    = "Player Box & Line Color",
    Default  = Color3.fromRGB(50, 150, 255),
    Transparency = 0,
    Locked   = false,
    Callback = function(color)
        playerBoxColor = color
        for _, data in pairs(playerDrawings) do
            for _, l in ipairs(data.corners) do l.Color = color end
            data.line.Color = color
        end
        for _, data in pairs(playerBillboards) do
            local frame = data.billboard:FindFirstChild("MainFrame")
            if frame then
                local stroke = frame:FindFirstChildOfClass("UIStroke")
                if stroke then stroke.Color = color end
            end
        end
    end,
})

VisualsTab:Colorpicker({
    Title    = "Player Name Color",
    Default  = Color3.fromRGB(80, 180, 255),
    Transparency = 0,
    Locked   = false,
    Callback = function(color)
        playerNameColor = color
        for _, data in pairs(playerDrawings) do
            data.nameText.Color = color
        end
        for _, data in pairs(playerBillboards) do
            local frame = data.billboard:FindFirstChild("MainFrame")
            if frame then
                local label = frame:FindFirstChildWhichIsA("TextLabel")
                if label then label.TextColor3 = color end
            end
        end
    end,
})

VisualsTab:Space()

VisualsTab:Toggle({
    Flag     = "MysteryBoxESP",
    Title    = "Mystery Box ESP",
    Desc     = "shows box location + chosen weapon",
    Value    = false,
    Locked   = false,
    Callback = function(state)
        mysteryBoxESPEnabled = state
        if state then enableMysteryBoxESP() else disableMysteryBoxESP() end
    end,
})

VisualsTab:Toggle({
    Flag     = "PackAPunchESP",
    Title    = "Pack-A-Punch ESP",
    Desc     = "shows PAP location",
    Value    = false,
    Locked   = false,
    Callback = function(state)
        papESPEnabled = state
        if state then enablePAPESP() else disablePAPESP() end
    end,
})

HitboxTab:Toggle({
    Title    = "Hitbox Expander",
    Desc     = "Expands killer hitbox. May cause killer to glitch into ground or appear dead client-side",
    Value    = false,
    Locked   = false,
    Callback = function(state)
        hitboxEnabled = state
        if state then enableHitboxes() else disableHitboxes() end
    end,
})

HitboxTab:Slider({
    Flag  = "HitboxSize",
    Title = "Hitbox Size",
    Step  = 1,
    Value = {
        Min     = 5,
        Max     = 15,
        Default = 10,
    },
    Callback = function(value)
        hitboxSize = value
        if hitboxEnabled then
            for _, model in ipairs(KillersFolder:GetChildren()) do
                local hrp = model:FindFirstChild("HumanoidRootPart")
                if hrp then applyHRP(hrp) end
            end
        end
    end,
})

HitboxTab:Slider({
    Flag  = "HitboxTransparency",
    Title = "Hitbox Transparency",
    Step  = 0.05,
    Value = {
        Min     = 0,
        Max     = 1,
        Default = 0.7,
    },
    Callback = function(value)
        hitboxTransparency = value
        if hitboxEnabled then
            for _, model in ipairs(KillersFolder:GetChildren()) do
                local hrp = model:FindFirstChild("HumanoidRootPart")
                if hrp then hrp.Transparency = hitboxTransparency end
            end
        end
    end,
})

HitboxTab:Colorpicker({
    Title    = "Hitbox Color",
    Default  = Color3.fromRGB(255, 50, 50),
    Transparency = 0,
    Locked   = false,
    Callback = function(color)
        hitboxColor = color
        if hitboxEnabled then
            for _, model in ipairs(KillersFolder:GetChildren()) do
                local hrp = model:FindFirstChild("HumanoidRootPart")
                if hrp then hrp.Color = hitboxColor end
            end
        end
    end,
})

local materialMap = {
    ["Neon"]          = Enum.Material.Neon,
    ["ForceField"]    = Enum.Material.ForceField,
    ["SmoothPlastic"] = Enum.Material.SmoothPlastic,
}

HitboxTab:Dropdown({
    Flag     = "HitboxMaterial",
    Title    = "Hitbox Material",
    Values   = {"Neon", "ForceField", "SmoothPlastic"},
    Value    = "ForceField",
    Callback = function(value)
        hitboxMaterial = materialMap[value] or Enum.Material.ForceField
        if hitboxEnabled then
            for _, model in ipairs(KillersFolder:GetChildren()) do
                local hrp = model:FindFirstChild("HumanoidRootPart")
                if hrp then hrp.Material = hitboxMaterial end
            end
        end
    end,
})

HitboxTab:Toggle({
    Flag     = "NoCollide",
    Title    = "No Collide",
    Value    = false,
    Locked   = false,
    Callback = function(state)
        noCollideEnabled = state
        if not state then
            for _, model in ipairs(KillersFolder:GetChildren()) do
                local hrp = model:FindFirstChild("HumanoidRootPart")
                if hrp then
                    local orig = originalHRP[hrp]
                    hrp.CanCollide = orig and orig.CanCollide or true
                end
            end
        end
    end,
})

local EndlessSurvivalTab = ElementsSection:Tab({
    Title  = "Endless Survival",
    Icon   = "shield",
    Locked = false,
})

local autoRepairEnabled = false
local autoRepairThread = nil

local repairPartCache = nil
local repairPartCacheTime = 0

local function getRepairParts()
    local now = tick()
    if repairPartCache and (now - repairPartCacheTime) < 10 then
        return repairPartCache
    end
    local area = workspace:FindFirstChild("AREA51")
    if not area then return {} end
    local parts = {}
    for _, desc in ipairs(area:GetDescendants()) do
        if desc:IsA("BasePart") and desc.Name == "RepairPart" then
            local prompt = desc:FindFirstChildOfClass("ProximityPrompt")
            if prompt then
                table.insert(parts, { part = desc, prompt = prompt })
            end
        end
    end
    repairPartCache = parts
    repairPartCacheTime = now
    return parts
end

local function getNearestRepairPart()
    local char = Players.LocalPlayer.Character
    if not char then return nil end
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then return nil end
    local parts = getRepairParts()
    local nearest = nil
    local nearestDist = math.huge
    for _, data in ipairs(parts) do
        if data.part and data.part.Parent and data.prompt and data.prompt.Parent then
            local dist = (root.Position - data.part.Position).Magnitude
            if dist < nearestDist then
                nearestDist = dist
                nearest = data
            end
        end
    end
    return nearest
end

EndlessSurvivalTab:Button({
    Title    = "Give All Perks",
    Desc     = "gives every perks (FOR ENDLESS SURVIVAL)",
    Locked   = false,
    Callback = function()
        local perksFolder = Players.LocalPlayer:WaitForChild("Perks", 5)
        if not perksFolder then
            WindUI:Notify({ Title = "Perks", Content = "Perks folder not found", Icon = "x" })
            return
        end
        for _, perk in ipairs(perksFolder:GetChildren()) do
            pcall(function()
                perk.Value = true
            end)
        end
        WindUI:Notify({ Title = "Perks", Content = "All perks given", Icon = "check" })
    end,
})

EndlessSurvivalTab:Space()

task.spawn(function()
    local perksFolder = Players.LocalPlayer:WaitForChild("Perks", 10)
    if not perksFolder then return end
    for _, perk in ipairs(perksFolder:GetChildren()) do
        local perkName = perk.Name
        EndlessSurvivalTab:Button({
            Title    = "Give " .. perkName,
            Desc     = "Give " .. perkName .. " to you",
            Locked   = false,
            Callback = function()
                pcall(function()
                    perk.Value = true
                end)
                WindUI:Notify({ Title = "Perk", Content = perkName .. " given", Icon = "check" })
            end,
        })
    end
end)

EndlessSurvivalTab:Space()

EndlessSurvivalTab:Button({
    Title    = "Kill All Killers",
    Desc     = "kill killers in game",
    Locked   = false,
    Callback = function()
        for _, model in ipairs(KillersFolder:GetChildren()) do
            local hum = model:FindFirstChildOfClass("Humanoid")
            if hum then
                hum.Health = 0
            end
        end
    end,
})

EndlessSurvivalTab:Space()

local loopKillEnabled = false
local loopKillThread = nil

EndlessSurvivalTab:Toggle({
    Flag     = "LoopKillKillers",
    Title    = "Loop Kill Killers",
    Desc     = "loop kills killers",
    Value    = false,
    Locked   = false,
    Callback = function(state)
        loopKillEnabled = state
        if loopKillThread then
            task.cancel(loopKillThread)
            loopKillThread = nil
        end
        if not state then return end
        loopKillThread = task.spawn(function()
            while loopKillEnabled do
                for _, model in ipairs(KillersFolder:GetChildren()) do
                    local hum = model:FindFirstChildOfClass("Humanoid")
                    if hum then
                        hum.Health = 0
                    end
                end
                task.wait(0.1)
            end
        end)
    end,
})

EndlessSurvivalTab:Space()

EndlessSurvivalTab:Toggle({
    Flag     = "AutoRepairBarriers",
    Title    = "Auto Repair Barriers",
    Desc     = "fires repair prompts",
    Value    = false,
    Locked   = false,
    Callback = function(state)
        autoRepairEnabled = state
        if autoRepairThread then
            task.cancel(autoRepairThread)
            autoRepairThread = nil
        end
        if not state then return end
        autoRepairThread = task.spawn(function()
            while autoRepairEnabled do
                local nearest = getNearestRepairPart()
                if nearest then
                    pcall(fireproximityprompt, nearest.prompt)
                end
                task.wait(1)
            end
        end)
    end,
})

local ConfigTab = ConfigSection:Tab({
    Title  = "Cfgs",
    Icon   = "folder",
    Border = true,
})

local ConfigManager = Window.ConfigManager
local ConfigName = "default"

local ConfigNameInput = ConfigTab:Input({
    Title    = "Config Name",
    Icon     = "file-cog",
    Callback = function(value)
        ConfigName = value
    end,
})

ConfigTab:Space()

local AllConfigs = ConfigManager:AllConfigs()
local DefaultValue = table.find(AllConfigs, ConfigName) and ConfigName or nil

local AllConfigsDropdown = ConfigTab:Dropdown({
    Title    = "All Configs",
    Desc     = "Select existing configs",
    Values   = AllConfigs,
    Value    = DefaultValue,
    Callback = function(value)
        ConfigName = value
        ConfigNameInput:Set(value)
    end,
})

ConfigTab:Space()

ConfigTab:Button({
    Title    = "Save Config",
    Icon     = "",
    Justify  = "Center",
    Callback = function()
        Window.CurrentConfig = ConfigManager:Config(ConfigName)
        if Window.CurrentConfig:Save() then
            WindUI:Notify({ Title = "Config Saved", Content = "Config '" .. ConfigName .. "' saved", Icon = "check" })
        end
        AllConfigsDropdown:Refresh(ConfigManager:AllConfigs())
    end,
})

ConfigTab:Space()

ConfigTab:Button({
    Title    = "Load Config",
    Icon     = "",
    Justify  = "Center",
    Callback = function()
        Window.CurrentConfig = ConfigManager:Config(ConfigName)
        if Window.CurrentConfig:Load() then
            WindUI:Notify({ Title = "Config Loaded", Content = "Config '" .. ConfigName .. "' loaded", Icon = "refresh-cw" })
        end
    end,
})

ConfigTab:Space()

ConfigTab:Toggle({
    Flag     = "AutoloadToggle",
    Title    = "Autoload This Config",
    Value    = false,
    Callback = function(state)
        Window.CurrentConfig = ConfigManager:Config(ConfigName)
        Window.CurrentConfig:SetAutoLoad(state)
        WindUI:Notify({
            Title   = "Autoload",
            Content = state and "Autoload enabled for '" .. ConfigName .. "'" or "Autoload disabled for '" .. ConfigName .. "'",
            Icon    = "refresh-cw",
        })
    end,
})

ConfigTab:Space()

ConfigTab:Button({
    Title    = "Clear Autoload",
    Icon     = "",
    Justify  = "Center",
    Callback = function()
        Window.CurrentConfig = ConfigManager:Config(ConfigName)
        Window.CurrentConfig:SetAutoLoad(false)
        WindUI:Notify({ Title = "Autoload Cleared", Content = "Autoload cleared for '" .. ConfigName .. "'", Icon = "x" })
    end,
})

do
    local autoConfigs = ConfigManager:GetAutoLoadConfigs()
    if autoConfigs then
        for _, name in ipairs(autoConfigs) do
            local cfg = ConfigManager:Config(name)
            if cfg then cfg:Load() end
        end
    end
end

local function vip()
    if premium then
        print("You are premium")
    else
        print("You are not premium")
    end
end

vip()
