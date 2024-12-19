local WindUI = loadstring(game:HttpGet("https://tree-hub.vercel.app/api/UI/WindUI"))()
local Player = game.Players.LocalPlayer
local Window = WindUI:CreateWindow({
    Title = "DarknessHub", -- UI Title
    Icon = "rbxassetid://10511856020", -- Url or rbxassetid or lucide
    Author = "Groovy", -- Author & Creator
    Folder = "DKHub", -- Folder name for saving data (And key)
    Size = UDim2.fromOffset(230, 230), -- UI Size
    KeySystem = { -- Creates key system
        Key = "DHOnTop", -- key
        Note = "Join Our Discord To Get The Key!", -- Note
        URL = "https://github.com/Footagesus/WindUI", -- URL To get key (example: Discord)
        SaveKey = false, -- Saves the key in the folder specified above
    }, 
    Transparent = false,-- UI Transparency
    Theme = "Dark", -- UI Theme
    SideBarWidth = 170, -- UI Sidebar Width (number)
    HasOutline = true, -- Adds Outlines to the window
})

Window:EditOpenButton({
    Title = "Open Button",
    Icon = "door-closed",
    CornerRadius = UDim.new(0,10),
    StrokeThickness = 2,
    Color = ColorSequence.new( -- gradient
        Color3.fromHex("FF0F7B"), 
        Color3.fromHex("F89B29")
    )
})

local Notification = WindUI:Notify({
    Title = "Logged in successful!",
    Content = "You Are Logged In As "..Player.Name..".",
    Duration = 5,
})

local Tab = Window:Tab({
    Title = "Main",
    Icon = "house", -- lucide or rbxassetid
})

local Paragraph = Tab:Paragraph({
    Title = "Thanks For Using DarknessHub!",
    Desc = "Enjoy!",
    Image = "droplet", -- lucide or URL or rbxassetid://
    ImageSize = 20,
    Buttons = {
        {
            Title = "Discord",
            Callback = function() print("Dc") end
        },
        {
            Title = "Tiktok",
            Callback = function() print("Tt") end
        },
        {
            Title = "Youtube",
            Callback = function() print("Yt") end
        }
    }
})
local Button = Tab:Button({
    Title = "Server Hopper",
    Desc = "Move To New Server! | Please Wait..",
    Callback = function()
        local Player = game.Players.LocalPlayer    
local Http = game:GetService("HttpService")
local TPS = game:GetService("TeleportService")
local Api = "https://games.roblox.com/v1/games/"

local _place,_id = game.PlaceId, game.JobId
local _servers = Api.._place.."/servers/Public?sortOrder=Desc&limit=100"
function ListServers(cursor)
   local Raw = game:HttpGet(_servers .. ((cursor and "&cursor="..cursor) or ""))
   return Http:JSONDecode(Raw)
end

local Next; repeat
   local Servers = ListServers(Next)
   for i,v in next, Servers.data do
       if v.playing < v.maxPlayers and v.id ~= _id then
           local s,r = pcall(TPS.TeleportToPlaceInstance,TPS,_place,v.id,Player)
           if s then break end
       end
   end
   
   Next = Servers.nextPageCursor
until not Next
    end,
})

local Button = Tab:Button({
    Title = "Lower ServerHop",
    Desc = "Move To Lower Server | Please Wait...",
    Callback = function()
        local Http = game:GetService("HttpService")
local TPS = game:GetService("TeleportService")
local Api = "https://games.roblox.com/v1/games/"

local _place = game.PlaceId
local _servers = Api.._place.."/servers/Public?sortOrder=Asc&limit=100"
function ListServers(cursor)
   local Raw = game:HttpGet(_servers .. ((cursor and "&cursor="..cursor) or ""))
   return Http:JSONDecode(Raw)
end

local Server, Next; repeat
   local Servers = ListServers(Next)
   Server = Servers.data[1]
   Next = Servers.nextPageCursor
until Server

TPS:TeleportToPlaceInstance(_place,Server.id,game.Players.LocalPlayer)
    end,
})

local Button = Tab:Button({
    Title = "Rejoin",
    Desc = "join this server again | Please Wait...",
    Callback = function()
       game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
end) 
    end,
})

local Slider = Tab:Slider({
    Title = "Speed",
    Step = 1,
    Value = {
        Min = 1,
        Max = 120,
        Default = 26,
    },
    Callback = function(value)
        getgenv().WalkSpeedValue, function(speedfunc)
    getgenv().WalkSpeedValue = speedfunc
    if getgenv().WalkSpeedValue then
        local Player = game:service'Players'.LocalPlayer
        Player.Character.Humanoid:GetPropertyChangedSignal'WalkSpeed':Connect(function()
            Player.Character.Humanoid.WalkSpeed = getgenv().WalkSpeedValue
        end)
        Player.Character.Humanoid.WalkSpeed = getgenv().WalkSpeedValue
    end
end)
    end
})

local Slider = Tab:Slider({
    Title = "Jump Boost",
    Step = 1,
    Value = {
        Min = 1,
        Max = 120,
        Default = 50,
    },
    Callback = function(value)
        getgenv().JumpValue, function(jumpfunc)
    getgenv().JumpValue = jumpfunc
    if getgenv().JumpValue then
        game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = getgenv().JumpValue
    end
end)
    end
})

local Button = Tab:Button({
    Title = "Fps Boost",
    Desc = "Boost Up To 120fps!",
    Callback = function()
        local decalsyeeted = false
    local g = game
    local w = g.Workspace
    local l = g.Lighting
    local t = w.Terrain
    t.WaterWaveSize = 0
    t.WaterWaveSpeed = 0
    t.WaterReflectance = 0
    t.WaterTransparency = 0
    l.GlobalShadows = false
    l.FogEnd = 9e9
    l.Brightness = 0
    settings().Rendering.QualityLevel = "Level01"
    for i, v in pairs(g:GetDescendants()) do
        if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then 
            v.Material = "Plastic"
            v.Reflectance = 0
        elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
            v.Transparency = 1
        elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
            v.Lifetime = NumberRange.new(0)
        elseif v:IsA("Explosion") then
            v.BlastPressure = 1
            v.BlastRadius = 1
        elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
            v.Enabled = false
        elseif v:IsA("MeshPart") then
            v.Material = "Plastic"
            v.Reflectance = 0
            v.TextureID = 10385902758728957
        end
    end
    for i, e in pairs(l:GetChildren()) do
        if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
            e.Enabled = false
        end
    end
end)
    end,
})

local Tab = Window:Tab({
    Title = "FreeScript",
    Icon = "scroll-text", })


local Tab = Window:Tab({
    Title = "Bypass",
    Icon = "shield-alert", -- lucide or rbxassetid
})

local Toggle = Tab:Toggle({
    Title = "Anti AFK",
    Desc = "AFK bypass",
    Value = true,
    Callback = function(state)
        getgenv().AntiAFK, function(Value)
    getgenv().AntiAFK = Value
end)

task.spawn(function ()
    while wait(.1) do
        if getgenv().AntiAFK then
            local vu = game:GetService("VirtualUser")
            game:GetService("Players").LocalPlayer.Idled:connect(function()
                vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
                wait(1)
                vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
            end)
        end
    end
end)
    end,
})

local Toggle = Tab:Toggle({
    Title = "Anti Kick",
    Desc = "you won't be kicked!",
    Value = true,
    Callback = function(state)
        getgenv().AntiKickClient, function(Value)
    getgenv().AntiKickClient = Value
end)
task.spawn(function()
    while wait() do
        if getgenv().AntiKickClient then
            loadstring(game:HttpGet('https://gitlab.com/Sky2836/BT/-/raw/main/antikickclient'))()
        end
    end
end)
    end,
})

local Toggle = Tab:Toggle({
    Title = "Anti Ban",
    Desc = "protect your account",
    Value = true,
    Callback = function(state)
        local players = game:GetService("Players");
local localPlayer = players.LocalPlayer;

local function checkIsStaff(plr) -- Tags aren't set immediately, it's usually 4 or 5 seconds after they join.
   local attr;
   while true do
       attr = plr:GetAttribute("_tag");
       if attr ~= nil then
           break;
       end
       task.wait(0.25);
   end
   if attr < 0 or attr > 2 then
local Http = game:GetService("HttpService")
local TPS = game:GetService("TeleportService")
local Api = "https://games.roblox.com/v1/games/"

local _place = game.PlaceId
local _servers = Api.._place.."/servers/Public?sortOrder=Asc&limit=100"
function ListServers(cursor)
   local Raw = game:HttpGet(_servers .. ((cursor and "&cursor="..cursor) or ""))
   return Http:JSONDecode(Raw)
end

local Server, Next; repeat
   local Servers = ListServers(Next)
   Server = Servers.data[1]
   Next = Servers.nextPageCursor
until Server

TPS:TeleportToPlaceInstance(_place,Server.id,game.Players.LocalPlayer)
    end,
})

local Tab = Window:Tab({
    Title = "Settings",
    Icon = "settings", -- lucide or rbxassetid
})
