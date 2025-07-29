local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/wsomoQaz/lua-/main/A%E4%BD%B3"))()
local Window = OrionLib:MakeWindow({
    Name = "卡卡脚本",
    SaveConfig = true,
    IntroText = "卡卡脚本 - 功能加载完成",
    Theme = "FlatBlue",
    Icon = "rbxassetid://118894209472715"
})

-- 欢迎通知
pcall(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "卡卡脚本",
        Text = "欢迎使用，功能已就绪",
        Duration = 4,
        Icon = "rbxassetid://118894209472715"
    })
end)

-- 玩家功能 Tab（原 Tab）
local Tab = Window:MakeTab({
    Name = "玩家功能",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Tab:AddTextbox({
    Name = "跳跃高度",
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
    Name = "移动速度",
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
    Name = "重力",
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
        game.Lighting.Ambient = Value and Color3.new(1, 1, 1) or Color3.new(0, 0, 0)
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
    Name = "自瞄",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/chillz-workshop/main/Arceus%20Aimbot.lua"))()
    end
})

Tab:AddButton({
    Name = "旋转速度",
    Placeholder = "输入旋转速度值",
    Callback = function(Value)
        local speed = tonumber(Value)
        if not speed then
            return OrionLib:MakeNotification({
                Name = "错误",
                Content = "请输入有效的数字",
                Time = 2
            })
        end
        
        local plr = game:GetService("Players").LocalPlayer
        repeat task.wait() until plr.Character
        local humRoot = plr.Character:WaitForChild("HumanoidRootPart")
        local humanoid = plr.Character:WaitForChild("Humanoid")
        humanoid.AutoRotate = false

        if not spinVelocity then
            spinVelocity = Instance.new("AngularVelocity")
            spinVelocity.Attachment0 = humRoot:WaitForChild("RootAttachment")
            spinVelocity.MaxTorque = math.huge
            spinVelocity.AngularVelocity = Vector3.new(0, speed, 0)
            spinVelocity.Parent = humRoot
            spinVelocity.Name = "Spinbot"
        else
            spinVelocity.AngularVelocity = Vector3.new(0, speed, 0)
        end
        
        OrionLib:MakeNotification({
            Name = "已设置",
            Content = "旋转速度已调整为: " .. speed,
            Time = 1.5
        })
    end
})

Tab:AddButton({
    Name = "停止旋转",
    Callback = function()
        local plr = game:GetService("Players").LocalPlayer
        repeat task.wait() until plr.Character
        local humRoot = plr.Character:WaitForChild("HumanoidRootPart")
        local humanoid = plr.Character:WaitForChild("Humanoid")

        local spinbot = humRoot:FindFirstChild("Spinbot")
        if spinbot then
            spinbot:Destroy()
            spinVelocity = nil
            humanoid.AutoRotate = true
            OrionLib:MakeNotification({
                Name = "已停止",
                Content = "旋转已停止",
                Time = 1.5
            })
        else
            OrionLib:MakeNotification({
                Name = "提示",
                Content = "未处于旋转状态",
                Time = 1.5
            })
        end
    end,
    Color = Color3.fromRGB(255, 99, 71)
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
            plr.CharacterAdded:Connect(function()
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

Tab:AddButton({
    Name = "关闭透视",
    Callback = function()
        for _, plr in pairs(game:GetService("Players"):GetPlayers()) do
            if plr.Character and plr.Character:FindFirstChild("StyledHighlight") then
                plr.Character.StyledHighlight:Destroy()
            end
        end
    end
})

Tab:AddButton({
    Name = "飞行",
    Default = false,
    Callback = function(Value)
        if Value then
            local success, err = pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/HXB20111/roblox-/refs/heads/main/%E9%BB%84%E9%A3%9E%E8%A1%8C"))()
            end)
            if not success then
                warn("飞行功能脚本加载失败: ".. (err or "未知错误"))
            end
        end
    end
})

-- 作者信息标签页
local AuthorTab = Window:MakeTab({
    Name = "作者信息",
    Icon = "rbxassetid://4483345998"
})

AuthorTab:AddParagraph("作者", "卡卡大帝")
AuthorTab:AddParagraph("作者QQ", "3804046925")
AuthorTab:AddParagraph("副作者", "Hfh916")
AuthorTab:AddParagraph("作者QQ", "1357377308")
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

local InkGameTab = Window:MakeTab({
    Name = "开发者",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

InkGameTab:AddButton({
    Name = "dex",
    Callback = function()
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Focuslol666/RbxScripts/refs/heads/main/Other/DexPlusPlus%20(ZH-CN).lua", true))()
        end)
        if not success then
            warn("dex脚本加载失败: ".. (err or "未知错误"))
        end
    end
})

InkGameTab:AddButton({
    Name = "IY",
    Callback = function()
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source(ZH-CN).lua", true))()
        end)
        if not success then
            warn("IY脚本加载失败: ".. (err or "未知错误"))
        end
    end
})

local InkGameTab = Window:MakeTab({
    Name = "其它脚本",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

InkGameTab:AddButton({
    Name = "汉化脚本",
    Callback = function()
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/S-WTB/-/refs/heads/main/ISIS加载器", true))()
        end)
        if not success then
            warn("汉化脚本加载失败: ".. (err or "未知错误"))
        end
    end
})

InkGameTab:AddButton({
    Name = "溺凌脚本",
    Callback = function()
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ShenJiaoBen/ScriptLoader/refs/heads/main/Linni_FreeLoader.lua(ZH-CN).lua", true))()
        end)
        if not success then
            warn("溺凌脚本加载失败: ".. (err or "未知错误"))
        end
    end
})

InkGameTab:AddButton({
    Name = "TX脚本",
    Callback = function()
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/JsYb666/TX-Free-YYDS/refs/heads/main/FREE-TX-TEAM", true))()
        end)
        if not success then
            warn("TX脚本加载失败: ".. (err or "未知错误"))
        end
    end
})

-- 墨水游戏 Tab
local InkGameTab = Window:MakeTab({
    Name = "墨水游戏",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

InkGameTab:AddButton({
    Name = "脚本一",
    Callback = function()
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/XOTRXONY/INKGAME/main/INKGAMEE.lua", true))()
        end)
        if not success then
            warn("墨水游戏脚本加载失败: ".. (err or "未知错误"))
        end
    end
})

-- 一路向西 Tab
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

-- 死铁轨 Tab
local DeadRailTab = Window:MakeTab({
    Name = "死铁轨",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

DeadRailTab:AddButton({
    Name = "脚本一",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/m00ndiety/OP-AUTO-BONDS-V3/refs/heads/main/Keyless-BONDS-v3"))()
    end
})

-- 初始化界面
OrionLib:Init()
