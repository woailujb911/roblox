local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/woailujb911/roblox/refs/heads/main/%E5%8D%A1%E5%8D%A1.lua"))()
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
        Text = "欢迎使用，功能已就序",
        Duration = 4,
        Icon = "rbxassetid://117383430326696"
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

Tab:AddTextbox({
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

Tab:AddToggle({
    Name = "穿墙",
    Default = false,
    Callback = function(enabled)
        isClipping = enabled
        local char = game.Players.LocalPlayer.Character
        
        if enabled then
            stepConnection = game:GetService("RunService").Stepped:Connect(function()
                if isClipping and char then
                    for _, part in pairs(char:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                else
                    stepConnection:Disconnect()
                end
            end)
            OrionLib:MakeNotification({Name = "状态", Content = "穿墙已开启", Time = 2})
        else
            if char then
                for _, part in pairs(char:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = true
                    end
                end
            end
            OrionLib:MakeNotification({Name = "状态", Content = "穿墙已关闭", Time = 2})
            if stepConnection then stepConnection:Disconnect() end
        end
    end,
    Color = Color3.fromRGB(100, 149, 237)
})

local isESPEnabled = false
local highlights = {}

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

Tab:AddToggle({
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

Tab:AddButton({
    Name = "自瞄1",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/woailujb911/roblox/refs/heads/main/zimiao"))()
    end
})

Tab:AddButton({
    Name = "自瞄2",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/wsomoQaz/lua-/main/aimbot"))()
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
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Wangzhehao8/fly-away/main/%E6%8C%87%E6%BB%8A%E6%B8%AD%E6%96%87.txt", true))()
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
    Name = "WTB脚本",
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
    Name = "霖溺脚本",
    Callback = function()
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ShenJiaoBen/ScriptLoader/refs/heads/main/Linni_FreeLoader.lua", true))()
        end)
        if not success then
            warn("霖溺脚本加载失败: ".. (err or "未知错误"))
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

InkGameTab:AddButton({
    Name = "安脚本",
    Callback = function()
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/wucan114514/gegeyxjb/main/oww", true))()
        end)
        if not success then
            warn("安脚本加载失败: ".. (err or "未知错误"))
        end
    end
})

InkGameTab:AddButton({
    Name = "AlienX脚本",
    Callback = function()
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/woailujb911/-/refs/heads/main/%E5%A4%96%E6%98%9F%E4%BA%BA.lua", true))()
        end)
        if not success then
            warn("AlienX脚本加载失败: ".. (err or "未知错误"))
        end
    end
})

InkGameTab:AddButton({
    Name = "北极星脚本",
    Callback = function()
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/zilinskaslandon/-/refs/heads/main/%3DBJX%E8%84%9A%E6%9C%AC%E4%B8%AD%E5%BF%83%E4%BA%8C%E6%AD%A5%E9%AA%A4%3D.lua", true))()
        end)
        if not success then
            warn("北极星脚本加载失败: ".. (err or "未知错误"))
        end
    end
})

local InkGameTab = Window:MakeTab({
    Name = "-脚本区-",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

InkGameTab:AddButton({
    Name = "建造一架飞机",
    Callback = function()
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://rscripts.net/raw/not-patched-infinite-money-money-farm-open-shop_1753743540999_gqxO4z8nzH.txt", true))()
        end)
        if not success then
            warn("脚本加载失败: ".. (err or "未知错误"))
        end
    end
})

InkGameTab:AddButton({
    Name = "墨水游戏",
    Callback = function()
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Syndromehsh/BETA2/refs/heads/main/NOL", true))()
        end)
        if not success then
            warn("脚本加载失败: ".. (err or "未知错误"))
        end
    end
})

InkGameTab:AddButton({
    Name = "战争大亨",
    Callback = function()
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Xingtaiduan/Script/refs/heads/main/Games/战争大亨.lua", true))()
        end)
        if not success then
            warn("脚本加载失败: ".. (err or "未知错误"))
        end
    end
})

InkGameTab:AddButton({
    Name = "生存99夜",
    Callback = function()
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/gycgchgyfytdttr/shenqin/refs/heads/main/99day.lua", true))()
        end)
        if not success then
            warn("脚本加载失败: ".. (err or "未知错误"))
        end
    end
})

InkGameTab:AddButton({
    Name = "穷小子打工日记",
    Callback = function()
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/gycgchgyfytdttr/QQ-9-2-8-9-50173/refs/heads/main/newsqnb.lua", true))()
        end)
        if not success then
            warn("脚本加载失败: ".. (err or "未知错误"))
        end
    end
})

InkGameTab:AddButton({
    Name = "死铁轨",
    Callback = function()
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/wefwef127382/DEADRAILS.github.io/refs/heads/main/mainringta.lua", true))()
        end)
        if not success then
            warn("脚本加载失败: ".. (err or "未知错误"))
        end
    end
})

InkGameTab:AddButton({
    Name = "Doors",
    Callback = function()
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunCN/EntitySpawner/main/doors(orionlib).lua", true))()
        end)
        if not success then
            warn("脚本加载失败: ".. (err or "未知错误"))
        end
    end
})

InkGameTab:AddButton({
    Name = "造船寻宝",
    Callback = function()
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/woailujb911/roblox/refs/heads/main/%E9%80%A0%E8%88%B9%E5%AF%BB%E5%AE%9D.lua", true))()
        end)
        if not success then
            warn("脚本加载失败: ".. (err or "未知错误"))
        end
    end
})

InkGameTab:AddButton({
    Name = "偷一条鱼",
    Callback = function()
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/MynameIsDoit/StealAFishAuto/refs/heads/main/AutoSteal.luau", true))()
        end)
        if not success then
            warn("脚本加载失败: ".. (err or "未知错误"))
        end
    end
})

InkGameTab:AddButton({
    Name = "进击的巨人",
    Callback = function()
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://api.luarmor.net/files/v4/loaders/705e7fe7aa288f0fe86900cedb1119b1.lua", true))()
        end)
        if not success then
            warn("脚本加载失败: ".. (err or "未知错误"))
        end
    end
})

InkGameTab:AddButton({
    Name = "为了1000000000000美元跳绳",
    Callback = function()
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://rawscripts.net/raw/The-dollar1000000-Jump-Rope-Keyless-Slap-All-Slap-Aura-Free-Gamepass-add-remove-money-47134", true))()
        end)
        if not success then
            warn("脚本加载失败: ".. (err or "未知错误"))
        end
    end
})



local PoliceVsKillerTab = Window:MakeTab({
    Name = "警察vs凶手",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- 头部缩放倍数输入框
PoliceVsKillerTab:AddTextbox({
    Name = "头部缩放倍数 (如 2)",
    Default = "1",
    TextDisappear = false,
    Callback = function(text)
        local number = tonumber(text)
        if number then
            headScale = number  -- 使用全局变量存储
        else
            OrionLib:MakeNotification({
                Name = "错误",
                Content = "请输入有效数字！",
                Time = 2
            })
        end
    end
})

-- 修改玩家头部大小按钮
PoliceVsKillerTab:AddButton({
    Name = "修改玩家的头部大小",
    Callback = function()
        local Players = game:GetService("Players")
        local LocalPlayer = Players.LocalPlayer
        local count = 0

        if not headScale then
            OrionLib:MakeNotification({
                Name = "错误",
                Content = "请先设置头部缩放倍数！",
                Time = 2
            })
            return
        end

        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                local character = player.Character
                if character then
                    local humanoid = character:FindFirstChildWhichIsA("Humanoid")
                    local head = character:FindFirstChild("Head")

                    if humanoid and head then
                        if humanoid.RigType == Enum.HumanoidRigType.R15 and head:IsA("MeshPart") then
                            head.Size = Vector3.new(1, 1, 1) * headScale
                            count += 1
                        elseif humanoid.RigType == Enum.HumanoidRigType.R6 then
                            local mesh = head:FindFirstChildWhichIsA("SpecialMesh")
                            if mesh then
                                mesh.Scale = Vector3.new(1, 1, 1) * headScale
                                count += 1
                            end
                        end
                    end
                end
            end
        end

        OrionLib:MakeNotification({
            Name = "完成",
            Content = "已修改 " .. count .. " 个玩家的头部大小",
            Time = 3
        })
    end
})

-- ESP开关
PoliceVsKillerTab:AddButton({
    Name = "开启/关闭 ESP",
    Default = true,
    Callback = function(enabled)
        _G.ESPEnabled = enabled
    end
})

-- ESP功能实现
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
_G.ESPEnabled = true

local function createESP(player)
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "ESP"
    billboard.Size = UDim2.new(0, 100, 0, 40)
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.AlwaysOnTop = true

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = ""
    label.TextColor3 = Color3.new(1, 1, 1)
    label.TextScaled = true
    label.Font = Enum.Font.SourceSansBold
    label.Parent = billboard

    local function updateText()
        local char = player.Character
        local myChar = LocalPlayer.Character
        if char and char:FindFirstChild("HumanoidRootPart") and myChar and myChar:FindFirstChild("HumanoidRootPart") then
            local distance = (char.HumanoidRootPart.Position - myChar.HumanoidRootPart.Position).Magnitude
            label.Text = player.Name .. string.format(" [%.0f m]", distance)
        end
    end

    local function onCharacterAdded(char)
        local hrp = char:WaitForChild("HumanoidRootPart")
        billboard.Parent = hrp
    end

    if player.Character then onCharacterAdded(player.Character) end
    player.CharacterAdded:Connect(onCharacterAdded)

    RunService.RenderStepped:Connect(function()
        if player and player.Parent and billboard and label then
            if _G.ESPEnabled then
                updateText()
                billboard.Enabled = true
            else
                billboard.Enabled = false
            end
        end
    end)
end

-- 初始化当前玩家的ESP
for _, player in pairs(Players:GetPlayers()) do
    if player ~= LocalPlayer then
        createESP(player)
    end
end

-- 新玩家加入时初始化ESP
Players.PlayerAdded:Connect(function(player)
    if player ~= LocalPlayer then
        createESP(player)
    end
end)

-- 初始化界面
OrionLib:Init()
