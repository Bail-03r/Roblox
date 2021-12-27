--connection library
local lib = loadstring(game:HttpGet('https://raw.githubusercontent.com/Bail-03r/Roblox/main/%5BLibrary%5D/Emenem.lua'))()

--creating main menu
local main = lib:CreateMain('totally not skidded menu')

--creating tabs in menu
local tab1 = main:CreateTab('tab1 (toggles and textbox)')
local tab2 = main:CreateTab('tab2 (sliders)')
local tab3 = main:CreateTab('tab3 (binds)')
local tab4 = main:CreateTab('tab4 (dropdown)')

--creating buttons in your cool tabs
tab1:CreateButton('text',function()
   print'text tab1'
end)
tab2:CreateButton('cool text',function()
   print'cool text tab2'
end)
tab3:CreateButton('very cool text',function()
   print'very cool text tab3'
end)

--creating toggles
tab1:CreateToggle('safe tp',function(state)
   print(state) 
end)
tab1:CreateToggle('aim botz',function(state)
   print(state) 
end)
tab1:CreateToggle('freeze',function(state)
   print(state) 
end)

--creating one slider but im lazy
tab2:CreateSlider('WalkSpeed',0,100, game:GetService('Players').LocalPlayer.Character.Humanoid.WalkSpeed ,1,function(slide) --arg 1 name | arg 2 and arg 3 its min and max | arg 4 defoult | arg 5 how much slide :)
    game:GetService('Players').LocalPlayer.Character.Humanoid.WalkSpeed = slide
    print(slide)
end)
tab2:CreateSlider('JumpPower',0,100, game:GetService('Players').LocalPlayer.Character.Humanoid.JumpPower ,1,function(slide)
    game:GetService('Players').LocalPlayer.Character.Humanoid.JumpPower = slide
    print(slide)
end)

--creating not cool label
tab3:CreateLabel('boring text😕')

--creating cool binds 😎
tab3:CreateBind('jump if dont have space', 'F', function(status) --binds semi broke :(
    print('buttoned')
    game:GetService('Players').LocalPlayer.Character.Humanoid:ChangeState(3)
end)

--omg DROPDOWN
tab4:CreateDropdown('dopdawn','defoult',{'ru','boganan','qwertyiwerty2','exploiters'},function(choose) --fully broken 🤧
    print(choose)
end)

--creating textbox
tab1:AddTextbox('warn in console','type here',function(text)
    warn(text)
end)