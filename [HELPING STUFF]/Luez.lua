--set
getgenv().log = nil
--
getgenv().playerL = function()
   return game.Players
end
getgenv().player = function()
   return game.Players.LocalPlayer
end
getgenv().character = function()
    return player().character
end
getgenv().Humanoid = function()
   return character().Humanoid
end
getgenv().HumanoidState = function()
    local state = Humanoid():GetState()
    state = tostring(state)
    state = state:sub(24)
    return state
end
getgenv().g = function()
   return game
end
getgenv().Workspace = function()
   warn('man use workspace')
   return workspace
end
getgenv().currentCamera = function()
   return workspace.CurrentCamera
end
--24
getgenv().HumanoidRootPart = function()
   return character().HumanoidRootPart 
end
getgenv().Disable3D = function()
   game.RunService:Set3dRenderingEnabled(false)
end
getgenv().Enable3D = function()
   game.RunService:Set3dRenderingEnabled(true)
end
getgenv().teleport = function(who,Part,message)
   if playerL():FindFirstChild(who) then
      HumanoidRootPart().CFrame = playerL()[who].Character[Part].CFrame
   else
      print(message)
   end
end
getgenv().view = function(who,Part,message)
   if playerL():FindFirstChild(who) then
      currentCamera().CameraSubject = playerL()[who].Character[Part].CFrame
   else
      print(message)
   end
end

getgenv().luez={
    ['Humanoid'] = 
    'Walkspeed:' .. Humanoid().WalkSpeed .. ' ' ..
    'JumpPower:' .. Humanoid().JumpPower .. ' ' ..
    'Health/Max:' .. Humanoid().Health .. ' | ' .. Humanoid().MaxHealth .. ' ' ..
    'HState:' .. HumanoidState() .. ' ';
    ['coils'] = 'sf';
}