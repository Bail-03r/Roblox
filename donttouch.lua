
local AkaliNotif = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/Dynissimo/main/Scripts/AkaliNotif.lua"))();
local Notify = AkaliNotif.Notify;

function main()
    
    
    pcall(function()
        repeat wait(1) until game.Players.LocalPlayer.Character:FindFirstChild("Head")
    end)
    local rejoin = function()
        local ts = game:GetService("TeleportService")
        local p = game:GetService("Players").LocalPlayer
        ts:Teleport(game.PlaceId, p)
    end
    local noclip = function()
        getgenv().oclip = game.RunService.Stepped:Connect(function()
            for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren())  do
                if v:IsA('BasePart') then
                    v.CanCollide = false 
                end
            end
        end)
    end
    local clip = function()
        oclip:Disconnect()
    end
    local str = {};
    local split = function(inputstr, sep)
        if sep == nil then
            sep = "%s"
        end
        local t={}
        for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
            table.insert(t, str)
        end
        return t
    end
    
    --SummonEffect ["You execute", "fuck", "bqhax|Company|"], ScreenShake [], onFreeFall [goofy walk],  

    local SummonEffect
    local ScreenShake
    local onFreeFall
    
    --dumping
    for i,v in pairs(getgc()) do
        if type(v) == 'function' and not is_synapse_function(v) and getinfo(v).name ~= '' then
            if getinfo(v).name == "SummonEffect" then
                SummonEffect = v
            elseif getinfo(v).name == "ScreenShake" then
                ScreenShake = v
            elseif getinfo(v).name == "onFreeFall" then
                onFreeFall = v
            end
        end
    end
    
    if not workspace:FindFirstChild("UnderGround") then
        local part      = Instance.new('Part', workspace)
        part.CFrame     = CFrame.new(0,150,0)
        part.Anchored   = true
        part.Size       = Vector3.new(85000,50,85000)
        part.Name       = 'UnderGround'
    end
    
    local _ = {}
     
    function _.exist(text)
        local much = 0
        local path = {}
        for i,v in pairs(game:GetDescendants()) do
            if v.Name == text then
                much += 1
                table.insert(path, v)
            end
        end
        if much > 0 then
            return true, much, path
        else
            return false, much, path
        end
    end
     
    function _.string_split (inputstr, sep)
        if sep == nil then
            sep = "%s"
        end
        local t={}
        for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
            table.insert(t, str)
        end
        return t
    end
     
    function _.call (fname)
        local status, error = pcall(function()
            return fname()
        end)
    end
     
    function _.misc_loadstring (link)
       local response = syn.request({Url = link, Method = "GET"})
       loadstring(response.Body)()
    end
    
    function _.metatable_index (one, two, fixreturn, callback)
        local old = nil
        old = hookmetamethod(game, '__index', function(...)
            local Self, Key = ...
            if Self == one and Key == two then
                pcall(callback)
                return fixreturn
            end
            return old(...)
        end)
    end
    
    local x, y, z, delay = 0, 0, -500, .1
    
    function bypasstp(cafarame)
        noclip()
        local physic = game.RunService.Heartbeat:connect(function()
            game.Players.LocalPlayer.Character.Humanoid:ChangeState(1)
            game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(x,y,z)
        end)
        task.wait(delay)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = cafarame
        game.Players.LocalPlayer.Character.Humanoid:ChangeState(2)
        for i=1, 10 do
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = cafarame
            task.wait()
        end
        physic:Disconnect()
        game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = cafarame
        clip()
    end
    
    function bypasstppart(part, xc,yc,zc)
        noclip()
        local physic = game.RunService.Heartbeat:connect(function()
            game.Players.LocalPlayer.Character.Humanoid:ChangeState(1)
            game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(x,y,z)
        end)
        task.wait(delay)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = part.CFrame * CFrame.new(xc,yc,zc)
        game.Players.LocalPlayer.Character.Humanoid:ChangeState(2)
        for i=1, 10 do
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = part.CFrame * CFrame.new(xc,yc,zc)
            task.wait()
        end
        physic:Disconnect()
        game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = part.CFrame * CFrame.new(xc,yc,zc)
        clip()
    end
    
    function dropplayer()
       -- Script generated by SimpleSpy - credits to exx#9394

        local args = {
            [1] = "Grabbing",
            [2] = false
        }
        
        game:GetService("ReplicatedStorage").MainRemote:FireServer(unpack(args))
         
    end
    
    function statusko()
        return game.Players.LocalPlayer.Character['I_LOADED_I']['K.O'].Value
    end
    
    SummonEffect("You execute script from", "Red", "bqhax|Company|")
    
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
    local Window = Library.CreateLib("bqhax|Company|[DaModded] #include<0x8q11#1553.h>", "DarkTheme")
    local Tab = Window:NewTab("misc")
    
    local character = game.Players.LocalPlayer.Character
    local guns = game:GetService("Workspace").Shop.Guns
    local pos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    
    local Section = Tab:NewSection("needed")
    Section:NewButton("anti stomp", "", function()
        game.Players.LocalPlayer.Character.Humanoid.Died:connect(function()
            wait()
            game.Players.LocalPlayer.Character:Destroy()
        end)
        game.Players.LocalPlayer.Character.RagdollConstraints:ClearAllChildren()
    end)
    
    Section:NewButton("aimlock", "", function()
        _.misc_loadstring("https://gist.githubusercontent.com/Bail-03r/55d85fa9afacef0b2f86e0a570b33b33/raw/0f73709d5a616812515130685a9b92e58f131684/aimlock.lua")
    end)
    
    Section:NewButton("kick player", "", function()
        local oldpos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        bypasstp(CFrame.new(0,99999999,0))
        task.wait(1)
        dropplayer()
        task.wait(2)
        bypasstp(oldpos)
    end)
    
    local Section = Tab:NewSection("world")
    Section:NewButton("break all seats", "", function()
        for i,v in ipairs(workspace:GetDescendants()) do
           if v:IsA("Seat") then
               v:Destroy()
            end
        end
    end)
    
    local Section = Tab:NewSection("Camera")
    
    Section:NewToggle("Camera Invis", "ToggleInfo", function(state)
        if state then
            game.Players.LocalPlayer.DevCameraOcclusionMode = "Invisicam"
        else
            game.Players.LocalPlayer.DevCameraOcclusionMode = "Zoom"
        end
    end)
    
    local Tab = Window:NewTab("guns")
    local Section = Tab:NewSection("")
    for i,v in ipairs(guns:GetDescendants()) do
        if v:IsA("Model") then
            Section:NewButton(v.Name .. " | Streak: " .. v.Level.Value, "", function()
    
                bypasstppart(v.Head, 0, 10, 0)
            end)
        end
    end
    Section:NewButton("hitman", "", function()
        bypasstp(CFrame.new(-964.924011, 330.654327, 136.560898))
    end)
    
    local Tab = Window:NewTab("Player")
    local Section = Tab:NewSection("")
    Section:NewButton("goofy walk", "", function()
        setconstant(onFreeFall, 3, 5)
        onFreeFall()
    end)
    
    local Tab = Window:NewTab("Players")
    
    local Section = Tab:NewSection("")
    
    for i,player in ipairs(game.Players:GetChildren()) do
        Section:NewButton(player.Name.. " (".. player.DisplayName..")", "", function()
      
            bypasstppart(player.Character.HumanoidRootPart, 3, 0, 0)
        end)
        Section:NewButton('spectate '..player.Name.. " (".. player.DisplayName..")", "", function()
      
            workspace.CurrentCamera.CameraSubject = player.Character.Humanoid
        end)
    end
    
end

if game.Players.LocalPlayer:IsInGroup(14199017) then
    main()
else
    Notify({
    Description = "grrrr";
    Title = "to execute script you need join in bqhax|Company|";
    Duration = 5;
    });
end
