local plr = game.Players.LocalPlayer
local pgui = plr:WaitForChild("PlayerGui")
if pgui:FindFirstChild("SafeMenu") then pgui.SafeMenu:Destroy() end

_G.ChamsActive = false
_G.ChamsColor = Color3.fromRGB(0, 255, 255)

local sg = Instance.new("ScreenGui", pgui)
sg.Name = "SafeMenu"
sg.ResetOnSpawn = false

local frame = Instance.new("Frame", sg)
frame.Size = UDim2.new(0, 220, 0, 160)
frame.Position = UDim2.new(0.1, 0, 0.1, 0)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.Active = true
frame.Draggable = true

local corner = Instance.new("UICorner", frame)
corner.CornerRadius = UDim.new(0, 8)

local grad = Instance.new("UIGradient", frame)
grad.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 40, 45)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 15, 20))
}
grad.Rotation = 45

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(0, 110, 0, 30)
title.Position = UDim2.new(0, 10, 0, 5)
title.Text = "SIMPLE CHAMS"
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.BackgroundTransparency = 1
title.TextSize = 14

local credits = Instance.new("TextLabel", frame)
credits.Size = UDim2.new(0, 100, 0, 30)
credits.Position = UDim2.new(0, 115, 0, 5)
credits.Text = "Made by gabriukas"
credits.TextColor3 = Color3.fromRGB(150, 150, 150)
credits.Font = Enum.Font.Gotham
credits.TextXAlignment = Enum.TextXAlignment.Right
credits.BackgroundTransparency = 1
credits.TextSize = 12

local btn = Instance.new("TextButton", frame)
btn.Size = UDim2.new(0, 200, 0, 40)
btn.Position = UDim2.new(0, 10, 0, 45)
btn.Text = "STATUS: DISABLED"
btn.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
btn.TextColor3 = Color3.new(1, 1, 1)
btn.Font = Enum.Font.GothamSemibold
Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)

local colorBtn = Instance.new("TextButton", frame)
colorBtn.Size = UDim2.new(0, 200, 0, 40)
colorBtn.Position = UDim2.new(0, 10, 0, 95)
colorBtn.Text = "RANDOM COLOR"
colorBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
colorBtn.TextColor3 = _G.ChamsColor
colorBtn.Font = Enum.Font.GothamSemibold
Instance.new("UICorner", colorBtn).CornerRadius = UDim.new(0, 6)

local function update()
    for _, p in pairs(game.Players:GetPlayers()) do
        if p ~= plr and p.Character then
            for _, part in pairs(p.Character:GetChildren()) do
                if part:IsA("BasePart") then
                    local b = part:FindFirstChild("quinnupod") or Instance.new("BoxHandleAdornment", part)
                    b.Name = "quinnupod"
                    b.Adornee = part
                    b.AlwaysOnTop = true
                    b.ZIndex = 10
                    b.Size = part.Size + Vector3.new(0.05, 0.05, 0.05)
                    b.Color3 = _G.ChamsColor
                    b.Transparency = 0.5
                    b.Visible = _G.ChamsActive
                end
            end
        end
    end
end

btn.MouseButton1Click:Connect(function()
    _G.ChamsActive = not _G.ChamsActive
    btn.Text = _G.ChamsActive and "STATUS: ENABLED" or "STATUS: DISABLED"
    btn.TextColor3 = _G.ChamsActive and Color3.fromRGB(0, 255, 150) or Color3.new(1, 1, 1)
    update()
end)

colorBtn.MouseButton1Click:Connect(function()
    _G.ChamsColor = Color3.new(math.random(), math.random(), math.random())
    colorBtn.TextColor3 = _G.ChamsColor
    update()
end)

task.spawn(function()
    while task.wait(2) do
        if _G.ChamsActive then update() end
    end
end)
