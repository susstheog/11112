local TweenService = game:GetService("TweenService")
local atween = TweenInfo.new(.2,Enum.EasingStyle.Sine,Enum.EasingDirection.Out)

local lib = {}

local linstance = {}

local UIS = game:GetService("UserInputService")
local dragSpeed = -math.huge

local dragToggle = nil
local dragInput = nil
local dragStart = nil
local dragPos = nil

function dragify(Frame)
	function updateInput(input)
		local Delta = input.Position - dragStart
		local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
		Frame.Position = Position
	end

	Frame.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and UIS:GetFocusedTextBox() == nil then
			dragToggle = true
			dragStart = input.Position
			startPos = Frame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false
				end
			end)
		end
	end)

	Frame.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)

	game:GetService("UserInputService").InputChanged:Connect(function(input)
		if input == dragInput and dragToggle then
			updateInput(input)
		end
	end)
end

local function hoverbtncolor(button,textlabel)
	local tc = textlabel.TextColor3

	button.MouseEnter:Connect(function()
		TweenService:Create(textlabel,atween,{TextColor3=Color3.fromRGB(255, 71, 182)}):Play()
	end)

	button.MouseLeave:Connect(function()
		TweenService:Create(textlabel,atween,{TextColor3=tc}):Play()
	end)
end

local function hoverbtnimgcolor(button,imagelabel)
	local tc = imagelabel.ImageColor3

	button.MouseEnter:Connect(function()
		TweenService:Create(imagelabel,atween,{ImageColor3=Color3.fromRGB(255, 71, 182)}):Play()
	end)

	button.MouseLeave:Connect(function()
		TweenService:Create(imagelabel,atween,{ImageColor3=tc}):Play()
	end)
end

local function textsize(obj)
	local bounds = game:GetService("TextService"):GetTextSize(obj.Text,obj.TextSize,obj.Font,Vector2.new(99999,99999))
	return bounds
end

local function ripplebtn(button,size)
	local size = size or 200
	local Holder = Instance.new("Frame",button)
	Holder.Name = "Holder"
	Holder.AnchorPoint = Vector2.new(0.5, 0.5)
	Holder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Holder.BackgroundTransparency = 1.000
	Holder.Position = UDim2.new(0.5, 0, 0.5, 0)
	Holder.Size = UDim2.new(1, 0, 1, 0)
	Holder.ClipsDescendants = true

	button.MouseButton1Down:Connect(function(x,y)
		local x,y = x-Holder.AbsolutePosition.X,y-Holder.AbsolutePosition.Y-Holder.AbsoluteSize.Y
		local Ripple = Instance.new("Frame",Holder)
		local UICorner = Instance.new("UICorner")
		Ripple.Name = "Ripple"
		Ripple.AnchorPoint = Vector2.new(0.5, 0.5)
		Ripple.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Ripple.BackgroundTransparency = 0.500
		Ripple.Position = UDim2.fromOffset(x,y)
		UICorner.CornerRadius = UDim.new(1, 0)
		UICorner.Parent = Ripple

		local sec = .5

		TweenService:Create(Ripple,TweenInfo.new(unpack({
			sec,
			Enum.EasingStyle.Sine,
			Enum.EasingDirection.Out
		})),{BackgroundTransparency=1,Size=UDim2.new(0,size,0,size)}):Play()

		game:GetService("Debris"):AddItem(Ripple,sec)
	end)
end

linstance.create = function(self,name,props)
	name = name:lower()
	if name == "gui" then
		-- Gui to Lua
		-- Version: 3.2

		-- Instances:

		local ScreenGui = Instance.new("ScreenGui")
		local Frame = Instance.new("Frame")
		local sidebar = Instance.new("Frame")
		local header = Instance.new("ImageLabel")
		local UIListLayout = Instance.new("UIListLayout")
		local TextLabel = Instance.new("TextLabel")
		local TextLabel_2 = Instance.new("TextLabel")
		local ScrollingFrame = Instance.new("ScrollingFrame")
		local UIListLayout_2 = Instance.new("UIListLayout")
		local body = Instance.new("Frame")
		local pagecontainer = Instance.new("Frame")
		local UIPadding = Instance.new("UIPadding")
		local UICorner = Instance.new("UICorner")

		--Properties:

		ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
		ScreenGui.ResetOnSpawn = false

		Frame.Parent = ScreenGui
		Frame.BackgroundColor3 = Color3.fromRGB(11, 11, 11)
		Frame.BorderSizePixel = 0
		Frame.Position = UDim2.new(0.236220479, 0, 0.229244113, 0)
		Frame.Size = UDim2.new(0, 530, 0, 330)

		dragify(Frame)

		sidebar.Name = "sidebar"
		sidebar.Parent = Frame
		sidebar.AnchorPoint = Vector2.new(0, 0.5)
		sidebar.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
		sidebar.BorderSizePixel = 0
		sidebar.Position = UDim2.new(0, 0, 0.5, 0)
		sidebar.Size = UDim2.new(0, 140, 1, 0)

		header.Name = "header"
		header.Parent = sidebar
		header.AnchorPoint = Vector2.new(0.5, 0)
		header.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		header.BorderSizePixel = 0
		header.Position = UDim2.new(0.5, 0, 0, 0)
		header.Size = UDim2.new(1, 0, 0, 100)
		header.Image = "http://www.roblox.com/asset/?id=9423924419"
		header.ScaleType = Enum.ScaleType.Crop

		UIListLayout.Parent = header
		UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
		UIListLayout.Padding = UDim.new(0, 14)

		TextLabel.Parent = header
		TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.BackgroundTransparency = 1.000
		TextLabel.Font = Enum.Font.Gotham
		TextLabel.Text = "heartx<b>hub</b>"
		TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.TextSize = 16.000
		TextLabel.RichText = true

		TextLabel_2.Parent = header
		TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel_2.BackgroundTransparency = 1.000
		TextLabel_2.Font = Enum.Font.SourceSansItalic
		TextLabel_2.Text = "Synapse X"
		TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel_2.TextSize = 13.000

		ScrollingFrame.Parent = sidebar
		ScrollingFrame.AnchorPoint = Vector2.new(0, 1)
		ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ScrollingFrame.BackgroundTransparency = 1.000
		ScrollingFrame.BorderSizePixel = 0
		ScrollingFrame.Position = UDim2.new(0, 0, 1, 0)
		ScrollingFrame.Size = UDim2.new(1, 0, 1, -100)
		ScrollingFrame.BottomImage = "rbxassetid://9414462019"
		ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
		ScrollingFrame.MidImage = "rbxassetid://9414462019"
		ScrollingFrame.ScrollBarThickness = 4
		ScrollingFrame.TopImage = "rbxassetid://9414462019"
		ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
		ScrollingFrame.ScrollBarImageTransparency = 0.9

		UIListLayout_2.Parent = ScrollingFrame
		UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder

		body.Name = "body"
		body.Parent = Frame
		body.AnchorPoint = Vector2.new(1, 0)
		body.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		body.BackgroundTransparency = 1.000
		body.BorderColor3 = Color3.fromRGB(27, 42, 53)
		body.Position = UDim2.new(1, 0, 0, 0)
		body.Size = UDim2.new(1, -140, 1, 0)

		pagecontainer.Name = "pagecontainer"
		pagecontainer.Parent = body
		pagecontainer.AnchorPoint = Vector2.new(0.5, 0.5)
		pagecontainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		pagecontainer.BackgroundTransparency = 1.000
		pagecontainer.Position = UDim2.new(0.5, 0, 0.5, 0)
		pagecontainer.Size = UDim2.new(1, 0, 1, 0)
		pagecontainer.ClipsDescendants = true

		UIPadding.Parent = pagecontainer
		UIPadding.PaddingBottom = UDim.new(0, 8)
		UIPadding.PaddingLeft = UDim.new(0, 8)
		UIPadding.PaddingRight = UDim.new(0, 8)
		UIPadding.PaddingTop = UDim.new(0, 8)

		UICorner.CornerRadius = UDim.new(0, 12)
		UICorner.Parent = Frame

		-- Scripts:

		local function HTUYPL_fake_script() -- TextLabel_2.LocalScript 
			local script = Instance.new('LocalScript', TextLabel_2)

			local function getexploit()
				local exploit =
					(syn and not is_sirhurt_closure and not pebc_execute and "Synapse X") or
					(secure_load and "Sentinel") or
					(is_sirhurt_closure and "Sirhurt") or
					(pebc_execute and "ProtoSmasher") or
					(KRNL_LOADED and "Krnl") or
					(WrapGlobal and "WeAreDevs") or
					(isvm and "Proxo") or
					(shadow_env and "Shadow") or
					(jit and "EasyExploits") or
					(getscriptenvs and "Calamari") or
					(unit and not syn and "Unit") or
					(OXYGEN_LOADED and "Oxygen U") or
					(IsElectron and "Electron") or
					("Unknown Executor")

				return exploit
			end

			script.Parent.Text = getexploit()
		end
		coroutine.wrap(HTUYPL_fake_script)()

		-- Gui to Lua
		-- Version: 3.2

		-- Instances:

		local darken = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")

		--Properties:

		darken.Name = "darken"
		darken.Parent = body
		darken.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		darken.BackgroundTransparency = 1 -- 0.5
		darken.BorderSizePixel = 0
		darken.ClipsDescendants = true
		darken.Size = UDim2.new(1, 0, 1, 0)
		darken.ZIndex = 20

		UICorner.CornerRadius = UDim.new(0, 12)
		UICorner.Parent = darken
		
		local mainframe = Frame
		mainframe.Visible = false
		
		-- Gui to Lua
		-- Version: 3.2

		-- Instances:

		local loader = Instance.new("ImageLabel")
		local ImageLabel = Instance.new("ImageLabel")
		local UICorner = Instance.new("UICorner")
		local Frame = Instance.new("Frame")
		local UICorner_2 = Instance.new("UICorner")
		local Frame_2 = Instance.new("Frame")
		local UICorner_3 = Instance.new("UICorner")
		local UIGradient = Instance.new("UIGradient")

		--Properties:

		loader.Name = "loader"
		loader.Parent = ScreenGui
		loader.AnchorPoint = Vector2.new(0.5, 0.5)
		loader.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		loader.Position = UDim2.new(0.5, 0, 0.5, 0)
		loader.Size = UDim2.new(0, 160, 0, 160)
		loader.Image = "http://www.roblox.com/asset/?id=9423924419"

		ImageLabel.Parent = loader
		ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
		ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ImageLabel.BackgroundTransparency = 1.000
		ImageLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
		ImageLabel.Size = UDim2.new(1, 0, 1, 0)
		ImageLabel.Image = "rbxassetid://9439188705"

		UICorner.CornerRadius = UDim.new(1, 0)
		UICorner.Parent = loader

		Frame.Parent = loader
		Frame.AnchorPoint = Vector2.new(0.5, 0.5)
		Frame.BackgroundColor3 = Color3.fromRGB(177, 177, 177)
		Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
		Frame.Size = UDim2.new(1, 8, 1, 8)
		Frame.ZIndex = 0

		UICorner_2.CornerRadius = UDim.new(1, 0)
		UICorner_2.Parent = Frame

		Frame_2.Parent = Frame
		Frame_2.AnchorPoint = Vector2.new(0.5, 0.5)
		Frame_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Frame_2.Position = UDim2.new(0.5, 0, 0.5, 0)
		Frame_2.Size = UDim2.new(1, 0, 1, 0)
		Frame_2.ZIndex = 0

		UICorner_3.CornerRadius = UDim.new(1, 0)
		UICorner_3.Parent = Frame_2

		UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 1.00), NumberSequenceKeypoint.new(0.50, 0.00), NumberSequenceKeypoint.new(1.00, 1.00)}
		UIGradient.Parent = Frame_2

		-- Scripts:

		local function COCK_fake_script() -- UIGradient.LocalScript 
			local script = Instance.new('LocalScript', UIGradient)


			game:GetService("RunService").Heartbeat:Connect(function()
				script.Parent.Rotation = script.Parent.Rotation + 6
			end)
		end
		coroutine.wrap(COCK_fake_script)()
		
		loader.Size = UDim2.fromOffset(0,0)
		
		local loadertween = TweenInfo.new(1,Enum.EasingStyle.Back,Enum.EasingDirection.Out)
		local loadertween2 = TweenInfo.new(1,Enum.EasingStyle.Back,Enum.EasingDirection.In)
		
		TweenService:Create(loader,loadertween,{Size=UDim2.fromOffset(160,160)}):Play()
		
		wait(2)
		
		TweenService:Create(loader,loadertween2,{Size=UDim2.fromOffset(0,0)}):Play()
		
		wait(1)
		
		loader.Visible = false
		
		wait(1)
		
		local mfsize = mainframe.Size
		local mfabssize = mainframe.AbsoluteSize
		
		mainframe.Position = UDim2.new(0.5,-mfabssize.X/2,0.5,-mfabssize.Y/2)
		
		mainframe.Size = UDim2.fromOffset(0,0)
		mainframe.Visible = true
		
		TweenService:Create(mainframe,loadertween,{Size=mfsize}):Play()
		


		return ScreenGui,mfsize,mfabssize
	elseif name == "tbutton" then
		-- Gui to Lua
		-- Version: 3.2

		-- Instances:

		local pagebutton = Instance.new("Frame")
		local Frame = Instance.new("Frame")
		local TextLabel = Instance.new("TextLabel")
		local UIPadding = Instance.new("UIPadding")
		local Button = Instance.new("TextButton")

		--Properties:

		pagebutton.Name = "pagebutton"
		pagebutton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		pagebutton.BackgroundTransparency = 1.000
		pagebutton.Size = UDim2.new(1, 0, 0, 34)

		Frame.Parent = pagebutton
		Frame.AnchorPoint = Vector2.new(0.5, 0.5)
		Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Frame.BackgroundTransparency = 1.000
		Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
		Frame.Size = UDim2.new(1, 0, 1, 0)

		TextLabel.Parent = Frame
		TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.BackgroundTransparency = 1.000
		TextLabel.Size = UDim2.new(1, 0, 1, 0)
		TextLabel.Font = Enum.Font.Gotham
		TextLabel.Text = "Settings"
		TextLabel.TextColor3 = Color3.fromRGB(216, 216, 216)
		TextLabel.TextSize = 12.000
		TextLabel.TextXAlignment = Enum.TextXAlignment.Left

		UIPadding.Parent = Frame
		UIPadding.PaddingLeft = UDim.new(0, 12)

		Button.Name = "Button"
		Button.Parent = pagebutton
		Button.AnchorPoint = Vector2.new(0.5, 0.5)
		Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Button.BackgroundTransparency = 1.000
		Button.Position = UDim2.new(0.5, 0, 0.5, 0)
		Button.Size = UDim2.new(1, 0, 1, 0)
		Button.Font = Enum.Font.SourceSans
		Button.TextColor3 = Color3.fromRGB(0, 0, 0)
		Button.TextSize = 14.000
		Button.TextTransparency = 1.000

		ripplebtn(Button)

		Button.MouseEnter:Connect(function()
			TweenService:Create(pagebutton,atween,{Size=UDim2.new(1, 0, 0, 40)}):Play()
			TweenService:Create(TextLabel,atween,{TextSize=16}):Play()
		end)

		Button.MouseLeave:Connect(function()
			TweenService:Create(pagebutton,atween,{Size=UDim2.new(1, 0, 0, 34)}):Play()
			TweenService:Create(TextLabel,atween,{TextSize=12}):Play()
		end)

		return pagebutton
	elseif name == "page" then
		-- Gui to Lua
		-- Version: 3.2

		-- Instances:

		local page = Instance.new("Frame")
		local ScrollingFrame = Instance.new("ScrollingFrame")
		local UIListLayout = Instance.new("UIListLayout")

		--Properties:

		page.Name = "page"
		page.AnchorPoint = Vector2.new(0.5, 0.5)
		page.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		page.BackgroundTransparency = 1.000
		page.Position = UDim2.new(0.5, 0, 0.5, 0)
		page.Size = UDim2.new(1, 0, 1, 0)

		ScrollingFrame.Parent = page
		ScrollingFrame.AnchorPoint = Vector2.new(0.5, 0.5)
		ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ScrollingFrame.BackgroundTransparency = 1.000
		ScrollingFrame.BorderSizePixel = 0
		ScrollingFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
		ScrollingFrame.Size = UDim2.new(1, 0, 1, 0)
		ScrollingFrame.BottomImage = "rbxassetid://9414462019"
		ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
		ScrollingFrame.MidImage = "rbxassetid://9414462019"
		ScrollingFrame.ScrollBarThickness = 4
		ScrollingFrame.TopImage = "rbxassetid://9414462019"
		ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
		ScrollingFrame.ScrollBarImageTransparency = 0.9

		UIListLayout.Parent = ScrollingFrame
		UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout.Padding = UDim.new(0, 4)

		return page
	elseif name == "button" then
		-- Gui to Lua
		-- Version: 3.2

		-- Instances:

		local button = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local Frame = Instance.new("Frame")
		local Frame_2 = Instance.new("Frame")
		local UIPadding = Instance.new("UIPadding")
		local TextLabel = Instance.new("TextLabel")
		local TextButton = Instance.new("TextButton")
		local other = Instance.new("Frame")
		local Frame_3 = Instance.new("Frame")
		local UIPadding_2 = Instance.new("UIPadding")
		local Icon = Instance.new("ImageLabel")
		local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")

		--Properties:

		button.Name = "button"
		button.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
		button.Size = UDim2.new(1, 0, 0, 34)

		UICorner.Parent = button

		Frame.Parent = button
		Frame.AnchorPoint = Vector2.new(0, 0.5)
		Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Frame.BackgroundTransparency = 1.000
		Frame.Position = UDim2.new(0, 0, 0.5, 0)
		Frame.Size = UDim2.new(1, -34, 1, 0)

		Frame_2.Parent = Frame
		Frame_2.AnchorPoint = Vector2.new(0.5, 0.5)
		Frame_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Frame_2.BackgroundTransparency = 1.000
		Frame_2.Position = UDim2.new(0.5, 0, 0.5, 0)
		Frame_2.Size = UDim2.new(1, 0, 1, 0)

		UIPadding.Parent = Frame_2
		UIPadding.PaddingLeft = UDim.new(0, 14)

		TextLabel.Parent = Frame_2
		TextLabel.AnchorPoint = Vector2.new(0, 0.5)
		TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.BackgroundTransparency = 1.000
		TextLabel.Position = UDim2.new(0, 0, 0.5, 0)
		TextLabel.Size = UDim2.new(1, 0, 1, 0)
		TextLabel.Font = Enum.Font.Gotham
		TextLabel.Text = "button"
		TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.TextSize = 12.000
		TextLabel.TextXAlignment = Enum.TextXAlignment.Left

		TextButton.Parent = Frame
		TextButton.AnchorPoint = Vector2.new(0.5, 0.5)
		TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextButton.BackgroundTransparency = 1.000
		TextButton.Position = UDim2.new(0.5, 0, 0.5, 0)
		TextButton.Size = UDim2.new(1, 0, 1, 0)
		TextButton.Font = Enum.Font.SourceSans
		TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
		TextButton.TextSize = 14.000
		TextButton.TextTransparency = 1.000

		other.Name = "other"
		other.Parent = button
		other.AnchorPoint = Vector2.new(1, 0.5)
		other.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		other.BackgroundTransparency = 1.000
		other.Position = UDim2.new(1, 0, 0.5, 0)
		other.Size = UDim2.new(0, 34, 0, 34)

		Frame_3.Parent = other
		Frame_3.AnchorPoint = Vector2.new(0.5, 0.5)
		Frame_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Frame_3.BackgroundTransparency = 1.000
		Frame_3.Position = UDim2.new(0.5, 0, 0.5, 0)
		Frame_3.Size = UDim2.new(1, 0, 1, 0)

		UIPadding_2.Parent = Frame_3
		UIPadding_2.PaddingBottom = UDim.new(0, 8)
		UIPadding_2.PaddingLeft = UDim.new(0, 8)
		UIPadding_2.PaddingRight = UDim.new(0, 8)
		UIPadding_2.PaddingTop = UDim.new(0, 8)

		Icon.Name = "Icon"
		Icon.Parent = Frame_3
		Icon.AnchorPoint = Vector2.new(0.5, 0.5)
		Icon.BackgroundTransparency = 1.000
		Icon.Position = UDim2.new(0.5, 0, 0.5, 0)
		Icon.Size = UDim2.new(1, 0, 1, 0)
		Icon.Image = "rbxassetid://7733964719"
		Icon.ImageColor3 = Color3.fromRGB(122, 122, 122)

		UIAspectRatioConstraint.Parent = Icon

		if props.title and props.desc then
			local TextButton = Instance.new("TextButton")

			--Properties:

			TextButton.Parent = other
			TextButton.AnchorPoint = Vector2.new(0.5, 0.5)
			TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextButton.BackgroundTransparency = 1.000
			TextButton.Position = UDim2.new(0.5, 0, 0.5, 0)
			TextButton.Size = UDim2.new(1, 0, 1, 0)
			TextButton.Font = Enum.Font.SourceSans
			TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
			TextButton.TextSize = 14.000
			TextButton.TextTransparency = 1.000

			ripplebtn(TextButton,20)
			hoverbtnimgcolor(TextButton,Icon)

			if props.glib then
				TextButton.MouseButton1Down:Connect(function()
					props.glib:notif(props.title,props.desc)
				end)
			end
		else
			Icon.ImageTransparency = 0.6
		end

		ripplebtn(TextButton)
		hoverbtncolor(TextButton,TextLabel)

		return button
	elseif name == "hlabel" then
		-- Gui to Lua
		-- Version: 3.2

		-- Instances:

		local headerlabel = Instance.new("Frame")
		local TextLabel = Instance.new("TextLabel")
		local UIPadding = Instance.new("UIPadding")

		--Properties:

		headerlabel.Name = "headerlabel"
		headerlabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		headerlabel.BackgroundTransparency = 1.000
		headerlabel.Size = UDim2.new(1, 0, 0, 40)

		TextLabel.Parent = headerlabel
		TextLabel.AnchorPoint = Vector2.new(0, 0.5)
		TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.BackgroundTransparency = 1.000
		TextLabel.Position = UDim2.new(0, 0, 0.5, 0)
		TextLabel.Size = UDim2.new(1, 0, 1, 0)
		TextLabel.Font = Enum.Font.Gotham
		TextLabel.Text = (props.title or "TEXT"):upper()
		TextLabel.TextColor3 = Color3.fromRGB(70, 70, 70)
		TextLabel.TextSize = 12.000
		TextLabel.TextXAlignment = Enum.TextXAlignment.Left

		UIPadding.Parent = headerlabel
		UIPadding.PaddingLeft = UDim.new(0, 14)

		return headerlabel
	elseif name == "checkbox" then
		-- Gui to Lua
		-- Version: 3.2

		-- Instances:

		local checkbox = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local Frame = Instance.new("Frame")
		local Frame_2 = Instance.new("Frame")
		local UIPadding = Instance.new("UIPadding")
		local TextLabel = Instance.new("TextLabel")
		local other = Instance.new("Frame")
		local Frame_3 = Instance.new("Frame")
		local UIPadding_2 = Instance.new("UIPadding")
		local Icon = Instance.new("ImageLabel")
		local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
		local checkbox_2 = Instance.new("Frame")
		local Frame_4 = Instance.new("Frame")
		local UIPadding_3 = Instance.new("UIPadding")
		local Icon_2 = Instance.new("ImageLabel")
		local UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")
		local TextButton = Instance.new("TextButton")

		--Properties:

		checkbox.Name = "checkbox"
		checkbox.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
		checkbox.Size = UDim2.new(1, 0, 0, 34)

		UICorner.Parent = checkbox

		Frame.Parent = checkbox
		Frame.AnchorPoint = Vector2.new(0.5, 0.5)
		Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Frame.BackgroundTransparency = 1.000
		Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
		Frame.Size = UDim2.new(1, -68, 1, 0)

		Frame_2.Parent = Frame
		Frame_2.AnchorPoint = Vector2.new(0.5, 0.5)
		Frame_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Frame_2.BackgroundTransparency = 1.000
		Frame_2.Position = UDim2.new(0.5, 0, 0.5, 0)
		Frame_2.Size = UDim2.new(1, 0, 1, 0)

		UIPadding.Parent = Frame_2

		TextLabel.Parent = Frame_2
		TextLabel.AnchorPoint = Vector2.new(0, 0.5)
		TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.BackgroundTransparency = 1.000
		TextLabel.Position = UDim2.new(0, 0, 0.5, 0)
		TextLabel.Size = UDim2.new(1, 0, 1, 0)
		TextLabel.Font = Enum.Font.Gotham
		TextLabel.Text = props.title or "Checkbox"
		TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.TextSize = 12.000
		TextLabel.TextXAlignment = Enum.TextXAlignment.Left
		TextLabel.LineHeight = .9

		other.Name = "other"
		other.Parent = checkbox
		other.AnchorPoint = Vector2.new(1, 0.5)
		other.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		other.BackgroundTransparency = 1.000
		other.Position = UDim2.new(1, 0, 0.5, 0)
		other.Size = UDim2.new(0, 34, 0, 34)

		Frame_3.Parent = other
		Frame_3.AnchorPoint = Vector2.new(0.5, 0.5)
		Frame_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Frame_3.BackgroundTransparency = 1.000
		Frame_3.Position = UDim2.new(0.5, 0, 0.5, 0)
		Frame_3.Size = UDim2.new(1, 0, 1, 0)

		UIPadding_2.Parent = Frame_3
		UIPadding_2.PaddingBottom = UDim.new(0, 8)
		UIPadding_2.PaddingLeft = UDim.new(0, 8)
		UIPadding_2.PaddingRight = UDim.new(0, 8)
		UIPadding_2.PaddingTop = UDim.new(0, 8)

		Icon.Name = "Icon"
		Icon.Parent = Frame_3
		Icon.AnchorPoint = Vector2.new(0.5, 0.5)
		Icon.BackgroundTransparency = 1.000
		Icon.Position = UDim2.new(0.5, 0, 0.5, 0)
		Icon.Size = UDim2.new(1, 0, 1, 0)
		Icon.Image = "rbxassetid://7733964719"
		Icon.ImageColor3 = Color3.fromRGB(122, 122, 122)

		UIAspectRatioConstraint.Parent = Icon

		checkbox_2.Name = "checkbox"
		checkbox_2.Parent = checkbox
		checkbox_2.AnchorPoint = Vector2.new(0, 0.5)
		checkbox_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		checkbox_2.BackgroundTransparency = 1.000
		checkbox_2.Position = UDim2.new(0, 0, 0.5, 0)
		checkbox_2.Size = UDim2.new(0, 34, 0, 34)

		Frame_4.Parent = checkbox_2
		Frame_4.AnchorPoint = Vector2.new(0.5, 0.5)
		Frame_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Frame_4.BackgroundTransparency = 1.000
		Frame_4.Position = UDim2.new(0.5, 0, 0.5, 0)
		Frame_4.Size = UDim2.new(1, 0, 1, 0)

		UIPadding_3.Parent = Frame_4
		UIPadding_3.PaddingBottom = UDim.new(0, 10)
		UIPadding_3.PaddingLeft = UDim.new(0, 10)
		UIPadding_3.PaddingRight = UDim.new(0, 10)
		UIPadding_3.PaddingTop = UDim.new(0, 10)

		Icon_2.Name = "Icon"
		Icon_2.Parent = Frame_4
		Icon_2.AnchorPoint = Vector2.new(0.5, 0.5)
		Icon_2.BackgroundTransparency = 1.000
		Icon_2.Position = UDim2.new(0.5, 0, 0.5, 0)
		Icon_2.Size = UDim2.new(1, 0, 1, 0)
		Icon_2.Image = "rbxassetid://7743872181"

		UIAspectRatioConstraint_2.Parent = Icon_2

		TextButton.Parent = checkbox_2
		TextButton.AnchorPoint = Vector2.new(0.5, 0.5)
		TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextButton.BackgroundTransparency = 1.000
		TextButton.Position = UDim2.new(0.5, 0, 0.5, 0)
		TextButton.Size = UDim2.new(1, 0, 1, 0)
		TextButton.Font = Enum.Font.SourceSans
		TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
		TextButton.TextSize = 14.000
		TextButton.TextTransparency = 1.000

		local cover = Instance.new("ImageLabel",checkbox_2)
		cover.Name = "cover"
		cover.AnchorPoint = Vector2.new(0.5, 0.5)
		cover.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		cover.BackgroundTransparency = 1.000
		cover.Position = UDim2.new(0.5, 0, 0.5, 0)
		cover.Size = UDim2.new(0, 10, 0, 10)
		cover.Image = "rbxassetid://9414462019"
		cover.ImageTransparency = 1

		if props.title and props.desc then
			local TextButton = Instance.new("TextButton")

			--Properties:

			TextButton.Parent = Frame_3
			TextButton.AnchorPoint = Vector2.new(0.5, 0.5)
			TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextButton.BackgroundTransparency = 1.000
			TextButton.Position = UDim2.new(0.5, 0, 0.5, 0)
			TextButton.Size = UDim2.new(1, 0, 1, 0)
			TextButton.Font = Enum.Font.SourceSans
			TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
			TextButton.TextSize = 14.000
			TextButton.TextTransparency = 1.000

			ripplebtn(TextButton,20)
			hoverbtnimgcolor(TextButton,Icon)

			if props.glib then
				TextButton.MouseButton1Down:Connect(function()
					props.glib:notif(props.title,props.desc)
				end)
			end
		else
			Icon.ImageTransparency = 0.6
		end

		ripplebtn(TextButton,20)
		hoverbtnimgcolor(TextButton,Icon_2)
		hoverbtnimgcolor(TextButton,cover)

		return checkbox,cover
	elseif name == "slider" then
		-- Gui to Lua
		-- Version: 3.2

		-- Instances:

		local slider = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local Frame = Instance.new("Frame")
		local Frame_2 = Instance.new("Frame")
		local UIPadding = Instance.new("UIPadding")
		local TextLabel = Instance.new("TextLabel")
		local slide = Instance.new("Frame")
		local Frame_3 = Instance.new("Frame")
		local UICorner_2 = Instance.new("UICorner")
		local TextLabel_2 = Instance.new("TextLabel")
		local slide_2 = Instance.new("Frame")
		local UICorner_3 = Instance.new("UICorner")
		local UIPadding_2 = Instance.new("UIPadding")
		local TextButton = Instance.new("TextButton")
		local other = Instance.new("Frame")
		local Frame_4 = Instance.new("Frame")
		local UIPadding_3 = Instance.new("UIPadding")
		local Icon = Instance.new("ImageLabel")
		local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")

		--Properties:

		slider.Name = "slider"
		slider.Parent = game.ServerStorage
		slider.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
		slider.Size = UDim2.new(1, 0, 0, 40)

		UICorner.Parent = slider

		Frame.Parent = slider
		Frame.AnchorPoint = Vector2.new(0, 0.5)
		Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Frame.BackgroundTransparency = 1.000
		Frame.Position = UDim2.new(0, 0, 0.5, 0)
		Frame.Size = UDim2.new(1, -34, 1, 0)

		Frame_2.Parent = Frame
		Frame_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Frame_2.BackgroundTransparency = 1.000
		Frame_2.Size = UDim2.new(1, 0, 0.400000006, 0)

		UIPadding.Parent = Frame_2
		UIPadding.PaddingLeft = UDim.new(0, 14)
		UIPadding.PaddingRight = UDim.new(0, 4)
		UIPadding.PaddingTop = UDim.new(0, 4)

		TextLabel.Parent = Frame_2
		TextLabel.AnchorPoint = Vector2.new(0, 0.5)
		TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.BackgroundTransparency = 1.000
		TextLabel.Position = UDim2.new(0, 0, 0.5, 0)
		TextLabel.Size = UDim2.new(1, 0, 1, 0)
		TextLabel.Font = Enum.Font.Gotham
		TextLabel.Text = props.title or "Slider"
		TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.TextSize = 10.000
		TextLabel.TextXAlignment = Enum.TextXAlignment.Left

		slide.Name = "slide"
		slide.Parent = Frame
		slide.AnchorPoint = Vector2.new(0, 1)
		slide.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		slide.BackgroundTransparency = 1.000
		slide.Position = UDim2.new(0, 0, 1, 0)
		slide.Size = UDim2.new(1, 0, 0.600000024, 0)

		Frame_3.Parent = slide
		Frame_3.AnchorPoint = Vector2.new(0.5, 0.5)
		Frame_3.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
		Frame_3.Position = UDim2.new(0.5, 0, 0.5, 0)
		Frame_3.Size = UDim2.new(1, 0, 1, 0)

		UICorner_2.Parent = Frame_3

		TextLabel_2.Parent = Frame_3
		TextLabel_2.AnchorPoint = Vector2.new(0.5, 0.5)
		TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel_2.BackgroundTransparency = 1.000
		TextLabel_2.Position = UDim2.new(0.5, 0, 0.5, 0)
		TextLabel_2.Size = UDim2.new(1, 0, 1, 0)
		TextLabel_2.ZIndex = 2
		TextLabel_2.Font = Enum.Font.Gotham
		TextLabel_2.Text = props.default or "0"
		TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel_2.TextSize = 12.000

		slide_2.Name = "slide"
		slide_2.Parent = Frame_3
		slide_2.AnchorPoint = Vector2.new(0, 0.5)
		slide_2.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
		slide_2.Position = UDim2.new(0, 0, 0.5, 0)
		slide_2.Size = UDim2.new(0.200000003, 0, 1, 0)

		UICorner_3.Parent = slide_2

		UIPadding_2.Parent = slide
		UIPadding_2.PaddingBottom = UDim.new(0, 4)
		UIPadding_2.PaddingLeft = UDim.new(0, 4)
		UIPadding_2.PaddingRight = UDim.new(0, 4)
		UIPadding_2.PaddingTop = UDim.new(0, 4)

		TextButton.Parent = slide
		TextButton.AnchorPoint = Vector2.new(0.5, 0.5)
		TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextButton.BackgroundTransparency = 1.000
		TextButton.Position = UDim2.new(0.5, 0, 0.5, 0)
		TextButton.Size = UDim2.new(1, 0, 1, 0)
		TextButton.Font = Enum.Font.SourceSans
		TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
		TextButton.TextSize = 14.000
		TextButton.TextTransparency = 1.000

		other.Name = "other"
		other.Parent = slider
		other.AnchorPoint = Vector2.new(1, 0.5)
		other.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		other.BackgroundTransparency = 1.000
		other.Position = UDim2.new(1, 0, 0.5, 0)
		other.Size = UDim2.new(0, 34, 0, 34)

		Frame_4.Parent = other
		Frame_4.AnchorPoint = Vector2.new(0.5, 0.5)
		Frame_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Frame_4.BackgroundTransparency = 1.000
		Frame_4.Position = UDim2.new(0.5, 0, 0.5, 0)
		Frame_4.Size = UDim2.new(1, 0, 1, 0)

		UIPadding_3.Parent = Frame_4
		UIPadding_3.PaddingBottom = UDim.new(0, 8)
		UIPadding_3.PaddingLeft = UDim.new(0, 8)
		UIPadding_3.PaddingRight = UDim.new(0, 8)
		UIPadding_3.PaddingTop = UDim.new(0, 8)

		Icon.Name = "Icon"
		Icon.Parent = Frame_4
		Icon.AnchorPoint = Vector2.new(0.5, 0.5)
		Icon.BackgroundTransparency = 1.000
		Icon.Position = UDim2.new(0.5, 0, 0.5, 0)
		Icon.Size = UDim2.new(1, 0, 1, 0)
		Icon.Image = "rbxassetid://7733964719"
		Icon.ImageColor3 = Color3.fromRGB(122, 122, 122)

		if props.title and props.desc then
			local TextButton = Instance.new("TextButton")

			--Properties:

			TextButton.Parent = Frame_4
			TextButton.AnchorPoint = Vector2.new(0.5, 0.5)
			TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextButton.BackgroundTransparency = 1.000
			TextButton.Position = UDim2.new(0.5, 0, 0.5, 0)
			TextButton.Size = UDim2.new(1, 0, 1, 0)
			TextButton.Font = Enum.Font.SourceSans
			TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
			TextButton.TextSize = 14.000
			TextButton.TextTransparency = 1.000

			ripplebtn(TextButton,20)
			hoverbtnimgcolor(TextButton,Icon)

			if props.glib then
				TextButton.MouseButton1Down:Connect(function()
					props.glib:notif(props.title,props.desc)
				end)
			end
		else
			Icon.ImageTransparency = 0.6
		end

		UIAspectRatioConstraint.Parent = Icon

		return slider
	elseif name == "notification" then
		-- Gui to Lua
		-- Version: 3.2

		-- Instances:

		local notif = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local header = Instance.new("Frame")
		local left = Instance.new("Frame")
		local Frame = Instance.new("Frame")
		local UIPadding = Instance.new("UIPadding")
		local TextLabel = Instance.new("TextLabel")
		local right = Instance.new("Frame")
		local Frame_2 = Instance.new("Frame")
		local Icon = Instance.new("ImageLabel")
		local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
		local UIPadding_2 = Instance.new("UIPadding")
		local body = Instance.new("Frame")
		local Frame_3 = Instance.new("Frame")
		local UIPadding_3 = Instance.new("UIPadding")
		local TextLabel_2 = Instance.new("TextLabel")

		--Properties:

		notif.Name = "notif"
		notif.AnchorPoint = Vector2.new(0.5, 0.5)
		notif.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
		notif.BorderSizePixel = 0
		notif.Position = UDim2.new(0.5, 0, 0.5, 0)
		notif.Size = UDim2.new(0, 340, 0, 172)
		notif.ZIndex = 21

		UICorner.Parent = notif

		header.Name = "header"
		header.Parent = notif
		header.AnchorPoint = Vector2.new(0.5, 0)
		header.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		header.BackgroundTransparency = 1.000
		header.Position = UDim2.new(0.5, 0, 0, 0)
		header.Size = UDim2.new(1, 0, 0, 30)
		header.ZIndex = 21

		left.Name = "left"
		left.Parent = header
		left.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		left.BackgroundTransparency = 1.000
		left.Size = UDim2.new(1, -30, 1, 0)
		left.ZIndex = 21

		Frame.Parent = left
		Frame.AnchorPoint = Vector2.new(0.5, 0.5)
		Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Frame.BackgroundTransparency = 1.000
		Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
		Frame.Size = UDim2.new(1, 0, 1, 0)
		Frame.ZIndex = 21

		UIPadding.Parent = Frame
		UIPadding.PaddingBottom = UDim.new(0, 6)
		UIPadding.PaddingLeft = UDim.new(0, 14)
		UIPadding.PaddingRight = UDim.new(0, 6)
		UIPadding.PaddingTop = UDim.new(0, 6)

		TextLabel.Parent = Frame
		TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
		TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.BackgroundTransparency = 1.000
		TextLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
		TextLabel.Size = UDim2.new(1, 0, 1, 0)
		TextLabel.Font = Enum.Font.Gotham
		TextLabel.Text = props.title or "notification"
		TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.TextSize = 12.000
		TextLabel.TextXAlignment = Enum.TextXAlignment.Left
		TextLabel.ZIndex = 21

		right.Name = "right"
		right.Parent = header
		right.AnchorPoint = Vector2.new(1, 0)
		right.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		right.BackgroundTransparency = 1.000
		right.Position = UDim2.new(1, 0, 0, 0)
		right.Size = UDim2.new(0, 30, 0, 30)
		right.ZIndex = 21

		Frame_2.Parent = right
		Frame_2.AnchorPoint = Vector2.new(0.5, 0.5)
		Frame_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Frame_2.BackgroundTransparency = 1.000
		Frame_2.Position = UDim2.new(0.5, 0, 0.5, 0)
		Frame_2.Size = UDim2.new(1, 0, 1, 0)
		Frame_2.ZIndex = 21

		Icon.Name = "Icon"
		Icon.Parent = Frame_2
		Icon.AnchorPoint = Vector2.new(0.5, 0.5)
		Icon.BackgroundTransparency = 1.000
		Icon.Position = UDim2.new(0.5, 0, 0.5, 0)
		Icon.Size = UDim2.new(1, 0, 1, 0)
		Icon.Image = "rbxassetid://7743878857"
		Icon.ZIndex = 21

		UIAspectRatioConstraint.Parent = Icon

		UIPadding_2.Parent = Frame_2
		UIPadding_2.PaddingBottom = UDim.new(0, 6)
		UIPadding_2.PaddingLeft = UDim.new(0, 6)
		UIPadding_2.PaddingRight = UDim.new(0, 6)
		UIPadding_2.PaddingTop = UDim.new(0, 6)

		body.Name = "body"
		body.Parent = notif
		body.AnchorPoint = Vector2.new(0.5, 1)
		body.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		body.BackgroundTransparency = 1.000
		body.BorderColor3 = Color3.fromRGB(27, 42, 53)
		body.Position = UDim2.new(0.5, 0, 1, 0)
		body.Size = UDim2.new(1, 0, 1, -30)
		body.ZIndex = 21

		Frame_3.Parent = body
		Frame_3.AnchorPoint = Vector2.new(0.5, 0.5)
		Frame_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Frame_3.BackgroundTransparency = 1.000
		Frame_3.Position = UDim2.new(0.5, 0, 0.5, 0)
		Frame_3.Size = UDim2.new(1, 0, 1, 0)
		Frame_3.ZIndex = 21

		UIPadding_3.Parent = Frame_3
		UIPadding_3.PaddingBottom = UDim.new(0, 6)
		UIPadding_3.PaddingLeft = UDim.new(0, 16)
		UIPadding_3.PaddingRight = UDim.new(0, 16)
		UIPadding_3.PaddingTop = UDim.new(0, 6)

		TextLabel_2.Parent = Frame_3
		TextLabel_2.AnchorPoint = Vector2.new(0.5, 0.5)
		TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel_2.BackgroundTransparency = 1.000
		TextLabel_2.Position = UDim2.new(0.5, 0, 0.5, 0)
		TextLabel_2.Size = UDim2.new(1, 0, 1, 0)
		TextLabel_2.Font = Enum.Font.Gotham
		TextLabel_2.LineHeight = 1.440
		TextLabel_2.Text = props.text or "this is a notification lol"
		TextLabel_2.TextColor3 = Color3.fromRGB(200, 200, 200)
		TextLabel_2.TextSize = 11.000
		TextLabel_2.TextWrapped = true
		TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left
		TextLabel_2.TextYAlignment = Enum.TextYAlignment.Top
		TextLabel_2.ZIndex = 21

		-- Gui to Lua
		-- Version: 3.2

		-- Instances:

		local TextButton = Instance.new("TextButton")

		--Properties:

		TextButton.Parent = right
		TextButton.AnchorPoint = Vector2.new(0.5, 0.5)
		TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextButton.BackgroundTransparency = 1.000
		TextButton.Position = UDim2.new(0.5, 0, 0.5, 0)
		TextButton.Size = UDim2.new(1, 0, 1, 0)
		TextButton.Font = Enum.Font.SourceSans
		TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
		TextButton.TextSize = 14.000
		TextButton.TextTransparency = 1.000
		TextButton.ZIndex = 21

		ripplebtn(TextButton,20)
		hoverbtnimgcolor(TextButton,Icon)

		return notif
	elseif name == "textbox" then
		-- Gui to Lua
		-- Version: 3.2

		-- Instances:

		local textbox = Instance.new("Frame")
		local other = Instance.new("Frame")
		local Frame = Instance.new("Frame")
		local Icon = Instance.new("ImageLabel")
		local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
		local UIPadding = Instance.new("UIPadding")
		local Frame_2 = Instance.new("Frame")
		local box = Instance.new("Frame")
		local UIPadding_2 = Instance.new("UIPadding")
		local Frame_3 = Instance.new("Frame")
		local UIPadding_3 = Instance.new("UIPadding")
		local TextBox = Instance.new("TextBox")
		local UICorner = Instance.new("UICorner")
		local Frame_4 = Instance.new("Frame")
		local TextLabel = Instance.new("TextLabel")
		local UIPadding_4 = Instance.new("UIPadding")
		local UICorner_2 = Instance.new("UICorner")

		--Properties:

		textbox.Name = "textbox"
		textbox.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
		textbox.Size = UDim2.new(1, 0, 0, 34)

		other.Name = "other"
		other.Parent = textbox
		other.AnchorPoint = Vector2.new(1, 0.5)
		other.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		other.BackgroundTransparency = 1.000
		other.Position = UDim2.new(1, 0, 0.5, 0)
		other.Size = UDim2.new(0, 34, 0, 34)

		Frame.Parent = other
		Frame.AnchorPoint = Vector2.new(0.5, 0.5)
		Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Frame.BackgroundTransparency = 1.000
		Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
		Frame.Size = UDim2.new(1, 0, 1, 0)

		Icon.Name = "Icon"
		Icon.Parent = Frame
		Icon.AnchorPoint = Vector2.new(0.5, 0.5)
		Icon.BackgroundTransparency = 1.000
		Icon.Position = UDim2.new(0.5, 0, 0.5, 0)
		Icon.Size = UDim2.new(1, 0, 1, 0)
		Icon.Image = "rbxassetid://7733964719"
		Icon.ImageColor3 = Color3.fromRGB(122, 122, 122)

		UIAspectRatioConstraint.Parent = Icon

		UIPadding.Parent = Frame
		UIPadding.PaddingBottom = UDim.new(0, 8)
		UIPadding.PaddingLeft = UDim.new(0, 8)
		UIPadding.PaddingRight = UDim.new(0, 8)
		UIPadding.PaddingTop = UDim.new(0, 8)

		Frame_2.Parent = textbox
		Frame_2.AnchorPoint = Vector2.new(0, 0.5)
		Frame_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Frame_2.BackgroundTransparency = 1.000
		Frame_2.Position = UDim2.new(0, 0, 0.5, 0)
		Frame_2.Size = UDim2.new(1, -34, 1, 0)

		box.Name = "box"
		box.Parent = Frame_2
		box.AnchorPoint = Vector2.new(1, 0.5)
		box.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		box.BackgroundTransparency = 1.000
		box.Position = UDim2.new(1, 0, 0.5, 0)
		--box.Size = UDim2.new(1, -124, 1, 0)

		UIPadding_2.Parent = box
		UIPadding_2.PaddingBottom = UDim.new(0, 4)
		UIPadding_2.PaddingLeft = UDim.new(0, 4)
		UIPadding_2.PaddingRight = UDim.new(0, 4)
		UIPadding_2.PaddingTop = UDim.new(0, 4)

		Frame_3.Parent = box
		Frame_3.AnchorPoint = Vector2.new(0.5, 0.5)
		Frame_3.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
		Frame_3.Position = UDim2.new(0.5, 0, 0.5, 0)
		Frame_3.Size = UDim2.new(1, 0, 1, 0)

		TextBox.Parent = Frame_3
		TextBox.AnchorPoint = Vector2.new(0.5, 0.5)
		TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextBox.BackgroundTransparency = 1.000
		TextBox.Position = UDim2.new(0.5, 0, 0.5, 0)
		TextBox.Size = UDim2.new(1, 0, 1, 0)
		TextBox.ClearTextOnFocus = false
		TextBox.Font = Enum.Font.Gotham
		TextBox.PlaceholderColor3 = Color3.fromRGB(102, 102, 102)
		TextBox.PlaceholderText = props.boxtitle or "Input"
		TextBox.Text = ""
		TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextBox.TextSize = 12.000
		TextBox.TextXAlignment = Enum.TextXAlignment.Left

		UICorner.Parent = Frame_3

		Frame_4.Parent = Frame_2
		Frame_4.AnchorPoint = Vector2.new(0.5, 0.5)
		Frame_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Frame_4.BackgroundTransparency = 1.000
		Frame_4.Position = UDim2.new(0.5, 0, 0.5, 0)
		Frame_4.Size = UDim2.new(1, 0, 1, 0)

		TextLabel.Parent = Frame_4
		TextLabel.AnchorPoint = Vector2.new(0, 0.5)
		TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.BackgroundTransparency = 1.000
		TextLabel.Position = UDim2.new(0, 0, 0.5, 0)
		TextLabel.Font = Enum.Font.Gotham
		TextLabel.Text = props.title or "Button"
		TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.TextSize = 12.000
		--TextLabel.TextXAlignment = Enum.TextXAlignment.Left
		
		TextLabel.Size = UDim2.new(0, textsize(TextLabel).X+26, 1, 0)
		
		box.Size = UDim2.new(1, -TextLabel.AbsoluteSize.X, 1, 0)

		UICorner_2.Parent = textbox
		
		local TextButton = Instance.new("TextButton")

		--Properties:

		TextButton.Parent = TextLabel
		TextButton.AnchorPoint = Vector2.new(0.5, 0.5)
		TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextButton.BackgroundTransparency = 1.000
		TextButton.Position = UDim2.new(0.5, 0, 0.5, 0)
		TextButton.Size = UDim2.new(1, 0, 1, 0)
		TextButton.Font = Enum.Font.SourceSans
		TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
		TextButton.TextSize = 14.000
		TextButton.TextTransparency = 1.000
		TextButton.ZIndex = 21
		
		-- Gui to Lua
		-- Version: 3.2

		-- Instances:

		local UIPadding = Instance.new("UIPadding")

		--Properties:

		UIPadding.Parent = Frame_3
		UIPadding.PaddingLeft = UDim.new(0, 10)
		UIPadding.PaddingRight = UDim.new(0, 4)
		
		ripplebtn(TextButton,50)
		hoverbtncolor(TextButton,TextLabel)
		
		if props.title and props.desc then
			local TextButton = Instance.new("TextButton")

			--Properties:

			TextButton.Parent = other
			TextButton.AnchorPoint = Vector2.new(0.5, 0.5)
			TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextButton.BackgroundTransparency = 1.000
			TextButton.Position = UDim2.new(0.5, 0, 0.5, 0)
			TextButton.Size = UDim2.new(1, 0, 1, 0)
			TextButton.Font = Enum.Font.SourceSans
			TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
			TextButton.TextSize = 14.000
			TextButton.TextTransparency = 1.000

			ripplebtn(TextButton,20)
			hoverbtnimgcolor(TextButton,Icon)

			if props.glib then
				TextButton.MouseButton1Down:Connect(function()
					props.glib:notif(props.title,props.desc)
				end)
			end
		else
			Icon.ImageTransparency = 0.6
		end
		
		return textbox
	end
end

local function runcallback(callback,...)
	local args = {...}
	coroutine.wrap(function()
		local r,e = pcall(function()
			callback(unpack(args))
		end)
		if not r then error(e) end
	end)()
end


lib.new = function(self)
	local glib = {}	

	local gui,mfsize,mfabssize = linstance:create("gui")
	pcall(function()
		gui.Parent = game.CoreGui
	end)

	local showing = nil

	glib.notif = function(self,title,text)
		if showing then
			game:GetService("TweenService"):Create(showing,atween,{AnchorPoint=Vector2.new(0.5,1),Position=UDim2.fromScale(0.5,0)}):Play()
			showing = nil
		end
		local notif = linstance:create("notification",{title=title,text=text})
		notif.AnchorPoint = Vector2.new(0.5,0)
		notif.Position = UDim2.fromScale(0.5,1)
		notif.Parent = gui.Frame.body.darken
		game:GetService("TweenService"):Create(gui.Frame.body.darken,atween,{BackgroundTransparency=0.5}):Play()
		game:GetService("TweenService"):Create(notif,atween,{AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5)}):Play()
		notif.header.right.TextButton.MouseButton1Down:Connect(function()
			showing = false
			game:GetService("TweenService"):Create(gui.Frame.body.darken,atween,{BackgroundTransparency=1}):Play()
			game:GetService("TweenService"):Create(notif,atween,{AnchorPoint=Vector2.new(0.5,0),Position=UDim2.fromScale(0.5,1)}):Play()
		end)
		showing = notif
	end

	--gui,Parent = game.CoreGui

	local pselected = {}
	local pnum = 0

	glib.newpage = function(self,title)
		pnum=pnum+1

		local plib = {
			num = pnum
		}

		local tbutton = linstance:create("tbutton")
		tbutton.Frame.TextLabel.Text = title
		tbutton.Parent = gui.Frame.sidebar.ScrollingFrame

		local page = linstance:create("page")
		page.Parent = gui.Frame.body.pagecontainer
		page.Visible = false

		plib.select = function(self)
			if pselected.page ~= page then
				local pgtween = TweenInfo.new(math.abs(plib.num-(pselected.pagenum or 0))*.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out)
				if pselected.tbutton and pselected.page and pselected.pagenum then
					if plib.num < pselected.pagenum then
						TweenService:Create(pselected.page,pgtween,{AnchorPoint=Vector2.new(0.5,0),Position=UDim2.new(0.5,0,1,0)}):Play()
					else
						TweenService:Create(pselected.page,pgtween,{AnchorPoint=Vector2.new(0.5,1),Position=UDim2.new(0.5,0,0,0)}):Play()
					end
					TweenService:Create(pselected.tbutton.Frame.TextLabel,atween,{TextColor3=Color3.fromRGB(216, 216, 216)}):Play()
				end
				if pselected.pagenum then
					if plib.num < pselected.pagenum then
						page.AnchorPoint = Vector2.new(0.5,1)
						page.Position = UDim2.new(0.5,0,0,0)
					else
						page.AnchorPoint = Vector2.new(0.5,0)
						page.Position = UDim2.new(0.5,0,1,0)
					end
				end
				TweenService:Create(page,pgtween,{AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,0)}):Play()
				TweenService:Create(tbutton.Frame.TextLabel,atween,{TextColor3=Color3.fromRGB(255, 71, 182)}):Play()
				page.Visible = true
				pselected.tbutton = tbutton
				pselected.page = page
				pselected.pagenum = plib.num
			end
		end

		tbutton.Button.MouseButton1Down:Connect(function()
			plib:select()
		end)

		local innum = 0

		plib.addbutton = function(self,title,callback,desc)
			innum=innum+1
			local button = linstance:create("button",{title=title,desc=desc,glib=glib})
			button.LayoutOrder = innum
			button.Parent = page.ScrollingFrame
			button.Frame.Frame.TextLabel.Text = title
			button.Frame.TextButton.MouseButton1Down:Connect(function()
				runcallback(callback)
			end)
		end
		
		plib.addtextbox = function(self,title,boxtitle,callback,desc)
			innum=innum+1
			local textbox = linstance:create("textbox",{title=title,boxtitle=boxtitle,desc=desc,glib=glib})
			textbox.LayoutOrder = innum
			textbox.Parent = page.ScrollingFrame
			textbox.Frame.Frame.TextLabel.TextButton.MouseButton1Down:Connect(function()
				runcallback(callback,textbox.Frame.box.Frame.TextBox.Text)
			end)
		end

		plib.addlabel = function(self,title)
			innum=innum+1
			local label = linstance:create("hlabel",{title=title})
			label.LayoutOrder = innum
			label.Parent = page.ScrollingFrame
		end

		plib.addcheckbox = function(self,title,default,callback,desc)
			innum=innum+1
			local toggled = false
			local checkbox = linstance:create("checkbox",{title=title,desc=desc,glib=glib})
			checkbox.LayoutOrder = innum
			checkbox.Parent = page.ScrollingFrame

			local function runt()
				toggled = not toggled
				if toggled then
					TweenService:Create(checkbox.checkbox.cover,atween,{ImageTransparency=0}):Play()
				else
					TweenService:Create(checkbox.checkbox.cover,atween,{ImageTransparency=1}):Play()
				end
				runcallback(callback,toggled)
			end

			checkbox.checkbox.TextButton.MouseButton1Down:Connect(runt)

			if default then
				runt()
			end
		end

		plib.addslider = function(self,title,default,min,max,inc,callback,desc)
			innum=innum+1
			local slider = linstance:create("slider",{title=title,desc=desc,glib=glib,default=default})
			slider.LayoutOrder = innum
			slider.Parent = page.ScrollingFrame
			local button = slider.Frame.slide.TextButton
			local Mouse = game:GetService("Players").LocalPlayer:GetMouse()
			local totalsize = slider.Frame.slide.AbsoluteSize
			local dragtomouse,mousestart,slidestart = nil,Vector2.new(Mouse.X,Mouse.Y),slider.Frame.slide.Frame.slide.AbsoluteSize

			local dratio = default/max
			if dratio < .02 then
				dratio = .02
			elseif dratio > 1 then
				dratio = 1
			end

			slider.Frame.slide.Frame.slide.Size = UDim2.fromScale(dratio,1)

			button.MouseButton1Down:Connect(function()
				if dragtomouse then
					dragtomouse:Disconnect()
					dragtomouse = nil
				end
				mousestart = Vector2.new(Mouse.X,Mouse.Y)
				slidestart =  mousestart - (slider.Frame.slide.Frame.slide.AbsolutePosition)
				dragtomouse = game:GetService("RunService").Heartbeat:Connect(function()
					local totalsize = slider.Frame.slide.AbsoluteSize
					local mousepos = Vector2.new(Mouse.X,Mouse.Y)
					local diff = mousepos-mousestart
					local newsize = slidestart+diff
					local xratio = newsize.X/totalsize.X
					local sxratio = xratio
					if xratio < 0 then
						xratio = 0
					elseif xratio > 1 then
						xratio = 1
					end
					if sxratio < .02 then
						sxratio = .02
					elseif sxratio > 1 then
						sxratio = 1
					end
					TweenService:Create(slider.Frame.slide.Frame.slide,atween,{Size = UDim2.fromScale(sxratio,1)}):Play()
					--slider.Frame.slide.Frame.slide.Size = UDim2.fromScale(sxratio,1)

					local amount = (xratio*((max-min)/inc)*inc)+min
					slider.Frame.slide.Frame.TextLabel.Text = math.floor(amount/inc)*inc

					runcallback(callback,amount)
				end)
			end)

			local function disconnectdrag()
				if dragtomouse then
					dragtomouse:Disconnect()
					dragtomouse = nil
				end
			end


			game:GetService("UserInputService").InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					disconnectdrag()
				end
			end)
		end

		return plib
	end

	return glib
end

return lib
