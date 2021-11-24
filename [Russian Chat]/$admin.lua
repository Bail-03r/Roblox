--START

--BULLET FLING

if Executed == true then
    local Notification = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Stefanuk12/ROBLOX/master/Universal/Notifications/Script.lua"))()
    Notification.newNotification("$Admin$", "AllReady Executed", "uwu")
else
getgenv().Executed = true


--SETTINGS

local detectSkid = false --NOT WORK
local checkerAdmins = false --NOT WORK
local prefix = "$" --NOT WORK
local hideNick = false
local timeCrash = .1

--

--CHECKS
if hideNick == true then
    game.RunService.RenderStepped:connect(function()
        for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
            if v:IsA("BillboardGui") then
                v:Destroy()
            end
        end
    end)
end

if checkerAdmins == true then

end
--

local mt = getrawmetatable(game)
local old = mt.__namecall
local Players = game.Players

setreadonly(mt, false)
mt.__namecall = newcclosure(function(self,...) [nonamecall]
local args = {...}
local method = getnamecallmethod()
    if self == Players.LocalPlayer and (method == "kick" or method == "Kick") then
        print("Sikkeee") 
        return wait(math.huge)
    end
    return old(self,...)
end)
setreadonly(mt, true)

game.StarterGui:SetCore("SendNotification", {
    Title = "$Admin$",
    Text = "Script By 0x8q11#3019\nDocumentation By 0x7w1n36#9392",
    Duration = 10
})


--START

game.Players.PlayerAdded:Connect(function(v)
    if v.Name=="boganan"then

        local Notification = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Stefanuk12/ROBLOX/master/Universal/Notifications/Script.lua"))()
        Notification.newNotification("$Admin$", "boganan join on server", "uwu")

        for i=1,5 do
        
            local args = {
                [1] = "УРА СОЗДАТЕЛЬ АДМИН СКРИПТА ЗАШЁЛ НА СЕРВЕР - boganan",
                [2] = "All"
            }
            
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
        
        end
    end
end)

--FUNCTIONS

local getcurrentcamera = function()
    return workspace.CurrentCamera
end

local worldtoviewportpoint = function(part)
    local point = getcurrentcamera():WorldToViewportPoint(part.Position)
    return Vector2.new(point.x, point.y)
end

local getrespawntime = function()
    return game.Players.RespawnTime
end

local getbackpack = function()
   return game.Players.LocalPlayer.Backpack 
end

local gethumanoid = function()
   return game.Players.LocalPlayer.Character.Humanoid 
end

local gethumanoidroot = function()
   return game.Players.LocalPlayer.Character.HumanoidRootPart 
end

local getplayer = function()
    return game.Players.LocalPlayer
end

local getcharacter = function()
    return game.Players.LocalPlayer.Character
end

local getplayerlist = function()
   return game.Players 
end

local getcurrentcframe = function()
   return game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame 
end

local delete = function()
    local Notification = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Stefanuk12/ROBLOX/master/Universal/Notifications/Script.lua"))()
    Notification.newNotification("$Admin$", "Delete Command", "uwu")
end

local notfound = function()
    local Notification = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Stefanuk12/ROBLOX/master/Universal/Notifications/Script.lua"))()
    Notification.newNotification("$Admin$", "Player Not Found", "uwu")
end

--CMD FUNCTIONS

local ping = function()
    if not syn.request then
        return
    end
    local function notif(title, text, duration)
        game.StarterGui:SetCore("SendNotification", {
            Title = title,
            Text = text,
            Duration = duration
        })
    end
    local data
    local id = game.JobId
    local cursor = ""
    for i = 1, math.huge do
        if cursor ~= "" then
            data = syn.request({Url = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100&cursor=" .. cursor, Method = "GET"})
        else
            data = syn.request({Url = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100", Method = "GET"})
        end
        data.Body = game.HttpService:JSONDecode(data.Body)
        local bod = data.Body
        if data.StatusCode ~= 200 then
            break
        end
        if bod["nextPageCursor"] ~= nil then
            cursor = bod["nextPageCursor"]
        else
            cursor = "f"
        end
        for i, v in pairs(bod.data) do
            if v["id"] == id then
                --[[for i, v in pairs(v) do
                    print(i, v)
                end]]
                if v["ping"] == nil then
                    v["ping"] = "no ping??"
                end
                --game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("fps: " .. v["fps"] .. " | " .. "ping: " .. v["ping"], "All")
                notif("ServerStatus", "fps: " .. v["fps"] .. "\n" .. "ping: " .. v["ping"] .. "\n" .. "attempt: " .. i, 5)
                break
            end
        end
        wait()
    end
end

local replacehumanoid = function()
    local hum=getcharacter().Humanoid
    local fakehum=hum:Clone()
    fakehum.Parent = hum.Parent
    fakehum.Name = "1"
    fakehum.Animator:Destroy()
    hum:Destroy()
    fakehum.Name = "Humanoid" 
end

local www = function()
    local shortName = player 
    shortName = string.lower(shortName)
    
    for _,plr in pairs(game.Players:GetChildren()) do
        local fullName = string.lower(plr.Name) 
        if shortName == string.sub(fullName,1,string.len(shortName)) then 
            return getplayerlist():FindFirstChild(fullName)
        end
    end
end

local function shortName(s)
    s = s:lower()
    for _, player in ipairs(game.Players:GetPlayers()) do
        if s == player.Name:lower():sub(1, #s) then
            local name = player.Name
            if name ~= "boganan" then
                return game:GetService("Players"):FindFirstChild(name)
            else
                local Notification = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Stefanuk12/ROBLOX/master/Universal/Notifications/Script.lua"))()
                Notification.newNotification("$Admin$", "you cant touch boganan", "uwu")
            end
        end
    end
    return nil
end

--COMMANDS

getplayer().Chatted:Connect(function(msg)
   
    if msg:lower():sub(1,15) == "/e $netlessLag " then
       text = msg:sub(16)

       local txt = shortName(text)

        game:GetService('RunService').Heartbeat:connect(function()
            for i, v in pairs(workspace[txt]:GetDescendants()) do
                if v:IsA("BasePart") then
                        sethiddenproperty(v, "NetworkIsSleeping", true)
                    end
                end
            end)
       
       game.StarterGui:SetCore("SendNotification", {
            Title = "$netlessLag$",
            Text = txt,
            Duration = 5
        })
       
    end
    
end)

getplayer().Chatted:Connect(function(msg)
   
    if msg == "/e $serverState" then
       
       ping()
       
    end
    
end)

getplayer().Chatted:Connect(function(msg)
   
    if msg == "/e $HDchecker" then
       
       local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
       local Window = Library.CreateLib("Checker Admins", "DarkTheme")
       local Tab = Window:NewTab("")
       local Section = Tab:NewSection("Output")

       for _,v in ipairs(getplayer().PlayerGui:GetDescendants()) do

        if v:IsA("Frame") and v.Parent.Name == "Server Ranks" then
            local nickname = v:FindFirstChild("PlrName").Text

            Section:NewLabel(nickname)
        end
       end
       
    end
    
end)

getplayer().Chatted:Connect(function(msg)
   
    if msg:lower():sub(1,7) == "/e $tp " then
       text = msg:sub(8)

       local target = shortName(text)

        if target and target.Name~="boganan" then
            gethumanoidroot().CFrame = target.Character.Head.CFrame * CFrame.new(0,0,5)
        else
            notfound()
        end
           
    end
    
end)

getplayer().Chatted:Connect(function(msg)
   
    if msg:lower():sub(1,8) == "/e $fov " then
       txt = msg:sub(9)

        getcurrentcamera().FieldOfView = txt
       
    end
    
end)

getplayer().Chatted:Connect(function(msg)
   
    if msg:lower():sub(1,10) == "/e $tween " then
        text = msg:sub(11)

        target = shortName(text)

        if target and target.Name~="boganan" then

            local tween = game:GetService("TweenService")
            local part = gethumanoidroot()
            
            local info = TweenInfo.new(
                3, --длина
                Enum.EasingStyle.Linear, --стиль
                Enum.EasingDirection.In, --направление
                0, --сколько раз
                false, --возращение
                0 --задержка
            )
            
            local go = 
                {
                    CFrame = target.Character.Head.CFrame
                }
            
            tween:Create(part, info, go):Play()
       
        else

        notfound()

        end

    end
    
end)

getplayer().Chatted:connect(function(msg)
    if msg == "/e $wakaMode" then
        
        for i=1 , 5 do
        
        local args = {
            [1] = "PirateCrew Best Game",
            [2] = "All"
        }
        
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
        
        end
    end
end)

getplayer().Chatted:connect(function(msg)
    if msg == "/e $fireClickDetectors" then
        
        for i,v in pairs(workspace:GetDescendants()) do
        
            if v:IsA("ClickDetector") then
               
               fireclickdetector(v)
                
            end
        
        end
        
    end
end)

getplayer().Chatted:connect(function(msg)
    if msg == "/e $fireTouchInterest" then
        
        for i,v in pairs(workspace:GetDescendants()) do
        
            if v:IsA("Part") or v:IsA("Mesh") then
               
               firetouchinterest(getcharacter().Torso, v, 0)
                
            end
           
        end
       
    end
end)

getplayer().Chatted:connect(function(msg)
    if msg == "/e $crash" then
        
        if getplayerlist():FindFirstChild("boganan") then

            local Notification = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Stefanuk12/ROBLOX/master/Universal/Notifications/Script.lua"))()
            Notification.newNotification("$Admin$", "boganan on server", "uwu")

        else

            pos = getcurrentcframe()
        
            getcurrentcamera().CameraType = "Fixed"
            
            gethumanoidroot().CFrame = CFrame.new(9999999,9999999,9999999)
            
            wait(timeCrash)
            
            gethumanoidroot().CFrame = pos
            
            getcurrentcamera().CameraType = "Track"
        
        end
    end
end)
--TWINED MOMENT
getplayer().Chatted:connect(function(msg)
    if msg == "/e $prolag" then
        
        if getplayerlist():FindFirstChild("boganan") then

            local Notification = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Stefanuk12/ROBLOX/master/Universal/Notifications/Script.lua"))()
            Notification.newNotification("$Admin$", "boganan on server", "uwu")

        else

            pos = getcurrentcframe()
        
            workspace.Camera.CameraType = "Fixed"
            
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(100000,100000,100000)
            
            wait(.1)
            
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
            
            wait(2)
            
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(100000,100000,100000)
            
            wait(.1)
            
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
            
            
            
            workspace.Camera.CameraType = "Track"
        

        end
    end
end)
--
getplayer().Chatted:connect(function(msg)
    if msg == "/e $chams" then
        
        pcall(function()

        for i,v in pairs(getplayerlist():GetDescendants()) do
        
            if v:IsA("Player") and v.Name ~= game.Players.LocalPlayer.Name then
               
                if v.Character.HumanoidRootPart:FindFirstChild("chams") then
                   
                else
                
                    local chams = Instance.new("BoxHandleAdornment", v.Character.HumanoidRootPart)
                
                    chams.Name = "chams"
                    chams.Color3 = Color3.new(255,255,255)
                    chams.Size = Vector3.new(2,2,1)
                    chams.ZIndex = 5
                    chams.AlwaysOnTop = true
                    chams.Adornee = v.Character.HumanoidRootPart
                
                end
                
            end

        end

        end)
        
    end
end)

getplayer().Chatted:connect(function(msg)
    if msg == "/e $nochams" then
        
        pcall(function()

        for i,v in pairs(getplayerlist():GetChildren()) do
        
            if v:IsA("Player") and v.Name ~= game.Players.LocalPlayer.Name then

                v = v.Character

                if v.HumanoidRootPart:FindFirstChild("chams") then
                
                    v.HumanoidRootPart.chams:Destroy()
                   
                end
                
            end
        
        end

        end)
        
    end
end)

getplayer().Chatted:connect(function(msg)
    if msg == "/e $lineEsp" then

        local esp = function()

            for i,v in pairs(game.Players:GetChildren()) do

                if v:IsA("Player") and v.Name ~= game.Players.LocalPlayer.Name then

                    v = v.Character

                    local Line = Drawing.new("Line")
                    Line.Visible = true
                    Line.From = Vector2.new(1000, 1000)
                    Line.To = worldtoviewportpoint(v.HumanoidRootPart)
                    Line.Color = Color3.fromRGB(255, 255, 255)
                    Line.Thickness = 2

                    wait()

                    Line:Remove() --Drawing objects are manually managed.

                end

            end

        end

        game.RunService.Heartbeat:connect(function()
            esp()
        end)
        
    end
end)

getplayer().Chatted:connect(function(msg)
    if msg:lower():sub(1,9)=="/e $play " then
        id = msg:sub(10)

        local args = {
            [1] = "PlaySong",
            [2] = id
        }
        
        game:GetService("Players").LocalPlayer.Character.BoomBoxTool.Handle.RemoteEvent:FireServer(unpack(args))
        
    end
end)

getplayer().Chatted:connect(function(msg)
    if msg:lower():sub(1,9)=="/e $view " then
        text = msg:sub(10)

        target = shortName(text)

        if target then
            getcurrentcamera().CameraSubject = target.Character.Humanoid
        else
            notfound()
        end
        
    end
end)

getplayer().Chatted:connect(function(msg)
    if msg == "/e $unview" then

        getcurrentcamera().CameraSubject = gethumanoid()
        
    end
end)

getplayer().Chatted:connect(function(msg)
    if msg:lower():sub(1,17)=="/e $hookFunction " then
        txt = msg:sub(18)
        da = msg:sub(20)

        hookfunction(game.Players.LocalPlayer[txt], function()
           
           return da
            
        end)
        
    end
end)

getplayer().Chatted:connect(function(msg)
    if msg:lower():sub(1,10)=="/e $blink " then
        x = msg:sub(11)

        y = msg:sub(13)

        z = msg:sub(15)

        gethumanoidroot().CFrame = gethumanoidroot().CFrame * CFrame.new(x,y,z)
        
    end
end)

getplayer().Chatted:connect(function(msg)
    if msg:lower():sub(1,13)=="/e $giveTool " then
        text = msg:sub(14)
        
        local target = shortName(text)
        
        if target then
            
            local Notification = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Stefanuk12/ROBLOX/master/Universal/Notifications/Script.lua"))()
            Notification.newNotification("$Admin$", "Trying kick " .. target.Name, "uwu")

            for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
           
                if v:IsA("BillboardGui") then
                
                    v:Destroy()
                   
                end
                
            end

            tchar = target.Character

            getcurrentcamera().CameraSubject = tchar.Head
            
            local pos = getcharacter().HumanoidRootPart.CFrame
            
            replacehumanoid()
            
            for i,v in pairs(getplayer().Backpack:GetChildren()) do
                if v:IsA("Tool") then
                    v.Parent = getcharacter()  
                end
            end
            
            for i=1, 10 do
            wait()
            getcharacter().Humanoid:ChangeState(11)
            getcharacter().HumanoidRootPart.CFrame = tchar.HumanoidRootPart.CFrame
            end

        else
            notfound()
        end
        
    end
    
end)

getplayer().Chatted:connect(function(msg)
    if msg == "/e $stun" then
        
        if gethumanoid().PlatformStand == false then
        
            gethumanoid().PlatformStand = true
            
        else
            
            gethumanoid().PlatformStand = false
        
        end
    
    end
    
end)

getplayer().Chatted:connect(function(msg)
    if msg == "/e $inf" then
        
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    
    end
    
end)

getplayer().Chatted:connect(function(msg)
    if msg == "/e r6 $antiKill" then
        
        getcharacter()["Right Arm"]:Destroy()
    
    end
    
end)

getplayer().Chatted:connect(function(msg)
    if msg == "/e $refresh" then
        
        pos = getcurrentcframe()
        
        getcharacter():ClearAllChildren()
        
        wait(getrespawntime() + .5)
        
        gethumanoidroot().CFrame = pos
    
    end
    
end)

getplayer().Chatted:connect(function(msg)
    if msg == "/e $noclip" then
        
        while game:GetService("RunService").RenderStepped:wait() do

            gethumanoid():ChangeState(11)

        end
    
    end
    
end)

getplayer().Chatted:connect(function(msg)
    if msg == "/e $safeRefresh" then
        
        pos = getcurrentcframe()
        
        for i,v in pairs(getcharacter():GetChildren()) do
            if v:IsA("Part") or v:IsA("MeshPart") then
                v.Anchored = true
            end
        end

        gethumanoid().Health = 0
        
        wait(getrespawntime() + 1)
        
        gethumanoidroot().CFrame = pos
    
    end
    
end)

getplayer().Chatted:connect(function(msg)
    if msg == "/e $destroyBillboard" then
        
        for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
           
            if v:IsA("BillboardGui") then
            
                v:Destroy()
               
            end
            
        end
        
    end
end)

getplayer().Chatted:connect(function(msg)
    if msg == "/e $antiKick" then
        
        delete()
        
    end
end)

getplayer().Chatted:connect(function(msg)
    if msg == "/e $noFace" then
        
        game.Players.LocalPlayer.Character.Head.face:Destroy()
        
    end
end)

getplayer().Chatted:connect(function(msg)
    if msg == "/e $disableLocalSide" then
        
        for i,v in pairs(game:GetDescendants()) do
            if v:IsA("LocalScript") or v.Name ~= "ChatService" or v.Name ~= "BubbleChat" or v.Name ~= "PlayerScriptsLoader" then
            
                v:Destroy()
                
            end
        end
        
    end
end)

getplayer().Chatted:connect(function(msg)
    if msg == "/e $destroyHumanoid" then
        
        pos = getcurrentcframe()
        
        replacehumanoid()
        
        wait(getrespawntime() + 2)
        
        gethumanoidroot().CFrame = pos
        
    end
end)

getplayer().Chatted:connect(function(msg)
    if msg == "/e $destroyMesh" then
        
        for i,v in pairs(getcharacter():GetDescendants()) do
           
            if v:IsA("Tool") then
            
                v.Handle.Mesh:Destroy()
               
            end
            
        end
        
    end
end)

getplayer().Chatted:connect(function(msg)
    if msg == "/e $audioLogger" then
        
        local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
        local Window = Library.CreateLib("$audioLogger", "DarkTheme")
        local Tab = Window:NewTab("")
        local Section = Tab:NewSection("")

        for i,v in pairs(workspace:GetDescendants()) do

            if v:IsA("Sound") and v.SoundId ~= "" then

                Section:NewButton(v.SoundId, "", function()
                    setclipboard(v.SoundId)
                end)

            end

        end

   

    end
    
end)

getplayer().Chatted:connect(function(msg)
    if msg == "/e $rejoin" then
        
        local ts = game:GetService("TeleportService")
        local p = game:GetService("Players").LocalPlayer
        ts:Teleport(game.PlaceId, p)
        
    end
end)

getplayer().Chatted:connect(function(msg)
    if msg == "/e $openSouce" then

        setclipboard("https://gist.githubusercontent.com/Bail-03r/1afc04403983d5d665fc3c102dd14736/raw/a0115cd5fbbd07a279101f6d4859cf979faaa376/adminka.lua")

    end
end)

getplayer().Chatted:connect(function(msg)
    if msg == "/e $kickAll" then
        for i,v in pairs(getplayerlist():GetChildren()) do
            if v:IsA("Player") and v.Name ~= game.Players.LocalPlayer.Name then
                local Notification = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Stefanuk12/ROBLOX/master/Universal/Notifications/Script.lua"))()
                Notification.newNotification("$Admin$", "Trying kick " .. target.Name, "uwu")

                tchar = target.Character

                getcurrentcamera().CameraSubject = tchar.Head
                
                local pos = getcharacter().HumanoidRootPart.CFrame
                
                replacehumanoid()
                
                for i,v in pairs(getplayer().Backpack:GetChildren()) do
                    if v:IsA("Tool") then
                        v.Parent = getcharacter()  
                    end
                end
                
                for i=1, 10 do
                wait()
                getcharacter().Humanoid:ChangeState(11)
                getcharacter().HumanoidRootPart.CFrame = tchar.HumanoidRootPart.CFrame
                end
                
                wait()

                for i=1 , 3 do
                    wait(.2)
                    getcharacter().HumanoidRootPart.CFrame = getcharacter().HumanoidRootPart.CFrame * CFrame.new(0,-90,0)
                end

                getcharacter().HumanoidRootPart.Anchored = true
                
                for i,v in pairs(getcharacter():GetDescendants()) do
                    if v:IsA("Tool") then
                       v.Parent = getbackpack()
                    end
                end
            end
        end 
    end
end)

getplayer().Chatted:connect(function(msg)
   
    if msg:lower():sub(1,10)=="/e $bring "then
        text=msg:sub(11)
        
        local target = shortName(text)
        
        if target then
            
            tchar = target.Character

            getcurrentcamera().CameraSubject = tchar.Head
            
            local pos = getcharacter().HumanoidRootPart.CFrame
            
            replacehumanoid()
            
            for i,v in pairs(getplayer().Backpack:GetChildren()) do
                if v:IsA("Tool") then
                    v.Parent = getcharacter()  
                end
            end
            
            for i=1, 10 do
            wait()
            getcharacter().Humanoid:ChangeState(11)
            getcharacter().HumanoidRootPart.CFrame = tchar.HumanoidRootPart.CFrame
            end
            
            wait()

            getcharacter().HumanoidRootPart.CFrame = pos
        else
            notfound()
        end
    
    end

end)

getplayer().Chatted:connect(function(msg)
   
    if msg:lower():sub(1,9)=="/e $kick "then
        text=msg:sub(10)
        
        local target = shortName(text)
        
        if target then
            
            local Notification = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Stefanuk12/ROBLOX/master/Universal/Notifications/Script.lua"))()
            Notification.newNotification("$Admin$", "Trying kick " .. target.Name, "uwu")

            for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
           
                if v:IsA("BillboardGui") then
                
                    v:Destroy()
                   
                end
                
            end

            tchar = target.Character

            getcurrentcamera().CameraSubject = tchar.Head
            
            local pos = getcharacter().HumanoidRootPart.CFrame
            
            replacehumanoid()
            
            for i,v in pairs(getplayer().Backpack:GetChildren()) do
                if v:IsA("Tool") then
                    v.Parent = getcharacter()  
                end
            end
            
            for i=1, 10 do
            wait()
            getcharacter().Humanoid:ChangeState(11)
            getcharacter().HumanoidRootPart.CFrame = tchar.HumanoidRootPart.CFrame
            end
            
            wait()

            for i=1 , 3 do
                wait(.2)
                getcharacter().HumanoidRootPart.CFrame = getcharacter().HumanoidRootPart.CFrame * CFrame.new(0,-90,0)
            end

            getcharacter().HumanoidRootPart.Anchored = true
            
            for i,v in pairs(getcharacter():GetDescendants()) do
                if v:IsA("Tool") then
                   v.Parent = getbackpack()
                end
            end

        else
            notfound()
        end
    
    end

end)
--TWINED MOMENT
getplayer().Chatted:connect(function(msg)
   
    if msg:lower():sub(1,13)=="/e $fastKick "then
        text=msg:sub(14)
        
        local target = shortName(text)
        
        if target then
            
            local Notification = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Stefanuk12/ROBLOX/master/Universal/Notifications/Script.lua"))()
            Notification.newNotification("$Admin$", "Trying kick " .. target.Name, "uwu")

            for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
           
                if v:IsA("BillboardGui") then
                
                    v:Destroy()
                   
                end
                
            end

            tchar = target.Character

            getcurrentcamera().CameraSubject = tchar.Head
            
            local pos = getcharacter().HumanoidRootPart.CFrame
            
            replacehumanoid()
            
            for i,v in pairs(getplayer().Backpack:GetChildren()) do
                if v:IsA("Tool") then
                    v.Parent = getcharacter()  
                end
            end
            
            for i=1, 10 do
            wait()
            getcharacter().Humanoid:ChangeState(11)
            getcharacter().HumanoidRootPart.CFrame = tchar.HumanoidRootPart.CFrame
            end
            
            wait()

            for i=1 , 100 do
                getcharacter().HumanoidRootPart.CFrame = getcharacter().HumanoidRootPart.CFrame * CFrame.new(0,1000,0)
                wait()
                getcharacter().HumanoidRootPart.CFrame = getcharacter().HumanoidRootPart.CFrame * CFrame.new(0,-1000,0)
            end

        else
            notfound()
        end
    
    end

end)
--
getplayer().Chatted:connect(function(msg)
   
    if msg:lower():sub(1,14)=="/e $forceKick "then
        text=msg:sub(15)
        
        local target = shortName(text)
        
        if target then
            
            local Notification = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Stefanuk12/ROBLOX/master/Universal/Notifications/Script.lua"))()
            Notification.newNotification("$Admin$", "Trying kick " .. target.Name, "uwu")

            tchar = target.Character

            getcurrentcamera().CameraSubject = tchar.Head
            
            local pos = getcharacter().HumanoidRootPart.CFrame
            
            replacehumanoid()
            
            for i,v in pairs(getplayer().Backpack:GetChildren()) do
                if v:IsA("Tool") then
                    v.Parent = getcharacter()  
                end
            end
            
            for i=1, 10 do
            wait()
            getcharacter().Humanoid:ChangeState(11)
            getcharacter().HumanoidRootPart.CFrame = tchar.HumanoidRootPart.CFrame
            end
            
            wait()

            for i=1 , 5 do
                wait(.5)
                getcharacter().HumanoidRootPart.CFrame = getcharacter().HumanoidRootPart.CFrame * CFrame.new(0,-50,0)
            end

            getcharacter().HumanoidRootPart.Anchored = true
            
            for i,v in pairs(getcharacter():GetDescendants()) do
                if v:IsA("Tool") then
                   v.Parent = getbackpack()
                end
            end


        else
            notfound()
        end
    
    end

end)

getplayer().Chatted:connect(function(msg)
   
    if msg:lower():sub(1,9)=="/e $void "then
        name=msg:sub(10)
        
        local target = shortName(text)
        
        if target then
            
            local Notification = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Stefanuk12/ROBLOX/master/Universal/Notifications/Script.lua"))()
            Notification.newNotification("$Admin$", "Trying kick " .. target.Name, "uwu")

            for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
           
                if v:IsA("BillboardGui") then
                
                    v:Destroy()
                   
                end
                
            end

            tchar = target.Character

            getcurrentcamera().CameraSubject = tchar.Head
            
            local pos = getcharacter().HumanoidRootPart.CFrame
            
            replacehumanoid()
            
            for i,v in pairs(getplayer().Backpack:GetChildren()) do
                if v:IsA("Tool") then
                    v.Parent = getcharacter()  
                end
            end
            
            for i=1, 10 do
            wait()
            getcharacter().Humanoid:ChangeState(11)
            getcharacter().HumanoidRootPart.CFrame = tchar.HumanoidRootPart.CFrame
            end
            
            wait()

            for i=1 , 10 do
                wait(.1)
                getcharacter().HumanoidRootPart.CFrame = getcharacter().HumanoidRootPart.CFrame * CFrame.new(0,9e5,0)
                
            end

        else
            notfound()
        end
    
    end

end)

getplayer().Chatted:connect(function(msg)
   
    if msg:lower():sub(1,9)=="/e $kill "then
        name=msg:sub(10)
        
        local target = shortName(text)
        
        if target then
            
            local Notification = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Stefanuk12/ROBLOX/master/Universal/Notifications/Script.lua"))()
            Notification.newNotification("$Admin$", "Trying kill " .. target.Name, "uwu")

            for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
           
                if v:IsA("BillboardGui") then
                
                    v:Destroy()
                   
                end
                
            end

            tchar = target.Character

            getcurrentcamera().CameraSubject = tchar.Head
            
            local pos = getcharacter().HumanoidRootPart.CFrame
            
            replacehumanoid()
            
            for i,v in pairs(getplayer().Backpack:GetChildren()) do
                if v:IsA("Tool") then
                    v.Parent = getcharacter()  
                end
            end
            
            for i=1, 10 do
            wait()
            getcharacter().Humanoid:ChangeState(11)
            getcharacter().HumanoidRootPart.CFrame = tchar.HumanoidRootPart.CFrame
            end
            
            wait()

            for i=1 , 10 do
                wait(.1)
                getcharacter().HumanoidRootPart.CFrame = getcharacter().HumanoidRootPart.CFrame * CFrame.new(0,-9e5,0)
                
            end

        else
            notfound()
        end
    
    end

end)

getplayer().Chatted:connect(function(msg)
   
    if msg=="/e $kill all"then
        
        replacehumanoid()

        for i,v in pairs(game.Players:GetDescendants()) do

        if v and v.Name~="boganan" then
            


            local Notification = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Stefanuk12/ROBLOX/master/Universal/Notifications/Script.lua"))()
            Notification.newNotification("$Admin$", "Trying kick " .. target.Name, "uwu")

            for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
           
                if v:IsA("BillboardGui") then
                
                    v:Destroy()
                   
                end
                
            end

            tchar = target.Character

            getcurrentcamera().CameraSubject = tchar.Head
            
            local pos = getcharacter().HumanoidRootPart.CFrame
            
            for i,v in pairs(getplayer().Backpack:GetChildren()) do
                if v:IsA("Tool") then
                    v.Parent = getcharacter()  
                end
            end
            
            for i=1, 10 do
            wait()
            getcharacter().Humanoid:ChangeState(11)
            getcharacter().HumanoidRootPart.CFrame = tchar.HumanoidRootPart.CFrame
            end
            
            wait()

            for i=1 , 10 do
                wait(.1)
                getcharacter().HumanoidRootPart.CFrame = getcharacter().HumanoidRootPart.CFrame * CFrame.new(0,-9e5,0)
                
            end

        else
            notfound()
        end
        end
    
    end

end)

getplayer().Chatted:connect(function(msg)
    if msg == "/e $replacehumanoid" then
        
            replacehumanoid()
        
    end
end)

--REPLACE PLAYERS

getplayer().Chatted:connect(function(msg)
    if msg == "/e $dex" then
        
            local Dex = game:GetObjects("rbxassetid://3567096419")[1]
            Dex.Parent = game.CoreGui
        
            local function Load(Obj, Url)
                local function GiveOwnGlobals(Func, Script)
                    local Fenv = {}
                    local RealFenv = {script = Script}
                    local FenvMt = {}
                    FenvMt.__index = function(a,b)
                        if RealFenv[b] == nil then
                            return getfenv()[b]
                        else
                            return RealFenv[b]
                        end
                    end
                    FenvMt.__newindex = function(a, b, c)
                        if RealFenv[b] == nil then
                            getfenv()[b] = c
                        else
                            RealFenv[b] = c
                        end
                    end
                    setmetatable(Fenv, FenvMt)
                    setfenv(Func, Fenv)
                    return Func
                end
                local function LoadScripts(Script)
                    if Script.ClassName == "Script" or Script.ClassName == "LocalScript" then
                        spawn(function()
                            GiveOwnGlobals(loadstring(Script.Source, "=" .. Script:GetFullName()), Script)()
                        end)
                    end
                    for i,v in pairs(Script:GetChildren()) do
                        LoadScripts(v)
                    end
                end
                LoadScripts(Obj)
            end
        
            Load(Dex)
        
    end
end)
end
--MAIN CODE