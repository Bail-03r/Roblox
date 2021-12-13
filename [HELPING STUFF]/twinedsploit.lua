-- Gui to Lua
-- Version: 3.2

-- Instances:

local TwinedSploit = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local NameSploit = Instance.new("TextLabel")
local TopLine = Instance.new("Frame")
local Logo = Instance.new("ImageLabel")
local Executor = Instance.new("TextBox")
local Execute = Instance.new("TextButton")
local ss = nil
--Properties:

TwinedSploit.Name = "TwinedSploit"
TwinedSploit.Parent = game.CoreGui

Main.Name = "Main"
Main.Parent = TwinedSploit
Main.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0.0976505131, 0, 0.439999998, 0)
Main.Size = UDim2.new(0, 801, 0, 356)
Main.ZIndex = 2
Main.Draggable = true
Main.Active = true
Main.Selectable = true

NameSploit.Name = "NameSploit"
NameSploit.Parent = Main
NameSploit.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
NameSploit.BackgroundTransparency = 1.000
NameSploit.BorderSizePixel = 0
NameSploit.Size = UDim2.new(0, 801, 0, 29)
NameSploit.ZIndex = 3
NameSploit.Font = Enum.Font.Arcade
NameSploit.Text = "TwinedXsploit"
NameSploit.TextColor3 = Color3.fromRGB(132, 104, 104)
NameSploit.TextScaled = true
NameSploit.TextSize = 14.000
NameSploit.TextWrapped = true
NameSploit.TextXAlignment = Enum.TextXAlignment.Left

TopLine.Name = "TopLine"
TopLine.Parent = Main
TopLine.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
TopLine.BackgroundTransparency = 0.500
TopLine.BorderSizePixel = 0
TopLine.Position = UDim2.new(0.0149812736, 0, 0.0814606771, 0)
TopLine.Size = UDim2.new(0, 778, 0, 7)
TopLine.ZIndex = 3

Logo.Name = "Logo"
Logo.Parent = Main
Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Logo.BackgroundTransparency = 1.000
Logo.Position = UDim2.new(0.263995409, 0, 0.0278072581, 0)
Logo.Size = UDim2.new(0, 15, 0, 15)
Logo.ZIndex = 3
Logo.Image = "http://www.roblox.com/asset/?id=6744329301"

Executor.Name = "Executor"
Executor.Parent = Main
Executor.BackgroundColor3 = Color3.fromRGB(56, 56, 56)
Executor.BackgroundTransparency = 0.500
Executor.BorderSizePixel = 0
Executor.Position = UDim2.new(0.0149812736, 0, 0.140449435, 0)
Executor.Size = UDim2.new(0, 778, 0, 260)
Executor.ZIndex = 3
Executor.ClearTextOnFocus = false
Executor.Font = Enum.Font.SourceSans
Executor.MultiLine = true
Executor.PlaceholderText = "--twinedSploit"
Executor.Text = "--script here"
Executor.TextColor3 = Color3.fromRGB(255, 170, 255)
Executor.TextSize = 14.000
Executor.TextXAlignment = Enum.TextXAlignment.Left
Executor.TextYAlignment = Enum.TextYAlignment.Top
Executor.Changed:Connect(function(what)
	if what == 'Text' then
		ss = Executor.Text
	end
end)

Execute.Name = "Execute"
Execute.Parent = Main
Execute.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Execute.BackgroundTransparency = 1.000
Execute.BorderSizePixel = 0
Execute.Position = UDim2.new(0, 0, 0.887640476, 0)
Execute.Size = UDim2.new(0, 801, 0, 40)
Execute.ZIndex = 3
Execute.Font = Enum.Font.Highway
Execute.Text = "Execute"
Execute.TextColor3 = Color3.fromRGB(103, 89, 90)
Execute.TextScaled = true
Execute.TextSize = 14.000
Execute.TextWrapped = true
Execute.MouseButton1Click:Connect(function()
	loadstring(ss)()
end)
