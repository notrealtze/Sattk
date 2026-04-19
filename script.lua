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
    hrp.CanCollide = false
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

local function enableHitboxes()
    applyHitboxes()
    hitboxConnection = KillersFolder.ChildAdded:Connect(function(child)
        task.defer(function()
            if not hitboxEnabled then return end
            local hrp = child:FindFirstChild("HumanoidRootPart")
            if hrp then applyHRP(hrp) end
        end)
    end)
end

local function disableHitboxes()
    restoreHitboxes()
    if hitboxConnection then
        hitboxConnection:Disconnect()
        hitboxConnection = nil
    end
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
    billboard.StudsOffsetWorldSpace = Vector3.new(0, 2.5, 0)
    billboard.Size = UDim2.fromOffset(90, 44)
    billboard.ResetOnSpawn = false
    billboard.ClipsDescendants = false
    billboard.Parent = killerESPFolder

    local mainFrame = Instance.new("Frame", billboard)
    mainFrame.BorderSizePixel = 0
    mainFrame.BackgroundColor3 = Color3.fromRGB(20, 0, 0)
    mainFrame.BackgroundTransparency = 0.4
    mainFrame.Size = UDim2.fromScale(1, 1)
    mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    mainFrame.Position = UDim2.fromScale(0.5, 0.5)

    local corner = Instance.new("UICorner", mainFrame)
    corner.CornerRadius = UDim.new(0.15, 0)

    local stroke = Instance.new("UIStroke", mainFrame)
    stroke.Color = Color3.fromRGB(220, 0, 0)
    stroke.Thickness = 1.5

    local strokeGrad = Instance.new("UIGradient", stroke)
    strokeGrad.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 60, 60)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(180, 0, 0)),
    }

    local nameLabel = Instance.new("TextLabel", mainFrame)
    nameLabel.TextWrapped = true
    nameLabel.BorderSizePixel = 0
    nameLabel.TextScaled = true
    nameLabel.BackgroundTransparency = 1
    nameLabel.FontFace = Font.new("rbxasset://fonts/families/Code.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    nameLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
    nameLabel.AnchorPoint = Vector2.new(0.5, 0)
    nameLabel.Size = UDim2.fromScale(0.9, 0.45)
    nameLabel.Position = UDim2.fromScale(0.5, 0.02)
    nameLabel.Text = model.Name

    local nameStroke = Instance.new("UIStroke", nameLabel)
    nameStroke.Color = Color3.fromRGB(0, 0, 0)
    nameStroke.Thickness = 1.5

    local hpLabel = Instance.new("TextLabel", mainFrame)
    hpLabel.Name = "HPLabel"
    hpLabel.TextWrapped = true
    hpLabel.BorderSizePixel = 0
    hpLabel.TextScaled = true
    hpLabel.BackgroundTransparency = 1
    hpLabel.FontFace = Font.new("rbxasset://fonts/families/Code.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    hpLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    hpLabel.AnchorPoint = Vector2.new(0.5, 0)
    hpLabel.Size = UDim2.fromScale(0.9, 0.35)
    hpLabel.Position = UDim2.fromScale(0.5, 0.52)
    hpLabel.Text = "HP: ?"

    local hpStroke = Instance.new("UIStroke", hpLabel)
    hpStroke.Color = Color3.fromRGB(0, 0, 0)
    hpStroke.Thickness = 1.5

    local distLabel = Instance.new("TextLabel", mainFrame)
    distLabel.Name = "DistLabel"
    distLabel.TextWrapped = true
    distLabel.BorderSizePixel = 0
    distLabel.TextScaled = true
    distLabel.BackgroundTransparency = 1
    distLabel.FontFace = Font.new("rbxasset://fonts/families/Code.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    distLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    distLabel.AnchorPoint = Vector2.new(0.5, 0.5)
    distLabel.Size = UDim2.fromScale(0.9, 0.3)
    distLabel.Position = UDim2.fromScale(0.5, 1.4)
    distLabel.Text = "0M"
    distLabel.ZIndex = 10

    local distStroke = Instance.new("UIStroke", distLabel)
    distStroke.Color = Color3.fromRGB(0, 0, 0)
    distStroke.Thickness = 2

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
            local ratio = math.clamp(hp / math.max(maxHp, 1), 0, 1)
            hpLabel.TextColor3 = Color3.fromRGB(255, math.floor(ratio * 255), math.floor(ratio * 255))
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
            for _, l in ipairs(data.corners) do l.Visible = false end
            data.line.Visible = false
            data.nameText.Visible = false
            data.hpText.Visible = false
            data.distText.Visible = false
            continue
        end

        local rootPos = primaryPart.Position
        local sp, spOnScreen = camera:WorldToViewportPoint(rootPos)
        local onScreen = spOnScreen and sp.Z > 0 and sp.X > 0 and sp.X < screenSize.X and sp.Y > 0 and sp.Y < screenSize.Y
        local screenPos = Vector2.new(sp.X, sp.Y)

        if not onScreen then
            for _, l in ipairs(data.corners) do l.Visible = false end
            data.line.Visible = false
            data.nameText.Visible = false
            data.hpText.Visible = false
            data.distText.Visible = false
            continue
        end

        if myRoot then
            data.distText.Text = math.floor((myRoot.Position - rootPos).Magnitude) .. "m"
        end

        local humanoid = data.humanoid
        if humanoid and humanoid.Health then
            local hp = math.floor(humanoid.Health)
            local maxHp = math.floor(humanoid.MaxHealth)
            local ratio = math.clamp(hp / math.max(maxHp, 1), 0, 1)
            data.hpText.Text = "HP " .. hp .. "/" .. maxHp
            data.hpText.Color = Color3.fromRGB(
                math.floor((1 - ratio) * 255),
                math.floor(ratio * 220),
                80
            )
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
                for i, p in ipairs(pts) do
                    data.corners[i].From    = p[1]
                    data.corners[i].To      = p[2]
                    data.corners[i].Color   = boxColor
                    data.corners[i].Visible = true
                end
                for i = 9, 12 do data.corners[i].Visible = false end

                data.nameText.Position = Vector2.new(screenPos.X, by - 17)
                data.hpText.Position   = Vector2.new(screenPos.X, y2 + 2)
                data.distText.Position = Vector2.new(screenPos.X, y2 + 17)
            end
        else
            for _, l in ipairs(data.corners) do l.Visible = false end
            data.nameText.Position = Vector2.new(screenPos.X, screenPos.Y - 30)
            data.hpText.Position   = Vector2.new(screenPos.X, screenPos.Y - 16)
            data.distText.Position = Vector2.new(screenPos.X, screenPos.Y - 1)
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

    local corners = {}
    for i = 1, 12 do
        local l = Drawing.new("Line")
        l.Visible   = false
        l.Color     = killerBoxColor
        l.Thickness = 1.8
        corners[i]  = l
    end

    local line = Drawing.new("Line")
    line.Visible   = false
    line.Color     = killerBoxColor
    line.Thickness = 1.2

    local nameText = Drawing.new("Text")
    nameText.Visible       = false
    nameText.Color         = killerNameColor
    nameText.Size          = 13
    nameText.Font          = Drawing.Fonts.Monospace
    nameText.Outline       = true
    nameText.OutlineColor  = Color3.fromRGB(0, 0, 0)
    nameText.Text          = model.Name
    nameText.Center        = true

    local hpText = Drawing.new("Text")
    hpText.Visible      = false
    hpText.Color        = Color3.fromRGB(80, 255, 120)
    hpText.Size         = 12
    hpText.Font         = Drawing.Fonts.Monospace
    hpText.Outline      = true
    hpText.OutlineColor = Color3.fromRGB(0, 0, 0)
    hpText.Text         = "HP: ?"
    hpText.Center       = true

    local distText = Drawing.new("Text")
    distText.Visible      = false
    distText.Color        = Color3.fromRGB(200, 200, 200)
    distText.Size         = 11
    distText.Font         = Drawing.Fonts.Monospace
    distText.Outline      = true
    distText.OutlineColor = Color3.fromRGB(0, 0, 0)
    distText.Center       = true

    killerDrawings[model] = {
        model       = model,
        primaryPart = primaryPart,
        humanoid    = model:FindFirstChildOfClass("Humanoid"),
        corners     = corners,
        line        = line,
        nameText    = nameText,
        hpText      = hpText,
        distText    = distText,
    }

    startDrawRender()
end

local function removeKillerDrawings(model)
    local data = killerDrawings[model]
    if data then
        for _, l in ipairs(data.corners) do l:Remove() end
        data.line:Remove()
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
    billboard.StudsOffsetWorldSpace = Vector3.new(0, 2.5, 0)
    billboard.Size = UDim2.fromOffset(90, 44)
    billboard.ResetOnSpawn = false
    billboard.ClipsDescendants = false
    billboard.Parent = playerESPFolder

    local mainFrame = Instance.new("Frame", billboard)
    mainFrame.BorderSizePixel = 0
    mainFrame.BackgroundColor3 = Color3.fromRGB(0, 20, 40)
    mainFrame.BackgroundTransparency = 0.4
    mainFrame.Size = UDim2.fromScale(1, 1)
    mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    mainFrame.Position = UDim2.fromScale(0.5, 0.5)

    local corner = Instance.new("UICorner", mainFrame)
    corner.CornerRadius = UDim.new(0.15, 0)

    local stroke = Instance.new("UIStroke", mainFrame)
    stroke.Color = Color3.fromRGB(50, 150, 255)
    stroke.Thickness = 1.5

    local strokeGrad = Instance.new("UIGradient", stroke)
    strokeGrad.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(80, 180, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 80, 200)),
    }

    local nameLabel = Instance.new("TextLabel", mainFrame)
    nameLabel.TextWrapped = true
    nameLabel.BorderSizePixel = 0
    nameLabel.TextScaled = true
    nameLabel.BackgroundTransparency = 1
    nameLabel.FontFace = Font.new("rbxasset://fonts/families/Code.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    nameLabel.TextColor3 = Color3.fromRGB(80, 180, 255)
    nameLabel.AnchorPoint = Vector2.new(0.5, 0)
    nameLabel.Size = UDim2.fromScale(0.9, 0.45)
    nameLabel.Position = UDim2.fromScale(0.5, 0.02)
    nameLabel.Text = model.Name

    local nameStroke = Instance.new("UIStroke", nameLabel)
    nameStroke.Color = Color3.fromRGB(0, 0, 0)
    nameStroke.Thickness = 1.5

    local hpLabel = Instance.new("TextLabel", mainFrame)
    hpLabel.Name = "HPLabel"
    hpLabel.TextWrapped = true
    hpLabel.BorderSizePixel = 0
    hpLabel.TextScaled = true
    hpLabel.BackgroundTransparency = 1
    hpLabel.FontFace = Font.new("rbxasset://fonts/families/Code.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    hpLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    hpLabel.AnchorPoint = Vector2.new(0.5, 0)
    hpLabel.Size = UDim2.fromScale(0.9, 0.35)
    hpLabel.Position = UDim2.fromScale(0.5, 0.52)
    hpLabel.Text = "HP: ?"

    local hpStroke = Instance.new("UIStroke", hpLabel)
    hpStroke.Color = Color3.fromRGB(0, 0, 0)
    hpStroke.Thickness = 1.5

    local distLabel = Instance.new("TextLabel", mainFrame)
    distLabel.Name = "DistLabel"
    distLabel.TextWrapped = true
    distLabel.BorderSizePixel = 0
    distLabel.TextScaled = true
    distLabel.BackgroundTransparency = 1
    distLabel.FontFace = Font.new("rbxasset://fonts/families/Code.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    distLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    distLabel.AnchorPoint = Vector2.new(0.5, 0.5)
    distLabel.Size = UDim2.fromScale(0.9, 0.3)
    distLabel.Position = UDim2.fromScale(0.5, 1.4)
    distLabel.Text = "0M"
    distLabel.ZIndex = 10

    local distStroke = Instance.new("UIStroke", distLabel)
    distStroke.Color = Color3.fromRGB(0, 0, 0)
    distStroke.Thickness = 2

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
            local ratio = math.clamp(hp / math.max(maxHp, 1), 0, 1)
            hpLabel.TextColor3 = Color3.fromRGB(255, math.floor(ratio * 255), math.floor(ratio * 255))
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

    local nameText = Drawing.new("Text")
    nameText.Visible       = false
    nameText.Color         = playerNameColor
    nameText.Size          = 13
    nameText.Font          = Drawing.Fonts.Monospace
    nameText.Outline       = true
    nameText.OutlineColor  = Color3.fromRGB(0, 0, 0)
    nameText.Text          = model.Name
    nameText.Center        = true

    local hpText = Drawing.new("Text")
    hpText.Visible      = false
    hpText.Color        = Color3.fromRGB(80, 255, 120)
    hpText.Size         = 12
    hpText.Font         = Drawing.Fonts.Monospace
    hpText.Outline      = true
    hpText.OutlineColor = Color3.fromRGB(0, 0, 0)
    hpText.Text         = "HP: ?"
    hpText.Center       = true

    local distText = Drawing.new("Text")
    distText.Visible      = false
    distText.Color        = Color3.fromRGB(200, 200, 200)
    distText.Size         = 11
    distText.Font         = Drawing.Fonts.Monospace
    distText.Outline      = true
    distText.OutlineColor = Color3.fromRGB(0, 0, 0)
    distText.Center       = true

    playerDrawings[model] = {
        model       = model,
        primaryPart = primaryPart,
        humanoid    = model:FindFirstChildOfClass("Humanoid"),
        corners     = corners,
        line        = line,
        nameText    = nameText,
        hpText      = hpText,
        distText    = distText,
    }

    startDrawRender()
end

local function removePlayerDrawings(model)
    local data = playerDrawings[model]
    if data then
        for _, l in ipairs(data.corners) do l:Remove() end
        data.line:Remove()
        data.nameText:Remove()
        data.hpText:Remove()
        data.distText:Remove()
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
HitboxTab:Toggle({
    Flag     = "HitboxExpander",
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
