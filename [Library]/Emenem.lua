for _, v in pairs(game:GetService("CoreGui"):GetChildren()) do
	if v:FindFirstChild("UIBack") then
		v:Destroy()
	end
end

local ElysiumHub = Instance.new("ScreenGui")

ElysiumHub.Name = "ElysiumHub"
if syn and syn.protect_gui then
    syn.protect_gui(ElysiumHub)
    ElysiumHub.Parent = game.CoreGui
elseif hiddenUI then
    ElysiumHub.Parent = hiddenUI()
else
    ElysiumHub.Parent = game.CoreGui
end
ElysiumHub.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local lib = {}
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local TweenService = game:GetService("TweenService")

local function Drag(drag, frame) 
	pcall(function()
		local function getAP(ui)
			return ui.AbsolutePosition
		end
	
		local function getAS(ui)
			return ui.AbsoluteSize
		end
	
		local function getBounds(ui,vector2)
			local as = getAS(ui)
			if not vector2 then
				if (workspace.CurrentCamera.ViewportSize.X - as.X) < 0 then
					return true
				end
	
				return false
			end
			local lb = ((workspace.CurrentCamera.ViewportSize.Y - as.Y)) - 35
			local rb = ((workspace.CurrentCamera.ViewportSize.X - as.X))
			local x,y = vector2.X,vector2.Y
			
			if lb < y then
				y = lb
			end
			
			if y < 0 then
				y = 0
			end
			
			if rb < x then
				x = rb
			end
			
			if x < 0 then
				x = 0
			end
			
			return x,y
		end

		local mousedown = false
		local RunService = game:GetService("RunService")
		local Info = TweenInfo.new(.05)

		local TS = game:GetService("TweenService")

		drag.InputBegan:Connect(function(input)
			if (input.UserInputType == Enum.UserInputType.MouseButton1) then
				local ap = getAP(frame)
				local pos = Vector2.new(Mouse.X - ap.X, Mouse.Y - ap.Y)
				local lastPos = nil
				mousedown = true

				while (mousedown) do
					local _ = getAP(frame)
					local x,y = getBounds(frame, Vector2.new(Mouse.X-pos.X,Mouse.Y-pos.Y))
					if not lastPos then
						lastPos = Vector2.new(x,y)
					end
					if not (_.X == x and _.Y == y) and (Vector2.new(Mouse.X,Mouse.Y)-lastPos).Magnitude > 0 then
						local tween = TS:Create(frame, Info, { Position = UDim2.new(0,x,0,y) })
						tween:Play()
						lastPos = Vector2.new(Mouse.X,Mouse.Y)
					end

					RunService.Stepped:Wait()
				end
			end
		end)

		drag.InputEnded:Connect(function(input)
			if (input.UserInputType == Enum.UserInputType.Focus or input.UserInputType == Enum.UserInputType.MouseButton1) then
				mousedown = false
			end
		end)
	end)
end

function lib:CreateMain(gametitle)
	local UIBack = Instance.new("Frame")
	local UIBackCorner = Instance.new("UICorner")
	local TitleTexts = Instance.new("Frame")
	local SIUM = Instance.new("TextLabel")
	local ELY = Instance.new("TextLabel")
	local Dash = Instance.new("TextLabel")
	local GameText = Instance.new("TextLabel")
	local AllTabBtns = Instance.new("Frame")
	local AllTabBtnsListing = Instance.new("UIListLayout")
	local AllPages = Instance.new("Frame")
	local DragObject = Instance.new("Frame")
	local Exit = Instance.new("ImageButton")
	Drag(DragObject, UIBack)
	
	Exit.Name = "Exit"
	Exit.Parent = UIBack
	Exit.AnchorPoint = Vector2.new(0.5, 0.5)
	Exit.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Exit.BackgroundTransparency = 1.000
	Exit.Position = UDim2.new(0.959910929, 0, 0.0595120713, 0)
	Exit.Size = UDim2.new(0, 20, 0, 20)
	Exit.Image = "http://www.roblox.com/asset/?id=6031094678"
	Exit.ImageColor3 = Color3.fromRGB(34, 42, 56)
	Exit.MouseButton1Click:Connect(function()
		ElysiumHub:Destroy()
	end)
	
	ElysiumHub.Parent = game.CoreGui
	ElysiumHub.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	UIBack.Name = "UIBack"
	UIBack.Parent = ElysiumHub
	UIBack.BackgroundColor3 = Color3.fromRGB(13, 16, 23)
	UIBack.Position = UDim2.new(0.310606062, 0, 0.325153381, 0)
	UIBack.Size = UDim2.new(0, 449, 0, 284)

	UIBackCorner.CornerRadius = UDim.new(0, 4)
	UIBackCorner.Name = "UIBackCorner"
	UIBackCorner.Parent = UIBack

	TitleTexts.Name = "TitleTexts"
	TitleTexts.Parent = UIBack
	TitleTexts.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TitleTexts.BackgroundTransparency = 1.000
	TitleTexts.Position = UDim2.new(0.0244988855, 0, 0.0281690136, 0)
	TitleTexts.Size = UDim2.new(0, 238, 0, 19)

	SIUM.Name = "SIUM"
	SIUM.Parent = TitleTexts
	SIUM.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SIUM.BackgroundTransparency = 1.000
	SIUM.Position = UDim2.new(0.111564457, 0, -0.0244625658, 0)
	SIUM.Size = UDim2.new(0, 36, 0, 19)
	SIUM.Font = Enum.Font.GothamSemibold
	SIUM.Text = "SIUM"
	SIUM.TextColor3 = Color3.fromRGB(222, 39, 239)
	SIUM.TextSize = 15.000

	ELY.Name = "ELY"
	ELY.Parent = TitleTexts
	ELY.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ELY.BackgroundTransparency = 1.000
	ELY.Position = UDim2.new(0.00349054416, 0, -0.0244622473, 0)
	ELY.Size = UDim2.new(0, 26, 0, 19)
	ELY.Font = Enum.Font.GothamSemibold
	ELY.Text = "ELY"
	ELY.TextColor3 = Color3.fromRGB(245, 245, 245)
	ELY.TextSize = 15.000

	Dash.Name = "Dash"
	Dash.Parent = TitleTexts
	Dash.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Dash.BackgroundTransparency = 1.000
	Dash.Position = UDim2.new(0.260504216, 0, 0, 0)
	Dash.Size = UDim2.new(0, 21, 0, 18)
	Dash.Font = Enum.Font.GothamSemibold
	Dash.LineHeight = 1.300
	Dash.Text = "-"
	Dash.TextColor3 = Color3.fromRGB(245, 245, 245)
	Dash.TextSize = 16.000

	GameText.Name = "GameText"
	GameText.Parent = TitleTexts
	GameText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GameText.BackgroundTransparency = 1.000
	GameText.Position = UDim2.new(0.348739505, 0, 0, 0)
	GameText.Size = UDim2.new(0, 167, 0, 18)
	GameText.Font = Enum.Font.GothamSemibold
	GameText.Text = gametitle
	GameText.TextColor3 = Color3.fromRGB(144, 144, 144)
	GameText.TextSize = 14.000
	GameText.TextXAlignment = Enum.TextXAlignment.Left

	AllTabBtns.Name = "AllTabBtns"
	AllTabBtns.Parent = UIBack
	AllTabBtns.BackgroundColor3 = Color3.fromRGB(20, 24, 32)
	AllTabBtns.BorderSizePixel = 0
	AllTabBtns.Position = UDim2.new(0, 0, 0.133802816, 0)
	AllTabBtns.Size = UDim2.new(0, 449, 0, 22)

	AllTabBtnsListing.Name = "AllTabBtnsListing"
	AllTabBtnsListing.Parent = AllTabBtns
	AllTabBtnsListing.FillDirection = Enum.FillDirection.Horizontal
	AllTabBtnsListing.HorizontalAlignment = Enum.HorizontalAlignment.Center
	AllTabBtnsListing.SortOrder = Enum.SortOrder.LayoutOrder
	AllTabBtnsListing.Padding = UDim.new(0, 6)
	
	AllPages.Name = "AllPages"
	AllPages.Parent = UIBack
	AllPages.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	AllPages.BackgroundTransparency = 1.000
	AllPages.Position = UDim2.new(0.0244988855, 0, 0.257042259, 0)
	AllPages.Size = UDim2.new(0, 423, 0, 198)
	
	DragObject.Name = "DragObject"
	DragObject.Parent = UIBack
	DragObject.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	DragObject.BackgroundTransparency = 1.000
	DragObject.Size = UDim2.new(0, 449, 0, 38)
	
	local AllPagesFolder = Instance.new("Folder")
	AllPagesFolder.Name = "AllPagesFolder"
	AllPagesFolder.Parent = AllPages
	
	local tabs = {}
	
	function tabs:CreateTab(tabname)
		local Tab = Instance.new("TextButton")
		local Page = Instance.new("ScrollingFrame")
		local PageListing = Instance.new("UIListLayout")
		
		Tab.Name = "Tab"
		Tab.Parent = AllTabBtns
		Tab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Tab.BackgroundTransparency = 1.000
		Tab.BorderSizePixel = 0
		Tab.Position = UDim2.new(-0.0345211588, 0, 0, 0)
		Tab.Size = UDim2.new(0, 0, 0, 22)
		Tab.Font = Enum.Font.GothamSemibold
		Tab.Text = tabname
		Tab.TextColor3 = Color3.fromRGB(34, 42, 56)
		Tab.TextSize = 13.000
		Tab.AutomaticSize = Enum.AutomaticSize.X
		Tab.AutoButtonColor = false
		Tab.MouseButton1Click:Connect(function()
			for i, v in next, AllPagesFolder:GetChildren() do
				v.Visible = false
			end 
			Page.Visible = true

			for i, v in next, AllTabBtns:GetChildren() do
				if v:IsA("TextButton") then
					game.TweenService:Create(v, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
						TextColor3 = Color3.fromRGB(34, 42, 56)
					}):Play()
				end
			end
			game.TweenService:Create(Tab, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
				TextColor3 = Color3.fromRGB(245, 245, 245)
			}):Play()
		end)

		Page.Name = "Page"
		Page.Parent = AllPagesFolder
		Page.Active = true
		Page.AnchorPoint = Vector2.new(0.5, 0.5)
		Page.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Page.BackgroundTransparency = 1.000
		Page.BorderSizePixel = 0
		Page.Position = UDim2.new(0.5, 0, 0.5, 0)
		Page.Size = UDim2.new(0, 423, 0, 198)
		Page.CanvasSize = UDim2.new(0, 0, 0, 0)
		Page.ScrollBarThickness = 0
		Page.Visible = false

		PageListing.Name = "PageListing"
		PageListing.Parent = Page
		PageListing.SortOrder = Enum.SortOrder.LayoutOrder
		PageListing.Padding = UDim.new(0, 6)
		
		PageListing:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
			Page.CanvasSize = UDim2.new(0, 0, 0, PageListing.AbsoluteContentSize.Y) 
		end)
		
		local pages = {}
		
		function pages:CreateButton(buttontext, callback)
			local Button = Instance.new("TextButton")
			local ButtonCorner = Instance.new("UICorner")
			local ButtonText = Instance.new("TextLabel")
			
			Button.Name = "Button"
			Button.Parent = Page
			Button.BackgroundColor3 = Color3.fromRGB(18, 22, 29)
			Button.Size = UDim2.new(1, 0, 0, 30)
			Button.AutoButtonColor = false
			Button.Font = Enum.Font.SourceSans
			Button.Text = ""
			Button.TextColor3 = Color3.fromRGB(0, 0, 0)
			Button.TextSize = 14.000
			Button.MouseButton1Click:Connect(function()
				pcall(callback)
			end)

			ButtonCorner.CornerRadius = UDim.new(0, 3)
			ButtonCorner.Name = "ButtonCorner"
			ButtonCorner.Parent = Button

			ButtonText.Name = "ButtonText"
			ButtonText.Parent = Button
			ButtonText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ButtonText.BackgroundTransparency = 1.000
			ButtonText.Position = UDim2.new(0.0283687934, 0, 0, 0)
			ButtonText.Size = UDim2.new(0, 364, 0, 30)
			ButtonText.Font = Enum.Font.GothamSemibold
			ButtonText.Text = buttontext
			ButtonText.TextColor3 = Color3.fromRGB(201, 201, 201)
			ButtonText.TextSize = 12.000
			ButtonText.TextXAlignment = Enum.TextXAlignment.Left
			
		end
		function pages:CreateToggle(toggletext, callback)
			local toggled = false
			local ToggleButton = Instance.new("TextButton")
			local ToggleButtonCorner = Instance.new("UICorner")
			local ToggleButtonText = Instance.new("TextLabel")
			local ToggleFrameBorder = Instance.new("Frame")
			local ToggleFrameBorderCorner = Instance.new("UICorner")
			local ToggleFrame = Instance.new("Frame")
			local ToggleFrameCorner = Instance.new("UICorner")
			local ToggleFrameIcon = Instance.new("ImageLabel")
			local ToggleFrameGradient = Instance.new("UIGradient")
			
			ToggleButton.Name = "ToggleButton"
			ToggleButton.Parent = Page
			ToggleButton.BackgroundColor3 = Color3.fromRGB(18, 22, 29)
			ToggleButton.Size = UDim2.new(1, 0, 0, 30)
			ToggleButton.AutoButtonColor = false
			ToggleButton.Font = Enum.Font.SourceSans
			ToggleButton.Text = ""
			ToggleButton.TextColor3 = Color3.fromRGB(0, 0, 0)
			ToggleButton.TextSize = 14.000
			ToggleButton.MouseButton1Click:Connect(function()
				toggled = not toggled
				if toggled then
					game.TweenService:Create(ToggleFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
						BackgroundTransparency = 0
					}):Play()
					game.TweenService:Create(ToggleFrameIcon, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
						ImageTransparency = 0
					}):Play()
				else
					game.TweenService:Create(ToggleFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
						BackgroundTransparency = 1
					}):Play()
					game.TweenService:Create(ToggleFrameIcon, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
						ImageTransparency = 1
					}):Play()
				end
				pcall(callback, toggled)
			end)

			ToggleButtonCorner.CornerRadius = UDim.new(0, 3)
			ToggleButtonCorner.Name = "ToggleButtonCorner"
			ToggleButtonCorner.Parent = ToggleButton

			ToggleButtonText.Name = "ToggleButtonText"
			ToggleButtonText.Parent = ToggleButton
			ToggleButtonText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ToggleButtonText.BackgroundTransparency = 1.000
			ToggleButtonText.Position = UDim2.new(0.0283687934, 0, 0, 0)
			ToggleButtonText.Size = UDim2.new(0, 364, 0, 30)
			ToggleButtonText.Font = Enum.Font.GothamSemibold
			ToggleButtonText.Text = toggletext
			ToggleButtonText.TextColor3 = Color3.fromRGB(201, 201, 201)
			ToggleButtonText.TextSize = 12.000
			ToggleButtonText.TextXAlignment = Enum.TextXAlignment.Left

			ToggleFrameBorder.Name = "ToggleFrameBorder"
			ToggleFrameBorder.Parent = ToggleButton
			ToggleFrameBorder.AnchorPoint = Vector2.new(0.5, 0.5)
			ToggleFrameBorder.BackgroundColor3 = Color3.fromRGB(9, 11, 15)
			ToggleFrameBorder.BorderSizePixel = 0
			ToggleFrameBorder.Position = UDim2.new(0.962174952, 0, 0.5, 0)
			ToggleFrameBorder.Size = UDim2.new(0, 15, 0, 15)

			ToggleFrameBorderCorner.CornerRadius = UDim.new(0, 3)
			ToggleFrameBorderCorner.Name = "ToggleFrameBorderCorner"
			ToggleFrameBorderCorner.Parent = ToggleFrameBorder

			ToggleFrame.Name = "ToggleFrame"
			ToggleFrame.Parent = ToggleFrameBorder
			ToggleFrame.AnchorPoint = Vector2.new(0.5, 0.5)
			ToggleFrame.BackgroundColor3 = Color3.fromRGB(94, 30, 95)
			ToggleFrame.BorderSizePixel = 0
			ToggleFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
			ToggleFrame.Size = UDim2.new(0, 13, 0, 13)
			ToggleFrame.BackgroundTransparency = 1

			ToggleFrameCorner.CornerRadius = UDim.new(0, 3)
			ToggleFrameCorner.Name = "ToggleFrameCorner"
			ToggleFrameCorner.Parent = ToggleFrame

			ToggleFrameIcon.Name = "ToggleFrameIcon"
			ToggleFrameIcon.Parent = ToggleFrame
			ToggleFrameIcon.AnchorPoint = Vector2.new(0.5, 0.5)
			ToggleFrameIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ToggleFrameIcon.BackgroundTransparency = 1.000
			ToggleFrameIcon.Position = UDim2.new(0.5, 0, 0.5, 0)
			ToggleFrameIcon.Size = UDim2.new(1, 0, 1, 0)
			ToggleFrameIcon.Image = "http://www.roblox.com/asset/?id=6031094667"
			ToggleFrameIcon.ImageColor3 = Color3.fromRGB(0, 0, 0)
			ToggleFrameIcon.ImageTransparency = 1

			ToggleFrameGradient.Rotation = 270
			ToggleFrameGradient.Name = "ToggleFrameGradient"
			ToggleFrameGradient.Parent = ToggleFrame
			
		end
		function pages:CreateSlider(slidertext, min, max, start, inc, callback)
			local dragging = false
			local Slider = Instance.new("Frame")
			local SlideBack = Instance.new("Frame")
			local SlideBackCorner = Instance.new("UICorner")
			local Slide = Instance.new("Frame")
			local SlideCorner = Instance.new("UICorner")
			local SliderText = Instance.new("TextLabel")
			local Value = Instance.new("TextLabel")
			local SliderCorner = Instance.new("UICorner")

			Slider.Name = "Slider"
			Slider.Parent = Page
			Slider.BackgroundColor3 = Color3.fromRGB(18, 22, 29)
			Slider.Size = UDim2.new(1, 0, 0, 40)

			SlideBack.Name = "SlideBack"
			SlideBack.Parent = Slider
			SlideBack.BackgroundColor3 = Color3.fromRGB(15, 19, 26)
			SlideBack.Position = UDim2.new(0.0260000005, 0, 0.699999988, 0)
			SlideBack.Size = UDim2.new(0, 400, 0, 5)

			SlideBackCorner.CornerRadius = UDim.new(0, 4)
			SlideBackCorner.Name = "SlideBackCorner"
			SlideBackCorner.Parent = SlideBack

			Slide.Name = "Slide"
			Slide.Parent = SlideBack
			Slide.BackgroundColor3 = Color3.fromRGB(19, 26, 36)
			Slide.Size = UDim2.new(0, 200, 0, 5)
			Slide.BorderSizePixel = 0

			SlideCorner.CornerRadius = UDim.new(0, 4)
			SlideCorner.Name = "SlideCorner"
			SlideCorner.Parent = Slide

			SliderText.Name = "SliderText"
			SliderText.Parent = Slider
			SliderText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SliderText.BackgroundTransparency = 1.000
			SliderText.Position = UDim2.new(0.0283687934, 0, 0, 0)
			SliderText.Size = UDim2.new(0, 364, 0, 30)
			SliderText.Font = Enum.Font.GothamSemibold
			SliderText.Text = slidertext
			SliderText.TextColor3 = Color3.fromRGB(201, 201, 201)
			SliderText.TextSize = 12.000
			SliderText.TextXAlignment = Enum.TextXAlignment.Left

			Value.Name = "Value"
			Value.Parent = Slider
			Value.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Value.BackgroundTransparency = 1.000
			Value.Position = UDim2.new(0.917257845, 0, 0, 0)
			Value.Size = UDim2.new(0, 26, 0, 30)
			Value.Font = Enum.Font.GothamSemibold
			Value.Text = "50"
			Value.TextColor3 = Color3.fromRGB(201, 201, 201)
			Value.TextSize = 12.000

			SliderCorner.CornerRadius = UDim.new(0, 3)
			SliderCorner.Name = "SliderCorner"
			SliderCorner.Parent = Slider
			
			local function move(Input) --math not be me btw
				local XSize = math.clamp((Input.Position.X - SlideBack.AbsolutePosition.X) / SlideBack.AbsoluteSize.X, 0, 1)
				local Increment = inc and (max / ((max - min) / (inc * 4))) or 
					(max >= 50 and max / ((max - min) / 4)) or 
					(max >= 25 and max / ((max - min) / 2)) or 
					(max / (max - min))

				local SizeRounded = UDim2.new((math.round(XSize * ((max / Increment) * 4)) / ((max / Increment) * 4)), 0, 1, 0)
				Slide:TweenSize(SizeRounded, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, .1, true)

				local Val = math.round((((SizeRounded.X.Scale * max) / max) * (max - min) + min) * 20) / 20
				Value.Text = tostring(Val)
				pcall(callback, tonumber(Val))
			end
			
			SlideBack.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					dragging = true
				end
			end)
			
			SlideBack.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					dragging = false
				end
			end)
			
			game:GetService("UserInputService").InputChanged:Connect(function(input)
				if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
					move(input)
				end
			end)
			
		end
		
		function pages:CreateLabel(labeltext)
			local TextLabel = Instance.new("TextLabel")
			
			TextLabel.Parent = Page
			TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.BackgroundTransparency = 1.000
			TextLabel.Position = UDim2.new(0, 0, 0.595959604, 0)
			TextLabel.Size = UDim2.new(1, 0, 0, 30)
			TextLabel.Font = Enum.Font.GothamSemibold
			TextLabel.Text = labeltext
			TextLabel.TextColor3 = Color3.fromRGB(59, 73, 97)
			TextLabel.TextSize = 14.000
		end
		
		function pages:CreateBind(bindtext, bindpreset, callback)
			local Key1 = bindpreset.Name
			local binding = false
			callback = callback or function()
			end
			local Keybind = Instance.new("TextButton")
			local KeybindCorner = Instance.new("UICorner")
			local KeybindText = Instance.new("TextLabel")
			local Key = Instance.new("TextLabel")
			local KeyCorner = Instance.new("UICorner")
			
			Keybind.Name = "Keybind"
			Keybind.Parent = Page
			Keybind.BackgroundColor3 = Color3.fromRGB(18, 22, 29)
			Keybind.Size = UDim2.new(1, 0, 0, 30)
			Keybind.AutoButtonColor = false
			Keybind.Font = Enum.Font.SourceSans
			Keybind.Text = ""
			Keybind.TextColor3 = Color3.fromRGB(0, 0, 0)
			Keybind.TextSize = 14.000

			KeybindCorner.CornerRadius = UDim.new(0, 3)
			KeybindCorner.Name = "KeybindCorner"
			KeybindCorner.Parent = Keybind

			KeybindText.Name = "KeybindText"
			KeybindText.Parent = Keybind
			KeybindText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			KeybindText.BackgroundTransparency = 1.000
			KeybindText.Position = UDim2.new(0.0283687934, 0, 0, 0)
			KeybindText.Size = UDim2.new(0, 188, 0, 30)
			KeybindText.Font = Enum.Font.GothamSemibold
			KeybindText.Text = bindtext
			KeybindText.TextColor3 = Color3.fromRGB(201, 201, 201)
			KeybindText.TextSize = 12.000
			KeybindText.TextStrokeColor3 = Color3.fromRGB(245, 245, 245)
			KeybindText.TextXAlignment = Enum.TextXAlignment.Left

			Key.Name = "Key"
			Key.Parent = Keybind
			Key.AnchorPoint = Vector2.new(0.5, 0.5)
			Key.BackgroundColor3 = Color3.fromRGB(15, 19, 26)
			Key.Position = UDim2.new(0.936999977, 0, 0.5, 0)
			Key.Size = UDim2.new(0, 40, 0, 20)
			Key.Font = Enum.Font.GothamSemibold
			Key.Text = "E"
			Key.TextColor3 = Color3.fromRGB(201, 201, 201)
			Key.TextSize = 14.000

			KeyCorner.CornerRadius = UDim.new(0, 3)
			KeyCorner.Parent = Key
			
			Keybind.MouseButton1Click:Connect(function()
				Key.Text = ". . .";
				local a, b = game:GetService('UserInputService').InputBegan:wait();
				if a.KeyCode.Name ~= "Unknown" then
					Key.Text = a.KeyCode.Name
					Key1 = a.KeyCode.Name;
				end
			end)
			
			game:GetService("UserInputService").InputBegan:Connect(function(current, ok) 
				if not ok then 
					if current.KeyCode.Name == Key1 then 
						callback(Key1)
					end
				end
			end)
		end

		function pages:CreateDropdown(name, default, options, cb)
			local opened = false
			assert(type(options) == "table", "options must be a table")
			assert(type(cb) == "function", "callback must be a function")
			local f = tostring(name) .. " - %s"
			
			local Dropdown = Instance.new("Frame")
				Dropdown.Active = true
				Dropdown.Name = "Dropdown"
				Dropdown.Parent = Page
				Dropdown.Size = UDim2.new(1, 0, 0, 30)
				Dropdown.BackgroundColor3 = Color3.fromRGB(18, 22, 29)
				Dropdown.BorderSizePixel = 0

			local Name = Instance.new("TextLabel")
				Name.Name = "ToggleButtonText"
				Name.Parent = Dropdown
				Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Name.BackgroundTransparency = 1.000
				Name.Position = UDim2.new(0.0283687934, 0, 0, 0)
				Name.Size = UDim2.new(0, 364, 0, 30)
				Name.Font = Enum.Font.GothamSemibold
				Name.Text = string.format(f, default)
				Name.TextColor3 = Color3.fromRGB(201, 201, 201)
				Name.TextSize = 12.000
				Name.TextXAlignment = Enum.TextXAlignment.Left
				
			Instance.new("UICorner", Dropdown).CornerRadius = UDim.new(0, 3)

			local Arrow = Instance.new("ImageLabel", Dropdown)
				Arrow.AnchorPoint = Vector2.new(0, 0)
				Arrow.BackgroundTransparency = 1
				Arrow.Position = UDim2.new(.95, 0, 0, 5)
				Arrow.Size = UDim2.new(0, 20, 0, 20)
				Arrow.Image = "rbxassetid://6031091004"
				Arrow.ImageColor3 = Color3.fromRGB(34, 42, 56)
				Arrow.ScaleType = Enum.ScaleType.Stretch
				Arrow.SliceScale = 1

			local ChildrenFrame = Instance.new("ScrollingFrame", Dropdown)
				ChildrenFrame.ScrollBarThickness = 2
				ChildrenFrame.BackgroundColor3 = Color3.fromRGB(25, 30, 39)
				ChildrenFrame.BorderSizePixel = 0
				ChildrenFrame.Size = UDim2.new(1, 0, 0, 0)
				ChildrenFrame.Position = UDim2.new(0, 0, 0, 30)
				ChildrenFrame.Visible = false

			local ChildrenListing = Instance.new("UIListLayout")
				ChildrenListing.Name = "PageListing"
				ChildrenListing.Parent = ChildrenFrame
				ChildrenListing.SortOrder = Enum.SortOrder.LayoutOrder
				ChildrenListing.Padding = UDim.new(0, 0)
				
				ChildrenListing:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
					ChildrenFrame.CanvasSize = UDim2.new(0, 0, 0, ChildrenListing.AbsoluteContentSize.Y) 
				end)

			Instance.new("UICorner", Dropdown).CornerRadius = UDim.new(0, 3)

			local debounce = false

			local function toggle()
				if (debounce) then return end

				opened = not opened

				if (not opened) then
					debounce = true
				end
				
				local tween = TweenService:Create(
					Arrow, TweenInfo.new(.5), {
						Rotation = opened and 90 or 0
					}
				)

				TweenService:Create(
					ChildrenFrame,
					TweenInfo.new(.5), {
						Size = UDim2.new(1, 0, 0, opened and 0 or 0)
					}
				):Play()

				TweenService:Create(
					Dropdown,
					TweenInfo.new(.5), {
						Size = UDim2.new(1, 0, 0, opened and 0 or 30)
					}
				):Play()

				tween:Play()
				if (not opened) then
					tween.Completed:Wait()
					debounce = false
				end

				ChildrenFrame.Visible = opened
			end

			Dropdown.InputBegan:Connect(function(inp)
				if (inp.UserInputType == Enum.UserInputType.MouseButton1) then
					toggle()
				end
			end)

			local pressed = false
			for _, opt in next, options do
				local Button = Instance.new("TextButton")
				local ButtonCorner = Instance.new("UICorner")
				local ButtonText = Instance.new("TextLabel")
				
				Button.Name = tostring(#ChildrenFrame:GetChildren())
				Button.Parent = ChildrenFrame
				Button.BackgroundColor3 = Color3.fromRGB(18, 22, 29)
				Button.Size = UDim2.new(1, 0, 0, 30)
				Button.AutoButtonColor = false
				Button.Font = Enum.Font.SourceSans
				Button.Text = ""
				Button.TextColor3 = Color3.fromRGB(0, 0, 0)
				Button.TextSize = 14.000
				Button.MouseButton1Click:Connect(function()
					if (pressed) then return end
					pressed = true
					Name.Text = string.format(f, opt)
					coroutine.wrap(cb)(opt)
					toggle()
					pressed = false
				end)
	
				ButtonCorner.CornerRadius = UDim.new(0, 3)
				ButtonCorner.Name = "ButtonCorner"
				ButtonCorner.Parent = Button
	
				ButtonText.Name = "ButtonText"
				ButtonText.Parent = Button
				ButtonText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ButtonText.BackgroundTransparency = 1.000
				ButtonText.Position = UDim2.new(0.0283687934, 0, 0, 0)
				ButtonText.Size = UDim2.new(0, 364, 0, 30)
				ButtonText.Font = Enum.Font.GothamSemibold
				ButtonText.Text = tostring(opt)
				ButtonText.TextColor3 = Color3.fromRGB(201, 201, 201)
				ButtonText.TextSize = 12.000
				ButtonText.TextXAlignment = Enum.TextXAlignment.Left
			end
		end

		function pages:AddTextbox(name, default, cb)
			assert(type(cb) == "function", "callback must be a function")
			
			local TextBoxFrame = Instance.new("Frame")
				TextBoxFrame.Active = true
				TextBoxFrame.Name = "Dropdown"
				TextBoxFrame.Parent = Page
				TextBoxFrame.Size = UDim2.new(1, 0, 0, 30)
				TextBoxFrame.BackgroundColor3 = Color3.fromRGB(18, 22, 29)
				TextBoxFrame.BorderSizePixel = 0

			local Name = Instance.new("TextLabel")
				Name.Name = "ToggleButtonText"
				Name.Parent = TextBoxFrame
				Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Name.BackgroundTransparency = 1.000
				Name.Position = UDim2.new(0.0283687934, 0, 0, 0)
				Name.Size = UDim2.new(0, 364, 0, 30)
				Name.Font = Enum.Font.GothamSemibold
				Name.Text = name
				Name.TextColor3 = Color3.fromRGB(201, 201, 201)
				Name.TextSize = 12.000
				Name.TextXAlignment = Enum.TextXAlignment.Left
				
			Instance.new("UICorner", TextBoxFrame).CornerRadius = UDim.new(0, 3)

			local TextBox = Instance.new("TextBox", TextBoxFrame)
				TextBox.AnchorPoint = Vector2.new(0, 0)
				TextBox.BackgroundColor3 = Color3.fromRGB(33, 38, 48)
				TextBox.BackgroundTransparency = .5
				TextBox.Position = UDim2.new(.75, 0, 0, 5)
				TextBox.Size = UDim2.new(0, 100, 0, 20)
				TextBox.Text = tostring(default or "")
				TextBox.TextColor3 = Color3.fromRGB(201, 201, 201)

			Instance.new("UICorner", TextBox).CornerRadius = UDim.new(0, 3)

			TextBox.InputBegan:Connect(function(input)
				if (input.KeyCode == Enum.KeyCode.Return) then
					cb(TextBox.Text)
				end
			end)

			TextBox.FocusLost:Connect(function()
				cb(TextBox.Text)
			end)

			return TextBox
		end
		return pages
	end
	return tabs
end
return lib