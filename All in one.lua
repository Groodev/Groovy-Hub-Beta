local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Groovy Hub", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

local Tab = Window:MakeTab({

Name = "Tab 1",	Icon = "rbxassetid://4483345998",

PremiumOnly = false







local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "Groovy Hub", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

OrionLib:MakeNotification({

	Name = "Credits",

	Content = "Credits UI : OrionLib",

	Image = "rbxassetid://4483345998",

	Time = 5

local Tab = Window:MakeTab({

Name = "Home",	Icon = "rbxassetid://4483345998",

PremiumOnly = false

Tab:AddButton({

	Name = "Tolol",

	Callback = function()

      		print("button pressed")

	end    

	

	Tab:AddColorpicker({

	Name = "Colorpicker",

	Default = Color3.fromRGB(255, 0, 0),

	Callback = function(Value)

		print(Value)

	end	  

	

ColorPicker:Set(Color3.fromRGB(255,255,255))

local Tab = Window:MakeTab({

	Name = "Auto Farm",

	Icon = "rbxassetid://4483345998",

	PremiumOnly = false

Tab:AddToggle({

	Name = "pencet en",

	Default = false,

	Callback = function(Value)

		print(Value)

	end    

Tab:AddSlider({

	Name = "Slider",

	Min = 0,

	Max = 20,

	Default = 5,

	Color = Color3.fromRGB(255,255,255),

	Increment = 1,

	ValueName = "bananas",

	Callback = function(Value)

		print(Value)

	end    
