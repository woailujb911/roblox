-- 获取服务
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local StarterGui = game:GetService("StarterGui")

-- 加载 OrionLib
local OrionLib
local success, err = pcall(function()
    OrionLib = loadstring(game:HttpGet("https://pastebin.com/raw/FUEx0f3G"))()
end)
if not success or not OrionLib then
    warn("Orion库加载失败: " .. (err or "未知错误"))
    return
end

-- 圆角函数
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

-- 作者信息
local AuthorTab = Window:MakeTab({Name = "作者信息", Icon = "rbxassetid://4483345998"})
AuthorTab:AddParagraph("作者", "卡卡大帝")
AuthorTab:AddParagraph("作者QQ", "3804046925")
AuthorTab:AddParagraph("QQ群", "1054175537")

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

-- 玩家功能
local PlayerTab = Window:MakeTab({
    Name = "玩家功能",
    Icon = "rbxassetid://3804046925",
    PremiumOnly = false
})

PlayerTab:AddSlider({
    Name = "速度",
    Min = 16,
    Max = 200,
    Default = 16,
    Increment = 1,
    Callback = function(Value)
        Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
    end
})

PlayerTab:AddSlider({
    Name = "跳跃高度",
    Min = 50,
    Max = 200,
    Default = 50,
    Increment = 1,
    Callback = function(Value)
        Players.LocalPlayer.Character.Humanoid.JumpPower = Value
    end
})

PlayerTab:AddTextbox({
    Name = "跳跃高度设置",
    TextDisappear = true,
    Callback = function(Value)
        local num = tonumber(Value)
        if num then
            Players.LocalPlayer.Character.Humanoid.JumpPower = num
        end
    end
})

PlayerTab:AddTextbox({
    Name = "移动速度设置",
    TextDisappear = true,
    Callback = function(Value)
        local num = tonumber(Value)
        if num then
            Players.LocalPlayer.Character.Humanoid.WalkSpeed = num
        end
    end
})

PlayerTab:AddTextbox({
    Name = "重力设置",
    TextDisappear = true,
    Callback = function(Value)
        local num = tonumber(Value)
        if num then
            workspace.Gravity = num
        end
    end
})

PlayerTab:AddToggle({
    Name = "夜视",
    Default = false,
    Callback = function(Value)
        Lighting.Ambient = Value and Color3.new(1,1,1) or Color3.new(0,0,0)
    end
})

PlayerTab:AddToggle({
    Name = "飞行",
    Default = false,
    Callback = function(Value)
        if Value then
            local ok, err = pcall(function()
                loadstring(game:HttpGet("https://pastebin.com/raw/gqv7PXAa"))()
            end)
            if not ok then warn("飞行功能脚本加载失败: "..err) end
        end
    end
})

PlayerTab:AddToggle({
    Name = "旋转",
    Default = false,
    Callback = function(Value)
        if Value then
            local ok, err = pcall(function()
                loadstring(game:HttpGet("https://xn--9p9haaaaaa.tk/scripts/CarpetFling.lua"))()
            end)
            if not ok then warn("旋转功能脚本加载失败: "..err) end
        end
    end
})

PlayerTab:AddToggle({
    Name = "踏空",
    Default = false,
    Callback = function(Value)
        if Value then
            local ok, err = pcall(function()
                loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Float'))()
            end)
            if not ok then warn("踏空功能脚本加载失败: "..err) end
        end
    end
})

PlayerTab:AddButton({
    Name = "修改玩家碰撞箱",
    Callback = function()
        loadstring(game:HttpGet('https://pastebin.com/raw/JYFXjEVh'))()
    end
})

PlayerTab:AddButton({
    Name = "皮自瞄",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaopi77/xiaopi77/main/3683e49998644fb7.txt_2024-08-09_094310.OTed.lua"))()
    end
})

PlayerTab:AddButton({
    Name = "最强透视",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/uw2P2fbY"))()
    end
})

-- 墨水游戏
local InkGameTab = Window:MakeTab({
    Name = "墨水游戏",
    Icon = "rbxassetid://4483345998"
})

InkGameTab:AddToggle({
    Name = "飞行",
    Default = false,
    Callback = function(Value)
        if Value then
            local ok, err = pcall(function()
                loadstring(game:HttpGet("https://pastebin.com/raw/gqv7PXAa"))()
            end)
            if not ok then warn("墨水飞行脚本加载失败: "..err) end
        end
    end
})

InkGameTab:AddToggle({
    Name = "旋转",
    Default = false,
    Callback = function(Value)
        if Value then
            local ok, err = pcall(function()
                loadstring(game:HttpGet("https://xn--9p9haaaaaa.tk/scripts/CarpetFling.lua"))()
            end)
            if not ok then warn("墨水旋转脚本加载失败: "..err) end
        end
    end
})

InkGameTab:AddButton({
    Name = "脚本一",
    Callback = function()
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/XOTRXONY/INKGAME/main/INKGAMEE.lua", true))()
        end)
        if not success then
            warn("墨水游戏脚本一加载失败: ".. (err or "未知错误"))
        end
    end
})

-- 一路向西
local WestboundTab = Window:MakeTab({
    Name = "一路向西",
    Icon = "rbxassetid://4483345998"
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

-- 死铁轨
local DeadRailTab = Window:MakeTab({
    Name = "死铁轨",
    Icon = "rbxassetid://4483345998"
})

DeadRailTab:AddButton({
    Name = "刷券",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ArdyBotzz/NatHub/refs/heads/master/NatHub.lua"))()
    end
})

-- 设置页 - 关闭按钮
local SettingsTab = Window:MakeTab({
    Name = "设置",
    Icon = "rbxassetid://7734068321"
})

SettingsTab:AddButton({
    Name = "关闭脚本",
    Callback = function()
        cleanUp()
    end
})

-- 初始化界面
OrionLib:Init()

-- 圆角样式优化（可选）
task.delay(0.3, function()
    local ui = game:GetService("CoreGui"):FindFirstChild("Orion")
    if ui then
        local mainFrame = ui:FindFirstChild("MainFrame", true)
        if mainFrame then
            makeRound(mainFrame, UDim.new(0.08, 0))
        end
    end
end)

-- 清理函数
function cleanUp()
    local ui = game:GetService("CoreGui"):FindFirstChild("Orion")
    if ui then ui:Destroy() end
    Lighting.Ambient = Color3.new(0, 0, 0)
    Lighting.Brightness = 1
end
