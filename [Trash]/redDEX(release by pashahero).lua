--settings

local attachtime = 0

local old = nil
old = hookmetamethod(game,'__namecall',function(...)
    script = getcallingscript()
    if getnamecallmethod()=='Kick' or getnamecallmethod()=='kick' then
        return print(script:GetFullName())
    end
    return old(...) 
end)

gamer = game.Players.LocalPlayer

replace = function()
    clone = gamer.Character.Humanoid:Clone()
    gamer.Character.Humanoid:Destroy()
    clone.Parent = gamer.Character
    return clone
end

gamer.Chatted:Connect(function(mess)
    if mess:lower():sub(1,8)=='/e kick ' then
        enemy = mess:sub(9)
        print(enemy)
        if game.Players:FindFirstChild(enemy) then
            print'passed'
                pos = gamer.Character.HumanoidRootPart.CFrame
                print'checked 2'
                enemy = game.Players:FindFirstChild(enemy).Character
                main = enemy.RightHand
                
                gamer.Character.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame * CFrame.new(0,0,-2)
                
               	replace()
                
                loop = game.RunService.Heartbeat:Connect(function()
                    main.Position = gamer.Character.RightHand.Position
                    main.Anchored = true
                end)
                for _,tool in ipairs(gamer.Backpack:GetChildren()) do
                    if tool:IsA('Tool') then
                        tool.Parent = gamer.Character
                        tool.Name = 'claim'
                        break
                    end
                end
                enemy.ChildAdded:Connect(function(what)
                    what = what
                    if what:IsA('Tool') and what.Name == 'claim' then
                        loop:Disconnect()
                        main.Anchored = false
                        what.Name = 'nil'
                        
                        gamer.Character.Humanoid:ChangeState(15)
                        
                    end
                end)

        else
            return
        end
    end
end)

gamer.Chatted:Connect(function(mess)
    if mess:lower():sub(1,9)=='/e kick2 ' then
        enemy = mess:sub(10)
        print(enemy)
        if game.Players:FindFirstChild(enemy) then
            print'passed'

                pos = gamer.Character.HumanoidRootPart.CFrame
                print'checked 2'
                enemy = game.Players:FindFirstChild(enemy).Character
                main = enemy.RightHand
                
                replace()
                loop = game.RunService.Heartbeat:Connect(function()
                    main.Position = gamer.Character.RightHand.Position
                    main.Anchored = true
                end)
                for _,tool in ipairs(gamer.Backpack:GetChildren()) do
                    if tool:IsA('Tool') then
                        tool.Parent = gamer.Character
                        tool.Name = 'claim'
                        break
                    end
                end
                enemy.ChildAdded:Connect(function(what)
                    what = what
                    if what:IsA('Tool') and what.Name == 'claim' then
                        loop:Disconnect()
                        main.Anchored = false
                        what.Name = 'nil'
                        
                        gamer.Character.HumanoidRootPart.CFrame = pos * CFrame.new(0,10000,0)
                        wait(.5)
                        gamer.Character.RightHand:Destroy()
                        gamer.Character.HumanoidRootPart.CFrame = pos
                    end
                end)

        else
            return
        end
    end
end)


gamer.Chatted:Connect(function(mess)
    if mess == '/e rejoin' then
       rejoin() 
    end
end)

gamer.Chatted:Connect(function(mess)
    if mess == '/e status' then
       gamer.Character.Humanoid.Jump = true 
    end
end)
