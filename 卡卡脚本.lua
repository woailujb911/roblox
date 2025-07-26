local OrionLib
local success, err = pcall(function()
    OrionLib = loadstring(game:HttpGet("https://pastebin.com/raw/FUEx0f3G"))()
end)
if not success or not OrionLib then
    warn("Orion库加载失败: ".. (err or "未知错误"))
    return
end

local function makeRound(obj, radius)
    if obj and obj:IsA("GuiObject") then
        local corner = Instance.new("UICorner")
        corner.CornerRadius = radius or UDim.new(0.5, 0)
        corner.Parent = obj
    end
end

-- 创建主窗口
local Window = OrionLib:MakeWindow({
    Name = "卡卡脚本",
    SaveConfig = true,
    IntroText = "卡卡脚本 - 功能加载完成",
    Theme = "FlatBlue",
    Icon = "rbxassetid://118894209472715"
})

-- 欢迎通知
pcall(function()
    StarterGui:SetCore("SendNotification", {
        Title = "卡卡脚本",
        Text = "欢迎使用，功能已就绪",
        Duration = 4,
        Icon = "rbxassetid://118894209472715"
    })
end)

-- 作者信息标签页
local AuthorTab = Window:MakeTab({Name = "作者信息", Icon = "rbxassetid://4483345998"})
AuthorTab:AddParagraph("作者", "卡卡大帝")
AuthorTab:AddParagraph("作者QQ", "3804046925")
AuthorTab:AddParagraph("QQ群", "1054175537")

-- 假设这里使用OrionLib正确的按钮添加方式
AuthorTab:AddButton({
    Name = "复制作者QQ",
    Callback = function()
        if setclipboard then
            setclipboard("3804046925")
            OrionLib:MakeNotification({Name = "成功", Content = "QQ已复制", Time = 2})
        end
    end,
    Color = Color3.fromRGB(70, 130, 255)
})

AuthorTab:AddButton({
    Name = "复制QQ群",
    Callback = function()
        if setclipboard then
            setclipboard("1054175537")
            OrionLib:MakeNotification({Name = "成功", Content = "QQ群已复制", Time = 2})
        end
    end,
    Color = Color3.fromRGB(100, 200, 100)
})

local Tab = Window:MakeTab({
    Name = "玩家功能",
    Icon = "rbxassetid://3804046925",
    PremiumOnly = false
})

Tab:AddSlider({
    Name = "速度",
    Min = 16,
    Max = 200,
    Default = 16,
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 1,
    ValueName = "数值",
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
    end
})

Tab:AddSlider({
    Name = "跳跃高度",
    Min = 50,
    Max = 200,
    Default = 50,
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 1,
    ValueName = "数值",
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
    end
})

Tab:AddTextbox({
    Name = "跳跃高度设置",
    Default = "",
    TextDisappear = true,
    Callback = function(Value)
        local num = tonumber(Value)
        if num then
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = num
        end
    end
})

Tab:AddTextbox({
    Name = "移动速度设置",
    Default = "",
    TextDisappear = true,
    Callback = function(Value)
        local num = tonumber(Value)
        if num then
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = num
        end
    end
})

Tab:AddTextbox({
    Name = "重力设置",
    Default = "",
    TextDisappear = true,
    Callback = function(Value)
        local num = tonumber(Value)
        if num then
            game.Workspace.Gravity = num
        end
    end
})

Tab:AddToggle({
    Name = "夜视",
    Default = false,
    Callback = function(Value)
        if Value then
            game.Lighting.Ambient = Color3.new(1, 1, 1)
        else
            game.Lighting.Ambient = Color3.new(0, 0, 0)
        end
    end
})

Tab:AddToggle({
    Name = "飞行",
    Default = false,
    Callback = function(Value)
        if Value then
            local success, err = pcall(function()
                loadstring(game:HttpGet("https://pastebin.com/raw/gqv7PXAa"))()
            end)
            if not success then
                warn("飞行功能脚本加载失败: ".. (err or "未知错误"))
            end
        end
    end
})

Tab:AddToggle({
    Name = "旋转",
    Default = false,
    Callback = function(Value)
        if Value then
            local success, err = pcall(function()
                loadstring(game:HttpGet("https://xn--9p9haaaaaa.tk/scripts/CarpetFling.lua"))()
            end)
            if not success then
                warn("旋转功能脚本加载失败: ".. (err or "未知错误"))
            end
        end
    end
})

Tab:AddToggle({
    Name = "踏空",
    Default = false,
    Callback = function(Value)
        if Value then
            local success, err = pcall(function()
                loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Float'))()
            end)
            if not success then
                warn("踏空功能脚本加载失败: ".. (err or "未知错误"))
            end
        end
    end
})

Tab:AddButton({	
Name = "修改玩家碰撞箱",	
Callback = function()
loadstring(game:HttpGet('https://pastebin.com/raw/JYFXjEVh'))()
    end
})

Tab:AddButton({
	Name = "皮自瞄",
	Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaopi77/xiaopi77/main/3683e49998644fb7.txt_2024-08-09_094310.OTed.lua"))()
  	end    
})

Tab:AddButton({
	Name = "最强透视",
	Callback = function()
       loadstring(game:HttpGet("https://pastebin.com/raw/uw2P2fbY"))()
  	end    
})

Tab:AddButton({
	Name = "透视",
	Callback = function()
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LP = Players.LocalPlayer
local Teams = game:GetService("Teams")

local function IsGunGame()
    return #Teams:GetTeams() >= 2
end

local function IsEnemy(plr)
    if not IsGunGame() then return false end
    if not plr.Team or not LP.Team then return false end
    return plr.Team ~= LP.Team
end

local function GetHighlightColor(plr)
    if not IsGunGame() then
        return Color3.fromRGB(255, 255, 255)
    elseif IsEnemy(plr) then
        return Color3.fromRGB(180, 0, 0)
    else
        return Color3.fromRGB(0, 150, 255)
    end
end

local function CreateHighlight(target, color)
    local h = Instance.new("Highlight")
    h.Name = "StyledHighlight"
    h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    h.FillColor = color
    h.FillTransparency = 0.75
    h.OutlineColor = color
    h.OutlineTransparency = 0.3
    h.Adornee = target
    h.Parent = target
    return h
end

local function SetupVisuals(plr)
    if not plr.Character or plr == LP then return end
    local char = plr.Character
    if char:FindFirstChild("StyledHighlight") then return end

    local color = GetHighlightColor(plr)
    CreateHighlight(char, color)
end

for _, plr in ipairs(Players:GetPlayers()) do
    if plr ~= LP then
        SetupVisuals(plr)
    end
end

Players.PlayerAdded:Connect(function(plr)
    if plr == LP then return end
    plr.CharacterAdded:Connect(function(char)
        task.wait(0.2)
        SetupVisuals(plr)
    end)
end)

LP.CharacterAdded:Connect(function(myChar)
    local h = myChar:FindFirstChild("StyledHighlight")
    if h then h:Destroy() end
end)      
    end
})

local InkGameTab = Window:MakeTab({
    Name = "墨水游戏",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

InkGameTab:AddToggle({
    Name = "飞行",
    Default = false,
    Callback = function(Value)
        if Value then
            local success, err = pcall(function()
                loadstring(game:HttpGet("https://pastebin.com/raw/gqv7PXAa"))()
            end)
            if not success then
                warn("墨水游戏飞行功能脚本加载失败: ".. (err or "未知错误"))
            end
        end
    end
})

InkGameTab:AddToggle({
    Name = "旋转",
    Default = false,
    Callback = function(Value)
        if Value then
            local success, err = pcall(function()
                loadstring(game:HttpGet("https://xn--9p9haaaaaa.tk/scripts/CarpetFling.lua"))()
            end)
            if not success then
                warn("墨水游戏旋转功能脚本加载失败: ".. (err or "未知错误"))
            end
        end
    end
})

InkGameTab:AddButton({
    Name = "脚本一",
    Callback = function()
        local success, err = pcall(function()
           loadstring(game:HttpGet("https://raw.githubusercontent.com/XOTRXONY/INKGAME/main/INKGAMEE.lua", true))()
        end)
        
})

local WestboundTab = Window:MakeTab({
    Name = "一路向西",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

WestboundTab:AddButton({
    Name = "脚本一",
    Callback = function()
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/fcsdsss/westboundscp/refs/heads/main/simpleToDoMobile.lua"))()
        end)
        if not success then
            warn("一路向西脚本一加载失败: ".. (err or "未知错误"))
        end
    end
})

local Tab = Window:MakeTab({

	Name = "死铁轨",

	Icon = "rbxassetid://4483345998",

	PremiumOnly = false

})

Tab:AddButton({

	Name = "刷券",

	Callback = function()
	   loadstring(game:HttpGet("https://raw.githubusercontent.com/ArdyBotzz/NatHub/refs/heads/master/NatHub.lua"))();

    end

})
		
local Tab = Window:MakeTab({
    Name = "力量传奇",
    Icon = "rbxassetid://7734068321",
    PremiumOnly = false
})

-- 传送函数
local function teleportTo(x, y, z)
    local player = game:GetService("Players").LocalPlayer
    local char = player.Character or player.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart")
    hrp.CFrame = CFrame.new(x, y, z)
end

-- 添加按钮
Tab:AddButton({
    Name = "主岛",
    Callback = function()
        teleportTo(1.83, 7.38, 158.22)
    end
})

Tab:AddButton({
    Name = "沙滩",
    Callback = function()
        teleportTo(-16.45, 7.38, -474.85)
    end
})

Tab:AddButton({
    Name = "冰霜健身房",
    Callback = function()
        teleportTo(-2623.02, 7.38, -409.07)
    end
})

Tab:AddButton({
    Name = "神话健身房",
    Callback = function()
        teleportTo(2250.78, 7.38, 1073.23)
    end
})

Tab:AddButton({
    Name = "永恒健身房",
    Callback = function()
        teleportTo(-6758.96, 7.38, -1284.92)
    end
})

Tab:AddButton({
    Name = "传奇健身房",
    Callback = function()
        teleportTo(4603.28, 991.56, -3897.87)
    end
})

Tab:AddButton({
    Name = "力量之王健身房",
    Callback = function()
        teleportTo(-8662.02, 17.23, -5748.78)
    end
})

Tab:AddButton({
    Name = "丛林健身房",
    Callback = function()
        teleportTo(-8685.62, 6.81, 2392.33)
    end
})

Tab:AddToggle({
    Name = "开启自动锻炼（每秒100次）",
    Default = false,
    Callback = function(Value)
        autoRep = Value
        OrionLib:MakeNotification({
            Name = "自动锻炼状态",
            Content = Value and "已开启" or "已关闭",
            Time = 2
        })
    end
})

-- 自动触发逻辑
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local muscleEvent = LocalPlayer:WaitForChild("muscleEvent")
local args = {"rep"}

local accumulated = 0
local interval = 0.01  -- 0.01秒一次

RunService.RenderStepped:Connect(function(dt)
    if autoRep then
        accumulated += dt
        while accumulated >= interval do
            accumulated -= interval
            muscleEvent:FireServer(unpack(args))
        end
    end
end)
	-- 初始化界面
OrionLib:Init()

-- 样式优化
task.delay(0.3, function()
    local mainFrame = Window.Instance:FindFirstChild("MainFrame", true)
    if mainFrame then
        makeRound(mainFrame, UDim.new(0.08, 0))
    end
end)

-- 清理函数
local function cleanUp()
    if Window and Window.Instance then
        Window.Instance:Destroy()
    end
    Lighting.Ambient = Color3.new(0, 0, 0)
    Lighting.Brightness = 1
    end
