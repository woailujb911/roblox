local OrionLib
local success, err = pcall(function()
    OrionLib = 
 loadstring(game:HttpGet("https://raw.githubusercontent.com/HXB20111/roblox-/refs/heads/main/%E9%BB%84%E8%84%9A%E6%9C%ACUI.lua"))()
 end)
 if not success or not OrionLib then
    warn("Orion库加载失败: " .. (err or "未知错误"))
    return
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

addRoundButton(AuthorTab, {
    Name = "复制作者QQ",
    Callback = function()
        if setclipboard then
            setclipboard("3804046925")
            OrionLib:MakeNotification({Name = "成功", Content = "QQ已复制", Time = 2})
        end
    end,
    Color = Color3.fromRGB(70, 130, 255)
})

addRoundButton(AuthorTab, {
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

	Color = Color3.fromRGB(255,255,255),

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

	Color = Color3.fromRGB(255,255,255),

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

		game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value

	end

})

Tab:AddTextbox({

	Name = "移动速度设置",

	Default = "",

	TextDisappear = true,

	Callback = function(Value)

		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value

	end

})

Tab:AddTextbox({

	Name = "重力设置",

	Default = "",

	TextDisappear = true,

	Callback = function(Value)

		game.Workspace.Gravity = Value

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
	
     loadstring(game:HttpGet("https://pastebin.com/raw/gqv7PXAa"))()

  	end    

})

Tab:AddToggle({

	Name = "旋转",

	Default = false,

	Callback = function(Value)
     loadstring(game:HttpGet("https://xn--9p9haaaaaa.tk/scripts/CarpetFling.lua"))()

  	end

})

Tab:AddToggle({

	Name = "踏空",

	Default = false,

	Callback = function(Value)
     loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Float'))()

	end

})
local Tab = Window:MakeTab({

	Name = "墨水游戏",

	Icon = "rbxassetid://4483345998",

	PremiumOnly = false

})
Tab:AddToggle({

	Name = "飞行",

	Default = false,

	Callback = function(Value)
	
     loadstring(game:HttpGet("https://pastebin.com/raw/gqv7PXAa"))()

  	end    

})
Tab:AddToggle({

	Name = "旋转",

	Default = false,

	Callback = function(Value)
      	loadstring(game:HttpGet("https://xn--9p9haaaaaa.tk/scripts/CarpetFling.lua"))()

  	end

})
local Tab = Window:MakeTab({

	Name = "墨水游戏",

	Icon = "rbxassetid://4483345998",

	PremiumOnly = false

})
Tab:AddButton({

	Name = "脚本一",

	Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/XOTRXONY/INKGAME/main/INKGAMEE.lua", true))()

    end

})
Tab:AddButton({

local Tab = Window:MakeTab({

	Name = "一路向西",

	Icon = "rbxassetid://4483345998",

	PremiumOnly = false

})
Tab:AddButton({

	Name = "脚本一",

	Callback = function()
	   loadstring(game:HttpGet("https://raw.githubusercontent.com/fcsdsss/westboundscp/refs/heads/main/simpleToDoMobile.lua"))()
	
    end

})
Tab:AddButton({

	Name = "一路向西百刀",

	Callback = function()
	   local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer

local Config = {
    KNIFE_SEQUENCE_DELAY = 0.00001,
    KNIFE_THREAD_COUNT = 60,
    KNIFE_INTER_THREAD_DELAY = 0.00001,

    ICE_AXE_SEQUENCE_DELAY = 0.00001,
    ICE_AXE_THREAD_COUNT = 60,
    ICE_AXE_INTER_THREAD_DELAY = 0.00001,

    MACHETE_SEQUENCE_DELAY = 0.00001,
    MACHETE_THREAD_COUNT = 60,
    MACHETE_INTER_THREAD_DELAY = 0.00001,

    TELEPORT_RATE = 0.01,
    TELEPORT_DISTANCE = 2,
    teleportDirectionMode = "前方",
    TOGGLE_HOTKEY = Enum.KeyCode.RightControl
}

local isKnifeActive = false
local isIceAxeActive = false
local isMacheteActive = false
local isMinimized = false
local teleportTargets = {}

if LocalPlayer.PlayerGui:FindFirstChild("UltimateDamageFinal_v8_EventFix") then LocalPlayer.PlayerGui.UltimateDamageFinal_v8_EventFix:Destroy() end
local Gui = Instance.new("ScreenGui"); Gui.Name = "UltimateDamageFinal_v8_EventFix"; Gui.Parent = LocalPlayer:WaitForChild("PlayerGui"); Gui.ResetOnSpawn = false
local originalSize = UDim2.new(0, 240, 0, 240); local minimizedSize = UDim2.new(0, 240, 0, 30)
local MainFrame = Instance.new("Frame"); MainFrame.Name = "MainFrame"; MainFrame.Size = originalSize; MainFrame.Position = UDim2.new(0.5, -120, 0.2, 0); MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 28); MainFrame.BorderSizePixel = 0; MainFrame.Active = true; MainFrame.Parent = Gui; MainFrame.ClipsDescendants = false
local Corner = Instance.new("UICorner"); Corner.CornerRadius = UDim.new(0, 8); Corner.Parent = MainFrame
local Stroke = Instance.new("UIStroke"); Stroke.Color = Color3.fromRGB(60, 60, 65); Stroke.Thickness = 1.5; Stroke.Parent = MainFrame
local TitleBar = Instance.new("Frame"); TitleBar.Name = "TitleBar"; TitleBar.Size = UDim2.new(1, 0, 0, 30); TitleBar.BackgroundColor3 = Color3.fromRGB(40, 40, 45); TitleBar.BorderSizePixel = 0; TitleBar.Parent = MainFrame
local TitleCorner = Instance.new("UICorner"); TitleCorner.CornerRadius = UDim.new(0, 8); TitleCorner.Parent = TitleBar
local TitleText = Instance.new("TextLabel"); TitleText.Name = "TitleText"; TitleText.Size = UDim2.new(1, 0, 1, 0); TitleText.BackgroundTransparency = 1; TitleText.Font = Enum.Font.GothamSemibold; TitleText.TextColor3 = Color3.fromRGB(240, 240, 240); TitleText.Text = "传送杀 (v4.7)"; TitleText.TextSize = 16; TitleText.Parent = TitleBar
local MinimizeButton = Instance.new("TextButton"); MinimizeButton.Name = "MinimizeButton"; MinimizeButton.Size = UDim2.new(0, 20, 0, 20); MinimizeButton.Position = UDim2.new(1, -50, 0.5, -10); MinimizeButton.BackgroundTransparency = 0; MinimizeButton.BackgroundColor3 = TitleBar.BackgroundColor3; MinimizeButton.Font = Enum.Font.GothamBold; MinimizeButton.Text = "—"; MinimizeButton.TextSize = 16; MinimizeButton.TextColor3 = Color3.fromRGB(240, 240, 240); MinimizeButton.Parent = TitleBar
local CloseButton = Instance.new("TextButton"); CloseButton.Name = "CloseButton"; CloseButton.Size = UDim2.new(0, 20, 0, 20); CloseButton.Position = UDim2.new(1, -25, 0.5, -10); CloseButton.BackgroundTransparency = 0; CloseButton.BackgroundColor3 = TitleBar.BackgroundColor3; CloseButton.Font = Enum.Font.GothamBold; CloseButton.Text = "✕"; CloseButton.TextSize = 16; CloseButton.TextColor3 = Color3.fromRGB(240, 240, 240); CloseButton.Parent = TitleBar
local ContentFrame = Instance.new("Frame"); ContentFrame.Name = "ContentFrame"; ContentFrame.Size = UDim2.new(1, 0, 1, -30); ContentFrame.Position = UDim2.new(0, 0, 0, 30); ContentFrame.BackgroundTransparency = 1; ContentFrame.Parent = MainFrame

local function createLabel(parent, text, xPos, yPos) local label = Instance.new("TextLabel"); label.Size = UDim2.new(0.4, 0, 0, 20); label.Position = UDim2.fromScale(xPos, yPos); label.AnchorPoint = Vector2.new(0.5, 0.5); label.BackgroundTransparency = 1; label.Font = Enum.Font.Gotham; label.Text = text; label.TextSize = 12; label.TextColor3 = Color3.fromRGB(180, 180, 180); label.Parent = parent; return label end
local function createTextBox(parent, defaultText, xPos, yPos, widthScale) local textBox = Instance.new("TextBox"); textBox.Size = UDim2.new(widthScale or 0.4, 0, 0, 28); textBox.Position = UDim2.fromScale(xPos, yPos); textBox.AnchorPoint = Vector2.new(0.5, 0.5); textBox.Text = defaultText; textBox.BackgroundColor3 = Color3.fromRGB(15, 15, 17); textBox.Font = Enum.Font.GothamSemibold; textBox.TextColor3 = Color3.fromRGB(240, 240, 240); textBox.TextSize = 14; textBox.ClearTextOnFocus = false; textBox.Parent = parent; local c = Instance.new("UICorner"); c.CornerRadius = UDim.new(0, 6); c.Parent = textBox; local s = Instance.new("UIStroke"); s.Color = Color3.fromRGB(80, 80, 85); s.Thickness = 1; s.Parent = textBox; return textBox, s end

local KnifeButton = Instance.new("TextButton"); KnifeButton.Name = "KnifeButton"; KnifeButton.Size = UDim2.new(0.9, 0, 0, 35); KnifeButton.Position = UDim2.fromScale(0.5, 0.12); KnifeButton.AnchorPoint = Vector2.new(0.5, 0.5); KnifeButton.Font = Enum.Font.GothamSemibold; KnifeButton.TextSize = 16; KnifeButton.TextColor3 = Color3.fromRGB(240, 240, 240); KnifeButton.Parent = ContentFrame; local KnifeBtnCorner = Instance.new("UICorner"); KnifeBtnCorner.CornerRadius = UDim.new(0, 6); KnifeBtnCorner.Parent = KnifeButton
local IceAxeButton = Instance.new("TextButton"); IceAxeButton.Name = "IceAxeButton"; IceAxeButton.Size = UDim2.new(0.9, 0, 0, 35); IceAxeButton.Position = UDim2.fromScale(0.5, 0.30); IceAxeButton.AnchorPoint = Vector2.new(0.5, 0.5); IceAxeButton.Font = Enum.Font.GothamSemibold; IceAxeButton.TextSize = 16; IceAxeButton.TextColor3 = Color3.fromRGB(240, 240, 240); IceAxeButton.Parent = ContentFrame; local IceAxeBtnCorner = Instance.new("UICorner"); IceAxeBtnCorner.CornerRadius = UDim.new(0, 6); IceAxeBtnCorner.Parent = IceAxeButton
local MacheteButton = Instance.new("TextButton"); MacheteButton.Name = "MacheteButton"; MacheteButton.Size = UDim2.new(0.9, 0, 0, 35); MacheteButton.Position = UDim2.fromScale(0.5, 0.48); MacheteButton.AnchorPoint = Vector2.new(0.5, 0.5); MacheteButton.Font = Enum.Font.GothamSemibold; MacheteButton.TextSize = 16; MacheteButton.TextColor3 = Color3.fromRGB(240, 240, 240); MacheteButton.Parent = ContentFrame; local MacheteBtnCorner = Instance.new("UICorner"); MacheteBtnCorner.CornerRadius = UDim.new(0, 6); MacheteBtnCorner.Parent = MacheteButton
local TeleportSectionLabel = Instance.new("TextLabel"); TeleportSectionLabel.Size = UDim2.new(0.9, 0, 0, 20); TeleportSectionLabel.Position = UDim2.fromScale(0.5, 0.66); TeleportSectionLabel.AnchorPoint = Vector2.new(0.5, 0.5); TeleportSectionLabel.BackgroundTransparency = 1; TeleportSectionLabel.Font = Enum.Font.GothamBold; TeleportSectionLabel.Text = "传送功能"; TeleportSectionLabel.TextSize = 14; TeleportSectionLabel.TextColor3 = Color3.fromRGB(200, 200, 200); TeleportSectionLabel.Parent = ContentFrame
createLabel(ContentFrame, "速率", 0.25, 0.78); local TeleportRateBox, TeleportRateStroke = createTextBox(ContentFrame, tostring(Config.TELEPORT_RATE), 0.25, 0.88)
createLabel(ContentFrame, "距离", 0.75, 0.78); local TeleportDistBox, TeleportDistStroke = createTextBox(ContentFrame, tostring(Config.TELEPORT_DISTANCE), 0.75, 0.88)

local SidePanelFrame = Instance.new("Frame"); SidePanelFrame.Name = "SidePanelFrame"; SidePanelFrame.Parent = MainFrame; SidePanelFrame.Size = UDim2.new(0, 200, 1, 0); SidePanelFrame.Position = UDim2.new(1, 0, 0, 0); SidePanelFrame.AnchorPoint = Vector2.new(0, 0); SidePanelFrame.BackgroundColor3 = MainFrame.BackgroundColor3; SidePanelFrame.BorderSizePixel = 0; SidePanelFrame.ClipsDescendants = true
local SideCorner = Instance.new("UICorner"); SideCorner.CornerRadius = UDim.new(0, 8); SideCorner.Parent = SidePanelFrame
local SideStroke = Instance.new("UIStroke"); SideStroke.Color = Stroke.Color; SideStroke.Thickness = Stroke.Thickness; SideStroke.Parent = SidePanelFrame
local SideTitleBar = Instance.new("Frame"); SideTitleBar.Name = "SideTitleBar"; SideTitleBar.Size = UDim2.new(1, 0, 0, 30); SideTitleBar.BackgroundColor3 = TitleBar.BackgroundColor3; SideTitleBar.BorderSizePixel = 0; SideTitleBar.Parent = SidePanelFrame
local SideTitleCorner = Instance.new("UICorner"); SideTitleCorner.CornerRadius = UDim.new(0, 8); SideTitleCorner.Parent = SideTitleBar
local SideTitleText = Instance.new("TextLabel"); SideTitleText.Name = "SideTitleText"; SideTitleText.Size = UDim2.new(1, -60, 1, 0); SideTitleText.Position = UDim2.fromScale(0.05, 0); SideTitleText.BackgroundTransparency = 1; SideTitleText.Font = Enum.Font.GothamSemibold; SideTitleText.TextColor3 = Color3.fromRGB(240, 240, 240); SideTitleText.Text = "玩家列表"; SideTitleText.TextSize = 16; SideTitleText.TextXAlignment = Enum.TextXAlignment.Left; SideTitleText.Parent = SideTitleBar
local SideDirectionButton = Instance.new("TextButton"); SideDirectionButton.Name = "SideDirectionButton"; SideDirectionButton.Size = UDim2.new(0, 20, 0, 20); SideDirectionButton.Position = UDim2.new(1, -50, 0.5, -10); SideDirectionButton.BackgroundTransparency = 1; SideDirectionButton.Font = Enum.Font.GothamBold; SideDirectionButton.Text = "➡️"; SideDirectionButton.TextSize = 16; SideDirectionButton.TextColor3 = Color3.fromRGB(240, 240, 240); SideDirectionButton.Parent = SideTitleBar
local SideRefreshButton = Instance.new("TextButton"); SideRefreshButton.Name = "SideRefreshButton"; SideRefreshButton.Size = UDim2.new(0, 20, 0, 20); SideRefreshButton.Position = UDim2.new(1, -25, 0.5, -10); SideRefreshButton.BackgroundTransparency = 1; SideRefreshButton.Font = Enum.Font.GothamBold; SideRefreshButton.Text = "🔄"; SideRefreshButton.TextSize = 16; SideRefreshButton.TextColor3 = Color3.fromRGB(240, 240, 240); SideRefreshButton.Parent = SideTitleBar
local PlayerListFrame = Instance.new("ScrollingFrame"); PlayerListFrame.Name = "PlayerListFrame"; PlayerListFrame.Parent = SidePanelFrame; PlayerListFrame.Size = UDim2.new(1, 0, 1, -30); Pl

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