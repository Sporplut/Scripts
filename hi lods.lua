local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/GreenDeno/Venyx-UI-Library/main/source.lua"))()
local lib = require(game.ReplicatedStorage:WaitForChild('Framework'):WaitForChild('Library'))
local mybanks = lib.Network.Invoke("get my banks")
local name = game.Players.LocalPlayer.Name

for i,v in pairs(game:GetService("CoreGui"):GetDescendants()) do
		if v.Name == "Hello Player | " ..name.. " | Welcome to Sporplut Gui!" then
			v:Destroy()
		end
end

local venyx = library.new("Hello Player | " ..name.. " | Welcome to Sporplut Gui!", 5013109572)

local themes = {
Background = Color3.fromRGB(24, 24, 24),
Glow = Color3.fromRGB(0, 0, 0),
Accent = Color3.fromRGB(10, 10, 10),
LightContrast = Color3.fromRGB(20, 20, 20),
DarkContrast = Color3.fromRGB(14, 14, 14),  
TextColor = Color3.fromRGB(255, 255, 255)
}

local page = venyx:addPage("Main", 5012544693)
local section1 = page:addSection("Bank List Things")
local section2 = page:addSection("Gems Things")
local section3 = page:addSection("Gui Things")

section1:addDropdown("Bank From", {"My Bank", "2", "3", "4", "5"}, function(mob)
	if mob == "My Bank" then
	    local BankID = mybanks[1]['BUID']
	    print("From",BankID)
	    getgenv().breh = BankID
	    elseif mob == "2" then
	    local BankID = mybanks[2]['BUID']
	    print("From",BankID)
	    getgenv().breh = BankID
		elseif mob == "3" then
		local BankID = mybanks[3]['BUID']
		print("From",BankID)
		getgenv().breh = BankID
	    elseif mob == "4" then
		local BankID = mybanks[4]['BUID']
		print("From",BankID)
		getgenv().breh = BankID
	    elseif mob == "5" then
		local BankID = mybanks[5]['BUID']
		print("From",BankID)
		getgenv().breh = BankID
	end
end)
section1:addDropdown("Bank To", {"My Bank", "2", "3", "4", "5"}, function(mob1)
	if mob1 == "My Bank" then
	    local BankID1 = mybanks[1]['BUID']
	    print("To",BankID1)
	    getgenv().breh1 = BankID1
	    elseif mob1 == "2" then
	    local BankID1 = mybanks[2]['BUID']
	    print("To",BankID1)
	    getgenv().breh1 = BankID1
		elseif mob1 == "3" then
		local BankID1 = mybanks[3]['BUID']
		print("To",BankID1)
		getgenv().breh1 = BankID1
	    elseif mob1 == "4" then
		local BankID1 = mybanks[4]['BUID']
		print("To",BankID1)
		getgenv().breh1 = BankID1
	    elseif mob1 == "5" then
		local BankID1 = mybanks[5]['BUID']
		print("To",BankID1)
		getgenv().breh1 = BankID1
	end
end)

local wew
section2:addTextbox("Amount of Gems per Deposit", e, function(val)
	wew = val
end)

local function btn()
	workspace.__THINGS.__REMOTES.MAIN:FireServer("b", "bank withdraw")
	local function Bank(id)
	   local self = {}
	   function self:withdraw(pets, gems)
	local A_1 = 
	{
	    [1] = id, 
	    [2] = 
	{
	}, 
	    [3] = gems
	}
	        local Event = game:GetService("Workspace")["__THINGS"]["__REMOTES"]["bank withdraw"]
	        Event:InvokeServer(A_1)
	   end
	   return self
	end
	--//
	Bank(breh):withdraw({}, tonumber(wew))
	task.wait(8)
	workspace.__THINGS.__REMOTES.MAIN:FireServer("b", "bank deposit")
	local function Bank(id)
	   local self = {}
	   function self:deposit(pets, gems)
	local A_1 = 
	{
	    [1] = id, 
	    [2] = 
	{
	}, 
	    [3] = gems
	}
	        local Event = game:GetService("Workspace")["__THINGS"]["__REMOTES"]["bank deposit"]
	        Event:InvokeServer(A_1)
	   end
	   return self
	end
	--//

	Bank(breh1):deposit({}, tonumber(wew))
	task.wait(8)
end

section2:addToggle("Toggle Transfer Start/Off", nil, function(t)
    if t then
    _G.Enabled = true
    while wait() do
    if _G.Enabled then
    task.wait()
    btn()
    end
    end
    else
    _G.Enabled = false
    print'done transfer'
	lib.Message.New("Successfully Transferred! Made by Sporplut :)");
    end
end)

section3:addKeybind("Open/Hide Gui", Enum.KeyCode.RightShift, function()
venyx:toggle()
end, function()
end)

section3:addButton("Destroy Gui", function()
    for i,v in pairs(game:GetService("CoreGui"):GetDescendants()) do
		if v.Name == "Hello Player | " ..name.. " | Welcome to Sporplut Gui!" then
			v:Destroy()
		end
end
end)    
-- second page
local theme = venyx:addPage("Theme", 5012544693)
local colors = theme:addSection("Colors")

for theme, color in pairs(themes) do -- all in one theme changer, i know, im cool
colors:addColorPicker(theme, color, function(color3)
venyx:setTheme(theme, color3)
end)
end

-- load
venyx:SelectPage(venyx.pages[1], true)
