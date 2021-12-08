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

getgenv().luez={
    ['Humanoid'] = 
    'Walkspeed:' .. Humanoid().WalkSpeed .. ' ' ..
    'JumpPower:' .. Humanoid().JumpPower .. ' ' ..
    'Health/Max:' .. Humanoid().Health .. ' | ' .. Humanoid().MaxHealth .. ' ' ..
    'HState:' .. HumanoidState() .. ' ';
    ['coils'] = 'sf';
}
