--FUNCTIONS OR IMPORTS
print("LOADING FUNCTIONS")
--
local getplayerlist = function()
	return game.Players
end
local getplayer = function()
	return game.Players.LocalPlayer
end
local getcharacter = function()
	return game.Players.LocalPlayer.Character
end
local gethumanoid = function()
	return game.Players.LocalPlayer.Character.Humanoid
end
local gethumanoidroot = function()
	return game.Players.LocalPlayer.Character.HumanoidRootPart
end
--
print("FUNCTIONS SUCCSEFUL")
--
--START
print("LOADING START")
--

--
print("START SUCCSEFUL")
--
--MAIN CODE
print("LOADING MAIN CODE")
--
while wait(1) do
    pcall(function()
	for i,v in pairs(game.Players:GetDescendants()) do
        
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
--
print("MAIN CODE SUCCSEFUL")
--
