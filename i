if game.PlaceId == 7026949294 then
    


local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local window = library.CreateLib("Keybrew Hub discord.gg/keybrew", "GrapeTheme")

-- Main

local maintab = window:NewTab("Main")
local Main = maintab:NewSection("Farm")


local NPCs = {}

for i, v in pairs(game:GetService("Workspace").Mobs:GetDescendants()) do
    if v:IsA "Model"  then
        if not table.find(NPCs, tostring(v)) then
            table.insert(NPCs, tostring(v))
        end
    end
end

local EGGs = {}

for i, v in pairs(game:GetService("Workspace").Eggs.Holders:GetChildren()) do
    if v:IsA "Model"  then
        if not table.find(EGGs, tostring(v)) then
            table.insert(EGGs, tostring(v))
        end
    end
end


local k = Main:NewDropdown("Select NPC", "Select an NPC to Auto-Farm.", NPCs, function(o)
    getgenv().npcs = o
end)
Main:NewButton("Refresh NPCs", "Refreshes NPC dropdown.", function()
    table.clear(NPCs)
    for i, v in pairs(game:GetService("Workspace").Mobs:GetDescendants()) do
        if v:IsA "Model"  then
            if not table.find(NPCs, tostring(v)) then
                table.insert(NPCs, tostring(v))
            k:Refresh(NPCs)
            end
        end
    end
end)

local function getDUNGEON()
    local dist, thing = math.huge
    for i, v in next, game:GetService("Workspace").Mobs.Other:GetChildren() do
        if v:IsA("Model") and v.Humanoid.Health > 0 then
            local mag =
                (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).magnitude
            if mag < dist then
                dist = mag
                thing = v
            end
        end
    end
    return thing
end


local function getClosest()
    local dist, thing = math.huge
    for i, v in next, game:GetService("Workspace").Mobs:GetDescendants() do
        if v:IsA("Model") and v.Name == npcs and v.Humanoid.Health > 0 then
            local mag =
                (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).magnitude
            if mag < dist then
                dist = mag
                thing = v
            end
        end
    end
    return thing
end

Main:NewToggle("Auto-Farm NPC", "Toggles the NPC Auto-Farm on and off.", function(state)
    oo = state
    while oo do
        task.wait()
        pcall(function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getClosest().HumanoidRootPart.CFrame
            local args = {
                [1] = getClosest(),
                [2] = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
            }

            game:GetService("ReplicatedStorage").Remotes.Gameplay.FireHit:FireServer(unpack(args))
        end)
        end
    end)

    local Dtab = window:NewTab("Dungeon")
    local D = Dtab:NewSection("Farm")

    D:NewToggle("Auto Farm Dungeon", "Automatically Farm Dungeon", function(state)
        d = state
        while d do
            task.wait()
            pcall(function()
            if not game:GetService("Workspace").ZoneDetections:FindFirstChildWhichIsA("Part") then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(181, 25, -139)
            elseif game:GetService("Workspace").ZoneDetections:FindFirstChild("DungeonLobby") then
                    game:GetService("ReplicatedStorage").Events.EnterDungeon:InvokeServer()
                elseif game:GetService("Workspace").ZoneDetections:FindFirstChildWhichIsA("Part") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getDUNGEON().HumanoidRootPart.CFrame
                    game:GetService("ReplicatedStorage").Remotes.Gameplay.FireHit:FireServer(getDUNGEON(),game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
                end
                end)
            end
        end)

    local eggtab = window:NewTab("Eggs")
    local egg = eggtab:NewSection("Eggs")

    egg:NewDropdown("Select EGG", "Select an EGG to Auto-Open.", EGGs, function(o)
        getgenv().eggs = o
    end)

    egg:NewToggle("Auto Open Eggs", "Automatically open eggs", function(state)
        o = state
        while o do
            task.wait()
            local args = {
                [1] = eggs,
                [2] = "Hatch"
            }

            game:GetService("ReplicatedStorage").Remotes.Gameplay.RequestPetPurchase:InvokeServer(unpack(args))
            end
        end)

        local misctab = window:NewTab("Misc")
        local miscplayersec = misctab:NewSection("Local Player")
        miscplayersec:NewSlider("WalkSpeed", "Sets your WalkSpeed.", 500, 1, function(s)
            getgenv().speed = s
        end)
        miscplayersec:NewToggle("Toggle WalkSpeed", "Toggles your WalkSpeed.", function(state)
            gg = state
            while gg do
                task.wait()
                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = speed
            end
        end)
        


-- Settings

local settingstab = window:NewTab("Settings")
local settingsuisec = settingstab:NewSection("UI Settings")
settingsuisec:NewKeybind("Toggle UI Keybind", "Toggles the UI with the use of a key.", Enum.KeyCode.RightControl, function()
	library:ToggleUI()
end)


elseif game.PlaceId == 6152116144 or 7447158459 or 9366093452 then
    

local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local win = lib.CreateLib("Keybrew Hub Premium discord.gg/keybrew", "GrapeTheme")

local maint = win:NewTab("READ EVERYTHING")
maint:NewSection("Do not manually attack while using Kill Aura")
maint:NewSection("Do not Spam Teleport Buttons")
maint:NewSection("Do not Spam Toggles or will be banned")
maint:NewSection("Using KRNL will have a higher chance of being banned")
local rule = maint:NewSection("DO NOT BLAME US FOR YOUR BAN")


rule:NewButton("I DENY", "DENY", function()
    game.Players.LocalPlayer:Kick("YOU DENIED HOW COULD YOU")
end)


rule:NewButton("I ACCEPT", "ACCEPT", function()

    
local player = game.Players.LocalPlayer
local char = player.Character
local lp = game.Players.LocalPlayer

local function getDEMON()
    local dist, thing = math.huge
    for i, v in next, game:GetService("Workspace")["Demon_Flowers_Spawn"]:GetDescendants() do
        if v:IsA("MeshPart") and v.Parent.Name == "Demon_Flower" then
            local mag = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).magnitude
            if mag < dist then
                dist = mag
                thing = v
            end
        end
    end
    return thing
end

local NPCs = {}

for i, v in pairs(game:GetService("Workspace").Mobs:GetDescendants()) do
    if v:IsA "Model" and v:FindFirstChild("Humanoid") then
        if not table.find(NPCs, tostring(v)) then
            table.insert(NPCs, tostring(v))
        end
    end
end
local Pack = {}

for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
    if v:IsA "Tool" and v:FindFirstChild("BlockEquiped") then
        if not table.find(Pack, tostring(v)) then
            table.insert(Pack, tostring(v))
        end
    end
end

local Players = {}

for i, v in pairs(game:GetService("Workspace"):GetChildren()) do
    if v:FindFirstChild("Climbing") then
            table.insert(Players, tostring(v))
    end
end

local metatable = getrawmetatable(game)
local nc = metatable.__namecall

setreadonly(metatable, false)

metatable.__namecall =
    newcclosure(
    function(self, ...)
        local args = {...}
        local name = self
        if getnamecallmethod() == "FireServer" and tostring(name) == "moddelteasdasd123" then
            return wait(9e9)
        end
        return nc(self, ...)
    end
)


local TweenService = game:GetService("TweenService")
local noclipE = false
local antifall = false

local function noclip()
    for i, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
        if v:IsA("BasePart") and v.CanCollide == true then
            v.CanCollide = false
            game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
        end
    end
end

local function moveto(obj, speed)
    local info =
        TweenInfo.new(
        ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - obj.Position).Magnitude) / speed,
        Enum.EasingStyle.Linear
    )
    local tween = TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, info, {CFrame = obj})

    if not game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then
        antifall = Instance.new("BodyVelocity", game.Players.LocalPlayer.Character.HumanoidRootPart)
        antifall.Velocity = Vector3.new(0, 0, 0)
        noclipE = game:GetService("RunService").Stepped:Connect(noclip)
        tween:Play()
    end

    tween.Completed:Connect(
        function()
            antifall:Destroy()
            noclipE:Disconnect()
        end
    )
end


local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local window = library.CreateLib("Keybrew Hub Premium discord.gg/keybrew", "GrapeTheme")

-- Main

local maintab = window:NewTab("Main")
local breathingprogress = maintab:NewSection("Breathing Progress: "..game:GetService("ReplicatedStorage")["Player_Data"][game.Players.LocalPlayer.Name].BreathingProgress[1].Value.."/"..game:GetService("ReplicatedStorage")["Player_Data"][game.Players.LocalPlayer.Name].BreathingProgress[2].Value)
local demonprogress = maintab:NewSection("Demon Progress: "..game:GetService("ReplicatedStorage")["Player_Data"][game.Players.LocalPlayer.Name].DemonProgress[1].Value.."/"..game:GetService("ReplicatedStorage")["Player_Data"][game.Players.LocalPlayer.Name].DemonProgress[2].Value)
local mainautofarmsec = maintab:NewSection("Auto-Farm")


local function DemonProgressRefresh()
    demonprogress:UpdateSection("Demon Progress: "..game:GetService("ReplicatedStorage")["Player_Data"][game.Players.LocalPlayer.Name].DemonProgress[1].Value.."/"..game:GetService("ReplicatedStorage")["Player_Data"][game.Players.LocalPlayer.Name].DemonProgress[2].Value)
end

game:GetService("ReplicatedStorage")["Player_Data"][game.Players.LocalPlayer.Name].DemonProgress[1].Changed:Connect(DemonProgressRefresh)

local function BreathingProgressRefresh()
    breathingprogress:UpdateSection("Breathing Progress: "..game:GetService("ReplicatedStorage")["Player_Data"][game.Players.LocalPlayer.Name].BreathingProgress[1].Value.."/"..game:GetService("ReplicatedStorage")["Player_Data"][game.Players.LocalPlayer.Name].BreathingProgress[2].Value)
end

game:GetService("ReplicatedStorage")["Player_Data"][game.Players.LocalPlayer.Name].BreathingProgress[1].Changed:Connect(BreathingProgressRefresh)

mainautofarmsec:NewDropdown("Select Weapon", "Select a Weapon to Auto-Farm.", {"fist_combat",
"Sword_Combat_Slash","claw_Combat_Slash"}, function(o)
    getgenv().wep = o
end)

mainautofarmsec:NewToggle("Kill Aura", "Toggles the Kill Aura on and off.", function(state)
    ka = state
    while ka do
        task.wait(1.5)
for i=1, 16 do 
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(wep,game:GetService("Players").LocalPlayer,game:GetService("Players").LocalPlayer.Character,game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,game:GetService("Players").LocalPlayer.Character.Humanoid,919)
end
end
end)


local k = mainautofarmsec:NewDropdown("Select NPC", "Select an NPC to Auto-Farm.", NPCs, function(o)
    getgenv().npcs = o
end)
mainautofarmsec:NewButton("Refresh NPCs", "Refreshes NPC Dropdown.", function()
    table.clear(NPCs)
    for i, v in pairs(game:GetService("Workspace").Mobs:GetDescendants()) do
        if v:IsA "Model" and v:FindFirstChild("Humanoid") then
            if not table.find(NPCs, tostring(v)) then
                table.insert(NPCs, tostring(v))
            k:Refresh(NPCs)
            end
        end
    end
end)
local function getNPC()
    local dist, thing = math.huge
    for i, v in next, game:GetService("Workspace").Mobs:GetDescendants() do
        if v.Name == "HumanoidRootPart" and v.Parent.Name == npcs then
            local mag = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).magnitude
            if mag < dist then
                dist = mag
                thing = v
            end
        end
    end
    return thing
end


mainautofarmsec:NewToggle("Auto-Farm NPC", "Toggles the NPC Auto-Farm on and off.", function(state)
    oo = state
    while oo do
        task.wait()
        pcall(function()
            moveto(getNPC().CFrame + Vector3.new(0,0,0),100)
        end)
        end
    end)

local mainautoquestsec = maintab:NewSection("Auto-Quest")
mainautoquestsec:NewDropdown("Select Quest", "Select an Quest to Farm.", 
{"Wagon",
"Kurake"}, function(o)
    getgenv().quest = o
end)

mainautoquestsec:NewToggle("Auto-Quest", "Toggles the Quest-Farm on and off.", function(state)
    aa = state
    while aa do
        task.wait()
        if quest == "Wagon" then
            moveto(CFrame.new(223, 283, -1610) + Vector3.new(0, 0, 0), tonumber(125))
            wait(10)

            local args = {
                [1] = "AddQuest",
                [2] = "Players." ..
                    game.Players.LocalPlayer.Name .. ".PlayerGui.Npc_Dialogue.LocalScript.Functions",
                [3] = 84732.8527069,
                [4] = game:GetService("ReplicatedStorage").Player_Data[game.Players.LocalPlayer.Name].Quest,
                [5] = {
                    ["List"] = {
                        [1] = {
                            ["Name"] = "Deliver wagon",
                            ["Progress"] = {
                                [1] = 0,
                                [2] = 1
                            }
                        }
                    },
                    ["Current"] = "Deliver grandpa Wagwon's wagon"
                }
            }

            game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(args))
            moveto(CFrame.new(450, 275, -2674) + Vector3.new(0, 0, 0), tonumber(125))
            wait(30)
        elseif quest == "Kurake" then
            moveto(CFrame.new(-415, 275, -3317) + Vector3.new(0, 0, 0), tonumber(125))
            wait(3)
            local args = {
                [1] = "AddQuest",
                [2] = "Players." ..
                    game.Players.LocalPlayer.Name .. ".PlayerGui.Npc_Dialogue.LocalScript.Functions",
                [3] = 86188.8231813,
                [4] = game:GetService("ReplicatedStorage").Player_Data[game.Players.LocalPlayer.Name].Quest,
                [5] = {
                    ["List"] = {
                        [1] = {
                            ["Name"] = "Deliver food",
                            ["Progress"] = {
                                [1] = 0,
                                [2] = 1
                            }
                        }
                    },
                    ["Current"] = "Deliver food supply to Naratia"
                }
            }

            game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(args))

            moveto(CFrame.new(297, 276, -2545) + Vector3.new(0, 0, 0), tonumber(125))
            wait(10)

            local args = {
                [1] = "Quest_add",
                [2] = "Players." ..
                    game.Players.LocalPlayer.Name .. ".PlayerGui.Npc_Dialogue.LocalScript.Functions",
                [3] = 86230.3159479,
                [4] = {},
                [5] = game:GetService("Players").LocalPlayer,
                [6] = "ouwbihgemstoneasd123"
            }

            game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(args))

            moveto(CFrame.new(-415, 275, -3317) + Vector3.new(0, 0, 0), tonumber(125))
            wait(30)
        end
    end
end)

local mainextrassec = maintab:NewSection("Extra's")
mainextrassec:NewButton("Invisible", "Makes you Invisible.", function()
    for i,v in pairs(workspace:GetDescendants()) do
        if v:IsA("MeshPart") or v:IsA("Part") or v:IsA("Decal") then
            local args = {
            [1] = "Change_Transparency",
            [2] = {
                [1] = {
                    [1] = v,
                    [2] = 1

                },
                
            }
            }

            game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(args))
        end
    end
end)



mainextrassec:NewButton("Teleport to Wagon", "Teleports you to the Wagon.", function()
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Anchored = true
    moveto(CFrame.new(223, 283, -1610) + Vector3.new(0,0,0),100)
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Anchored = false
end)

mainextrassec:NewButton("Teleport to Kurake", "Teleports you to Kurake.", function()
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Anchored = true
    moveto(CFrame.new(-415, 275, -3317) + Vector3.new(0,0,0),100)
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Anchored = false
end)

-- Auto Skill

local autoskilltab = window:NewTab("Auto-Skill")
local autoskillsec = autoskilltab:NewSection("Auto-Skill")
autoskillsec:NewToggle("Auto-Skill Z", "Toggles Auto-Skill for the Z move.", function(state)
    az = state
    while az do
        task.wait()
        game:GetService("VirtualInputManager"):SendKeyEvent(true,Enum.KeyCode.Z,false,game)
        wait(.1)
    end
end)

autoskillsec:NewToggle("Auto-Skill X", "Toggles Auto-Skill for the X move.", function(state)
    ax = state
    while ax do
        task.wait()
        game:GetService("VirtualInputManager"):SendKeyEvent(true,Enum.KeyCode.X,false,game)
        wait(.1)
    end
end)

autoskillsec:NewToggle("Auto-Skill C", "Toggles Auto-Skill for the C move.", function(state)
    ac = state
    while ac do
        task.wait()
        game:GetService("VirtualInputManager"):SendKeyEvent(true,Enum.KeyCode.C,false,game)
        wait(.1)
    end
end)

autoskillsec:NewToggle("Auto-Skill V", "Toggles Auto-Skill for the V move.", function(state)
    av = state
    while av do
        task.wait()
        game:GetService("VirtualInputManager"):SendKeyEvent(true,Enum.KeyCode.V,false,game)
        wait(.1)
    end
end)

autoskillsec:NewToggle("Auto-Skill B", "Toggles Auto-Skill for the B move.", function(state)
    ab = state
    while ab do
        task.wait()
        game:GetService("VirtualInputManager"):SendKeyEvent(true,Enum.KeyCode.B,false,game)
        wait(.1)
    end
end)

autoskillsec:NewToggle("Auto-Skill N", "Toggles Auto-Skill for the N move.", function(state)
    an = state
    while an do
        task.wait()
        game:GetService("VirtualInputManager"):SendKeyEvent(true,Enum.KeyCode.N,false,game)
        wait(.1)
    end
end)

-- Teleport

local teleporttab = window:NewTab("Teleports")
local teleportareasec = teleporttab:NewSection("Area TP's")
teleportareasec:NewDropdown("Select Area", "Select an Area to TP to.", {          
"Kiribating Village",
"Zapiwara Cave",
"Butterfly Mansion",
"Zapiwara Mountain",
"Usumaru Village",
"Waroru Cave",
"Kabiwaru Village",
"Abubu Cave",
"Final Selection",
"Ouwbayashi Home",
"Wind Trainer",
"Dangerous Woods",
"Slasher Demon"}, function(o)
    getgenv().area = o
end)


teleportareasec:NewButton("Teleport", "Teleports you to the selected Area.", function()
    if area == "Kiribating Village" then
        moveto(CFrame.new(107, 282, -1630) + Vector3.new(0, 0, 0), tonumber(125))
    elseif area == "Zapiwara Cave" then
        moveto(CFrame.new(18, 276, -2569) + Vector3.new(0, 0, 0), tonumber(125))
    elseif area == "Usumaru Village" then
        moveto(CFrame.new(-142, 353, -3039) + Vector3.new(0, 0, 0), tonumber(125))
    elseif area == "Butterfly Mansion" then
        moveto(CFrame.new(2961, 317, -3920) + Vector3.new(0, 0, 0), tonumber(125))
    elseif area == "Zapiwara Mountain" then
        moveto(CFrame.new(-326, 427, -2384) + Vector3.new(0, 0, 0), tonumber(125))
    elseif area == "Waroru Cave" then
        moveto(CFrame.new(705, 261, -2395) + Vector3.new(0, 0, 0), tonumber(125))
    elseif area == "Kabiwaru Village" then
        moveto(CFrame.new(1987, 326, -2903) + Vector3.new(0, 0, 0), tonumber(125))
    elseif area == "Abubu Cave" then
        moveto(CFrame.new(1037, 276, -3554) + Vector3.new(0, 0, 0), tonumber(125))
    elseif area == "Final Selection" then
        moveto(CFrame.new(5340, 372, -2424) + Vector3.new(0, 0, 0), tonumber(125))
    elseif area == "Ouwbayashi Home" then
        moveto(CFrame.new(1268, 316, -4578) + Vector3.new(0, 0, 0), tonumber(125))
    elseif area == "Wind Trainer" then
        moveto(CFrame.new(1788, 334, -3522) + Vector3.new(0, 0, 0), tonumber(125))
    elseif area == "Dangerous Woods" then
        moveto(CFrame.new(3966, 343, -3989) + Vector3.new(0, 0, 0), tonumber(125))
    elseif area == "Slasher Demon" then
        moveto(CFrame.new(4324, 342, -4274) + Vector3.new(0, 0, 0), tonumber(125))
    end
end)

local teleportbosssec = teleporttab:NewSection("Boss TP's")
teleportbosssec:NewDropdown("Select Boss", "Select an Boss to TP to.", {            
"Zuko",
"Sabito",
"Zenitsu",
"Kaden",
"Sanemi",
"Nezuko",
"Giyu",
"Shiron",
"Slasher",
"Yahaba/Susamaru"}, function(o)
    getgenv().area = o

end)

teleportbosssec:NewButton("Teleport", "Teleports you to the selected Boss.", function()
    if area == "Zuko" then
        moveto(CFrame.new(209.372, 292.624, -1860.0) + Vector3.new(0, 0, 0), tonumber(125))
    elseif area == "Sabito" then
        moveto(CFrame.new(1121.19, 291.22, -2890.5) + Vector3.new(0, 0, 0), tonumber(125))
    elseif area == "Zenitsu" then
        moveto(CFrame.new(-398, 435, -2188) + Vector3.new(0, 0, 0), tonumber(125))
    elseif area == "Kaden" then
        moveto(CFrame.new(-477.035, 308.986, -2918.89) + Vector3.new(0, 0, 0), tonumber(125))
    elseif area == "Sanemi" then
        moveto(CFrame.new(1547.73, 348.462, -3778.08) + Vector3.new(0, 0, 0), tonumber(125))
    elseif area == "Nezuko" then
        moveto(CFrame.new(3530.02, 349.031, -4450.54) + Vector3.new(0, 0, 0), tonumber(125))
    elseif area == "Giyu" then
        moveto(CFrame.new(2935, 352, -2931) + Vector3.new(0, 0, 0), tonumber(125))
    elseif area == "Shiron" then
        moveto(CFrame.new(3283.97, 448.609, -3941.2) + Vector3.new(0, 0, 0), tonumber(125))
    elseif area == "Slasher" then
        moveto(CFrame.new(4290, 365, -4367) + Vector3.new(0, 0, 0), tonumber(125))
    elseif area == "Yahaba/Susamaru" then
        moveto(CFrame.new(1403, 500, -4459) + Vector3.new(0, 0, 0), tonumber(125))
    end
    end)

 


local teleportplayersec = teleporttab:NewSection("Player Tweening")
local p = teleportplayersec:NewDropdown("Select Player", "Select an Player to Tween to.", Players, function(o)
    getgenv().playr = o
end)

teleportplayersec:NewButton("Refresh Players", "Refreshes player dropdown.", function()
    table.clear(Players)
    for i, v in pairs(game:GetService("Workspace"):GetChildren()) do
        if v:FindFirstChild("Climbing") then
            table.insert(Players, tostring(v))
            p:Refresh(Players)
        end
    end
end)

teleportplayersec:NewToggle("Tween to Player", "Tweens to the selected Player.", function(state)
    tween = state
    while tween do task.wait()
    lp.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")[playr].HumanoidRootPart.CFrame
    end
end)

local teleportextrasec = teleporttab:NewSection("Extra TP's")
teleportextrasec:NewButton("Teleport to Demon Flower", "Teleports you to a Demon Flower.", function()
    game.StarterGui:SetCore(
        "SendNotification",
        {
            Title = "Searching...",
            Text = "If Lily not found then render more chunks...",
            Icon = "",
            Duration = 15
        }
    )
    moveto(getDEMON().CFrame + Vector3.new(0, 0, 0), tonumber(125))

end)

teleportextrasec:NewButton("Teleport to Muzan", "Teleports you to Muzan.", function()
    moveto(CFrame.new(game:GetService("Workspace").Muzan.SpawnPos.Value) + Vector3.new(0, 0, 0), tonumber(125))
end)



local ESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/WhiteMan420/bub/main/chub"))()

local Waypoints = Instance.new("Folder", game.Workspace)
Waypoints.Name = "Waypoints"

local Butterfly_Mansion = Instance.new("Part", game.Workspace.Waypoints)
Butterfly_Mansion.Name = "Butterfly Mansion"
Butterfly_Mansion.Anchored = true
Butterfly_Mansion.CanCollide = false
Butterfly_Mansion.Position = Vector3.new(3001, 315, -3817)
Butterfly_Mansion.Transparency = 1

ESP:AddObjectListener(workspace.Waypoints, {
    Name = "Butterfly Mansion",
    CustomName = "Butterfly Mansion",
    Color = Color3.fromRGB(255,255,255),
    IsEnabled = "Butterfly_Mansion"
})

local function locateMuzan()
    if game.Workspace:FindFirstChild("Muzan") then
        if not game.Workspace.Waypoints:FindFirstChild("Muzan") then
            local Muzan = Instance.new("Part", game.Workspace.Waypoints)
            Muzan.Name = "Muzan"
            Muzan.Anchored = true
            Muzan.CanCollide = false
            Muzan.Position = Vector3.new(game:GetService("Workspace").Muzan.SpawnPos.Value)
            Muzan.Transparency = 1
        end
        else
            if game.Workspace.Waypoints:FindFirstChild("Muzan") then
                game.Workspace.Waypoints.Muzan:Destroy()
            end
        end
    end
    
    locateMuzan()

local Kiribating_Village = Instance.new("Part", game.Workspace.Waypoints)
Kiribating_Village.Name = "Kiribating Village"
Kiribating_Village.Anchored = true
Kiribating_Village.CanCollide = false
Kiribating_Village.Position = Vector3.new(107, 282, -1630)
Kiribating_Village.Transparency = 1

ESP:AddObjectListener(workspace.Waypoints, {
    Name = "Kiribating Village",
    CustomName = "Kiribating Village",
    Color = Color3.fromRGB(255,255,255),
    IsEnabled = "Kiribating_Village"
})

local Zapiwara_Cave = Instance.new("Part", game.Workspace.Waypoints)
Zapiwara_Cave.Name = "Zapiwara_Cave"
Zapiwara_Cave.Anchored = true
Zapiwara_Cave.CanCollide = false
Zapiwara_Cave.Position = Vector3.new(18, 275, -2569)
Zapiwara_Cave.Transparency = 1

ESP:AddObjectListener(workspace.Waypoints, {
    Name = "Zapiwara Cave",
    CustomName = "Zapiwara Cave",
    Color = Color3.fromRGB(255,255,255),
    IsEnabled = "Zapiwara_Cave"
})

local Zapiwara_Mountain = Instance.new("Part", game.Workspace.Waypoints)
Zapiwara_Mountain.Name = "Zapiwara Mountain"
Zapiwara_Mountain.Anchored = true
Zapiwara_Mountain.CanCollide = false
Zapiwara_Mountain.Position = Vector3.new(-326, 426, -2384)
Zapiwara_Mountain.Transparency = 1

ESP:AddObjectListener(workspace.Waypoints, {
    Name = "Zapiwara Mountain",
    CustomName = "Zapiwara Mountain",
    Color = Color3.fromRGB(255,255,255),
    IsEnabled = "Zapiwara_Mountain"
})

local Usumaru_Village = Instance.new("Part", game.Workspace.Waypoints)
Usumaru_Village.Name = "Usumaru Village"
Usumaru_Village.Anchored = true
Usumaru_Village.CanCollide = false
Usumaru_Village.Position = Vector3.new(-141, 353, -3039)
Usumaru_Village.Transparency = 1

ESP:AddObjectListener(workspace.Waypoints, {
    Name = "Usumaru Village",
    CustomName = "Usumaru Village",
    Color = Color3.fromRGB(255,255,255),
    IsEnabled = "Usumaru_Village"
})

local Waroru_Cave = Instance.new("Part", game.Workspace.Waypoints)
Waroru_Cave.Name = "Waroru Cave"
Waroru_Cave.Anchored = true
Waroru_Cave.CanCollide = false
Waroru_Cave.Position = Vector3.new(705, 260, -2395)
Waroru_Cave.Transparency = 1

ESP:AddObjectListener(workspace.Waypoints, {
    Name = "Waroru Cave",
    CustomName = "Waroru Cave",
    Color = Color3.fromRGB(255,255,255),
    IsEnabled = "Waroru_Cave"
})

local Kabiwaru_Village = Instance.new("Part", game.Workspace.Waypoints)
Kabiwaru_Village.Name = "Kabiwaru Village"
Kabiwaru_Village.Anchored = true
Kabiwaru_Village.CanCollide = false
Kabiwaru_VillagePosition = Vector3.new(1987, 326, -2903)
Kabiwaru_Village.Transparency = 1

ESP:AddObjectListener(workspace.Waypoints, {
    Name = "Kabiwaru Village",
    CustomName = "Kabiwaru Village",
    Color = Color3.fromRGB(255,255,255),
    IsEnabled = "Kabiwaru_Village"
})

local Abubu_Cave = Instance.new("Part", game.Workspace.Waypoints)
Abubu_Cave.Name = "Abubu Cave"
Abubu_Cave.Anchored = true
Abubu_Cave.CanCollide = false
Abubu_Cave.Position = Vector3.new(1042, 276, -3555)
Abubu_Cave.Transparency = 1

ESP:AddObjectListener(workspace.Waypoints, {
    Name = "Abubu Cave",
    CustomName = "Abubu Cave",
    Color = Color3.fromRGB(255,255,255),
    IsEnabled = "Abubu_Cave"
})

local Final_Selection = Instance.new("Part", game.Workspace.Waypoints)
Final_Selection.Name = "Final Selection"
Final_Selection.Anchored = true
Final_Selection.CanCollide = false
Final_Selection.Position = Vector3.new(5340, 372, -2424)
Final_Selection.Transparency = 1

ESP:AddObjectListener(workspace.Waypoints, {
    Name = "Final Selection",
    CustomName = "Final Selection",
    Color = Color3.fromRGB(255,255,255),
    IsEnabled = "Final_Selection"
})

local Ouwbayashi_Home = Instance.new("Part", game.Workspace.Waypoints)
Ouwbayashi_Home.Name = "Ouwbayashi Home"
Ouwbayashi_Home.Anchored = true
Ouwbayashi_Home.CanCollide = false
Ouwbayashi_Home.Position = Vector3.new(1268, 316, -4578)
Ouwbayashi_Home.Transparency = 1

ESP:AddObjectListener(workspace.Waypoints, {
    Name = "Ouwbayashi Home",
    CustomName = "Ouwbayashi Home",
    Color = Color3.fromRGB(255,255,255),
    IsEnabled = "Ouwbayashi_Home"
})

local Dangerous_Woods = Instance.new("Part", game.Workspace.Waypoints)
Dangerous_Woods.Name = "Dangerous Woods"
Dangerous_Woods.Anchored = true
Dangerous_Woods.CanCollide = false
Dangerous_Woods.Position = Vector3.new(3966, 342, -3989)
Dangerous_Woods.Transparency = 1

ESP:AddObjectListener(workspace.Waypoints, {
    Name = "Dangerous Woods",
    CustomName = "Dangerous Woods",
    Color = Color3.fromRGB(255,255,255),
    IsEnabled = "Dangerous_Woods"
})
-- ESP

local esptab = window:NewTab("ESP")
local espsettingssec = esptab:NewSection("ESP Setting's")
espsettingssec:NewToggle("Toggle ESP", "Toggles ESP on and off.", function(state)
    ESP:Toggle(state)
end)

espsettingssec:NewToggle("Toggle Boxes", "Toggles Boxes for esp.", function(state)
    ESP.Boxes = state
end)

local espsec = esptab:NewSection("ESP's")
espsec:NewToggle("Toggle Players", "Toggles Player ESP.", function(state)
    ESP.Players = state
end)

espsec:NewToggle("Toggle Areas", "Toggles Area ESP.", function(state)
    ESP.Butterfly_Mansion = state
            ESP.Kiribating_Village = state
            ESP.Zapiwara_Cave = state
            ESP.Zapiwara_Mountain = state
            ESP.Usumaru_Village = state
            ESP.Waroru_Cave = state
            ESP.Kabiwaru_Village = state
            ESP.Abubu_Cave = state
            ESP.Final_Selection = state
            ESP.Ouwbayashi_Home = state
            ESP.Dangerous_Woods = state
        end)


espsec:NewToggle("Toggle Muzan", "Toggles Muzan ESP.", function(state)
    ESP.Muzan = state
end)

espsec:NewToggle("Toggle Demon Flowers", "Toggles Demon Flower ESP.", function(state)
    print(state)
end)

-- Misc

local misctab = window:NewTab("Misc")
local miscinfsec = misctab:NewSection("Infinite")
miscinfsec:NewToggle("Infinite Breathing", "Automatically Breathe.", function(state)
    ue = state
    while ue do
        task.wait()
        getrenv()._G.AddBreath("",999999999)
    end
end)


miscinfsec:NewToggle("Infinite Stamina", "Never run out of Stamina.", function(state)
    ae = state
    while ae do
        task.wait()
        getrenv()._G.AddStamina("",999999999)
    end
end)

local miscfarmingsec = misctab:NewSection("Farming")
miscfarmingsec:NewToggle("Auto Soul", "Automatically eats souls.", function(state)
    be = state
    while be do
        task.wait()
            if game:GetService("Workspace").Debree:FindFirstChild("Soul") then
            game:GetService("VirtualInputManager"):SendKeyEvent(true,Enum.KeyCode.E,false,game)
        end
    end
end)

miscfarmingsec:NewToggle("Auto Chest", "Automatically grabs chests.", function(state)
    ez = state
    while ez do
                task.wait()
                pcall(
                    function()
                for i, v in next,game:GetService("Workspace").Debree["Loot_Chest"].Drops:GetChildren() do
                    if v.Parent.Name == "Drops" then
                local args = {
                    [1] = v.Name
                }
                
                workspace.Debree.Loot_Chest.Add_To_Inventory:InvokeServer(unpack(args))
                wait(0.5)
            end
        end
end)
    end
end)

local miscgourdsec = misctab:NewSection("Auto Gourd")
miscgourdsec:NewDropdown("Select Gourd", "Select an Gourd to blow. ;>", {"Small Gourd",
"Medium Gourd",
"Big Gourd"}, function(o)
    getgenv().go = o
end)

miscgourdsec:NewToggle("Auto Gourd", "Automatically grabs to blow.", function(state)
    gourd = state
    while gourd do
            local args = {
                [1] = "buysomething",
                [2] = game:GetService("Players").LocalPlayer,
                [3] = go,
                [4] = game:GetService("ReplicatedStorage").Player_Data[game.Players.LocalPlayer.Name].Yen,
                [5] = game:GetService("ReplicatedStorage").Player_Data[game.Players.LocalPlayer.Name].Inventory
            }
            game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(args))
            local argss = {
                [1] = "blow_in_gourd_thing",
                [2] = game:GetService("Players").LocalPlayer,
                [3] = game:GetService("Players").LocalPlayer.Character:FindFirstChild(go),
                [4] = 1
            }

            game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(unpack(argss))
            if game:GetService("Players")[game.Players.LocalPlayer.Name].Backpack:FindFirstChild(go) then
                game.Players.LocalPlayer:findFirstChildOfClass("Backpack")[go].Parent =
                game.Players.LocalPlayer.Character
                
        end
    end
end)

local miscplayersec = misctab:NewSection("Local Player")
miscplayersec:NewSlider("WalkSpeed", "Sets your WalkSpeed.", 500, 1, function(s)
    getgenv().speed = s
end)

miscplayersec:NewToggle("Toggle WalkSpeed", "Toggles your WalkSpeed.", function(state)
    gg = state
    while gg do
        task.wait()
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = speed
    end
end)

miscplayersec:NewSlider("JumpPower", "Sets your JumpPower.", 500, 1, function(s)
    getgenv().jump = s
end)

miscplayersec:NewToggle("Toggle JumpPower", "Toggles your JumpPower.", function(state)
    jj = state
    while jj do
        task.wait()
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = jump
    end
end)
miscplayersec:NewButton("Anti-Sun_Damage", "Don't take dmg from Sun", function()
    local mt = getrawmetatable(game)
    make_writeable(mt)
    
    local namecall = mt.__namecall
    
    mt.__namecall = newcclosure(function(self, ...)
        local method = getnamecallmethod()
        local args = {...}
    
        if method == "FireServer" and tostring(self) == "Sun_Damage" then
           return
        end
        return namecall(self, table.unpack(args))
    end)
end)

local webtab = window:NewTab("Webhooks")
local webhook = webtab:NewSection("Webhooks")

webhook:NewTextBox("Webhook Url", "Input Webhook Url Here", function(o)
	getgenv().weburl = o
end)

webhook:NewToggle("Webhook Drops", "Toggles your Webhook for Drops.", function(state)
    wd = state
    while wd do
        task.wait()
        pcall(
                    function()
                        if game:GetService("Players").TheDarthVath.PlayerGui.Notification["Text_Notification"]:FindFirstChild("New_Item") then
        local discordId = "377208984043651085"
        local url = weburl
        local data = {
           ["content"] = "<@"..discordId.."> keybrew on top no cap best hub",
           ["embeds"] = {
               {
                   ["title"] = "You have recieved a drop:".. game.Players.LocalPlayer.PlayerGui.Notification["Text_Notification"].New_Item.Ex.TextLabel.Text,
                   ["description"] = "Username: ||" .. game.Players.LocalPlayer.Name.."||",
                   ["type"] = "rich",
                   ["color"] = tonumber(0x7269da),
                   ["image"] = {
                   }
               }
           }
        }
        local newdata = game:GetService("HttpService"):JSONEncode(data)
        
        local headers = {
           ["content-type"] = "application/json"
        }
        request = http_request or request or HttpPost or syn.request
        local sendWebhook = {Url = url, Body = newdata, Method = "POST", Headers = headers}
        request(sendWebhook)
        task.wait(3)
    end
end)
end
end)

webhook:NewToggle("Webhook Level", "Toggles your Webhook for Levels.", function(state)
    wl = state
    while wl do
        task.wait()
        local discordId = "377208984043651085"
        local url = weburl
        local data = {
           ["content"] = "<@"..discordId.."> keybrew on top no cap best hub",
           ["embeds"] = {
               {
                   ["title"] = "You are level:" .. game.Players.LocalPlayer.PlayerGui.Menu.Bars["Level_text"].Text,
                   ["description"] = "Username: ||" .. game.Players.LocalPlayer.Name.."||",
                   ["type"] = "rich",
                   ["color"] = tonumber(0x7269da),
                   ["image"] = {
                   }
               }
           }
        }
        local newdata = game:GetService("HttpService"):JSONEncode(data)
        
        local headers = {
           ["content-type"] = "application/json"
        }
        request = http_request or request or HttpPost or syn.request
        local sendWebhook = {Url = url, Body = newdata, Method = "POST", Headers = headers}
        request(sendWebhook)
        task.wait(5)
end
end)



-- Settings

local settingstab = window:NewTab("Settings")
local settingsuisec = settingstab:NewSection("UI Settings")
settingsuisec:NewKeybind("Toggle UI Keybind", "Toggles the UI with the use of a key.", Enum.KeyCode.RightControl, function()
	library:ToggleUI()
end)
end)
end


local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
