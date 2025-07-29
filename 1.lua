local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Title = Instance.new("TextLabel")
local TextBox = Instance.new("TextBox")
local TextButton = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")
local Message = Instance.new("TextLabel")
local CloseButton = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")
local GradientBorder = Instance.new("Frame")
local UICorner_4 = Instance.new("UICorner")
local Gradient = Instance.new("UIGradient")

-- 核心变量声明
ScreenGui.Name = "KakaScriptUI"
local attempts = 0
local maxAttempts = 3
local isValid = false

-- 界面初始化
ScreenGui.Parent = game.Players.LocalPlayer.PlayerGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- 主框架设置
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Frame.Position = UDim2.new(0.5, -200, 0.5, -150)
Frame.Size = UDim2.new(0, 400, 0, 300)
Frame.ClipsDescendants = true

-- 渐变边框
GradientBorder.Parent = Frame
GradientBorder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
GradientBorder.Position = UDim2.new(0, 0, 0, 0)
GradientBorder.Size = UDim2.new(1, 0, 1, 0)
GradientBorder.ZIndex = 0

UICorner_4.Parent = GradientBorder
UICorner_4.CornerRadius = UDim.new(0, 12)

Gradient.Parent = GradientBorder
Gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 162, 255)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 0, 0)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 162, 255))
}
Gradient.Rotation = 90
Gradient.Enabled = true

-- 内部框架
local InnerFrame = Instance.new("Frame")
InnerFrame.Parent = Frame
InnerFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
InnerFrame.Position = UDim2.new(0, 2, 0, 2)
InnerFrame.Size = UDim2.new(1, -4, 1, -4)
InnerFrame.ZIndex = 1

UICorner.Parent = InnerFrame
UICorner.CornerRadius = UDim.new(0, 10)

-- 标题
Title.Parent = InnerFrame
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0.5, -100, 0.1, -15)
Title.Size = UDim2.new(0, 200, 0, 30)
Title.Font = Enum.Font.GothamBold
Title.Text = "卡卡脚本-卡密系统"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 18

-- 输入框
TextBox.Parent = InnerFrame
TextBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
TextBox.Position = UDim2.new(0.5, -150, 0.4, -15)
TextBox.Size = UDim2.new(0, 300, 0, 35)
TextBox.Font = Enum.Font.Gotham
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.TextSize = 14
TextBox.PlaceholderText = "请输入卡密"
TextBox.PlaceholderColor3 = Color3.fromRGB(180, 180, 180)

local TextBoxCorner = Instance.new("UICorner")
TextBoxCorner.CornerRadius = UDim.new(0, 8)
TextBoxCorner.Parent = TextBox

-- 验证按钮
TextButton.Parent = InnerFrame
TextButton.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
TextButton.Position = UDim2.new(0.5, -100, 0.6, -20)
TextButton.Size = UDim2.new(0, 200, 0, 45)
TextButton.Font = Enum.Font.GothamBold
TextButton.Text = "验证卡密"
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton.TextSize = 18

UICorner_2.Parent = TextButton
UICorner_2.CornerRadius = UDim.new(0, 8)

-- 消息提示
Message.Parent = InnerFrame
Message.BackgroundTransparency = 1
Message.Position = UDim2.new(0.5, -150, 0.8, -10)
Message.Size = UDim2.new(0, 300, 0, 20)
Message.Font = Enum.Font.Gotham
Message.Text = ""
Message.TextColor3 = Color3.fromRGB(255, 255, 255)
Message.TextSize = 14

-- 关闭按钮
CloseButton.Parent = InnerFrame
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
CloseButton.Position = UDim2.new(1, -30, 0, 5)
CloseButton.Size = UDim2.new(0, 25, 0, 25)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 14

UICorner_3.Parent = CloseButton
UICorner_3.CornerRadius = UDim.new(1, 0)

-- 安全验证逻辑
local function validateKey(key)
    -- 实际应用中应替换为服务器验证逻辑
    return key == "卡卡大帝"
end

-- 渐变动画
local running = true
local function animateGradient()
    while running do
        Gradient.Offset = Vector2.new(0, 0)
        for i = 0, 1, 0.01 do
            Gradient.Offset = Vector2.new(i, 0)
            wait(0.03)
            if not ScreenGui.Parent then running = false end
        end
    end
end
coroutine.wrap(animateGradient)()

-- 验证按钮点击事件
TextButton.MouseButton1Click:Connect(function()
    local key = TextBox.Text:gsub("%s+", "") -- 去除空格
    if validateKey(key) then
        Message.Text = "验证成功，正在加载脚本..."
        Message.TextColor3 = Color3.fromRGB(0, 255, 0)
        task.wait(1)
        ScreenGui:Destroy()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/MIAN57/main/refs/heads/main/%E5%8D%A1%E5%8D%A1"))()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "系统通知",
            Text = "卡密验证成功，脚本已启用",
            Duration = 5
        })
    else
        attempts = attempts + 1
        Message.Text = string.format("卡密错误 (%d/%d)", attempts, maxAttempts)
        Message.TextColor3 = Color3.fromRGB(255, 0, 0)
        if attempts >= maxAttempts then
            Message.Text = "尝试次数过多，即将退出"
            task.wait(1)
            ScreenGui:Destroy()
            game.Players.LocalPlayer:Kick("卡密验证失败")
        end
    end
end)

-- 关闭按钮事件
CloseButton.MouseButton1Click:Connect(function()
    running = false
    ScreenGui:Destroy()
end)

-- 窗口关闭事件
ScreenGui:GetPropertyChangedSignal("Parent"):Connect(function()
    running = false
end)
