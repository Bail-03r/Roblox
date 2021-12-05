loadstring(game:HttpGet("https://raw.githubusercontent.com/GelatekWasTaken/GelatekV2/main/LoadLibrary.lua"))()
--[[Pew pew gun thing by SezHu]]--
warn("I like John Wick.")

wait(1 / 60)
Effects = { }
local Player = game.Players.localPlayer
local Mouse = Player:GetMouse()
local Character = Player.Character.Reanim
local Humanoid = Character.Humanoid
local Head = Character.Head
local RootPart = Character.HumanoidRootPart
local Torso = Character.Torso
local LeftArm = Character["Left Arm"]
local RightArm = Character["Right Arm"]
local LeftLeg = Character["Left Leg"]
local RightLeg = Character["Right Leg"]
local Camera = game.Workspace.CurrentCamera
local RootJoint = RootPart.RootJoint
local Equipped = false
local Attack = false
local Anim = 'Idle'
local Idle = 0
local Combo = 1
local TorsoVelocity = (RootPart.Velocity * Vector3.new(1, 0, 1)).magnitude 
local Velocity = RootPart.Velocity.y
local Sine = 0
local Change = 1
local lockcam = workspace.CurrentCamera
lockcam.CameraType = "Custom"
lockcam.CameraSubject = Head

local RbxUtility = LoadLibrary("RbxUtility")
local Create = RbxUtility.Create


Humanoid.WalkSpeed = 25
Humanoid.JumpPower = 100
Humanoid.Animator.Parent = nil
Character.Animate.Parent = nil

local newMotor = function(part0, part1, c0, c1)
	local w = Create('Motor'){
		Parent = part0,
		Part0 = part0,
		Part1 = part1,
		C0 = c0,
		C1 = c1,
	}
	return w
end



function clerp(a, b, t)
	return a:lerp(b, t)
end

RootCF = CFrame.fromEulerAnglesXYZ(-1.57, 0, 3.14)
NeckCF = CFrame.new(0, 1, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0)

local RW = newMotor(Torso, RightArm, CFrame.new(1.5, 0, 0), CFrame.new(0, 0, 0)) 
local LW = newMotor(Torso, LeftArm, CFrame.new(-1.5, 0, 0), CFrame.new(0, 0, 0))
local RH = newMotor(Torso, RightLeg, CFrame.new(.5, -2, 0), CFrame.new(0, 0, 0))
local LH = newMotor(Torso, LeftLeg, CFrame.new(-.5, -2, 0), CFrame.new(0, 0, 0))
RootJoint.C1 = CFrame.new(0, 0, 0)
RootJoint.C0 = CFrame.new(0, 0, 0)
Torso.Neck.C1 = CFrame.new(0, 0, 0)
Torso.Neck.C0 = CFrame.new(0, 1.5, 0)

local rarmc1 = RW.C1
local larmc1 = LW.C1
local rlegc1 = RH.C1
local llegc1 = LH.C1

local resetc1 = false

function PlayAnimationFromTable(table, speed, bool)
	RootJoint.C0 = clerp(RootJoint.C0, table[1], speed) 
	Torso.Neck.C0 = clerp(Torso.Neck.C0, table[2], speed) 
	RW.C0 = clerp(RW.C0, table[3], speed) 
	LW.C0 = clerp(LW.C0, table[4], speed) 
	RH.C0 = clerp(RH.C0, table[5], speed) 
	LH.C0 = clerp(LH.C0, table[6], speed) 
	if bool == true then
		if resetc1 == false then
			resetc1 = true
			RootJoint.C1 = RootJoint.C1
			Torso.Neck.C1 = Torso.Neck.C1
			RW.C1 = rarmc1
			LW.C1 = larmc1
			RH.C1 = rlegc1
			LH.C1 = llegc1
		end
	end
end

ArtificialHB = Create("BindableEvent"){
	Parent = script,
	Name = "Heartbeat",
}

script:WaitForChild("Heartbeat")

frame = 1 / 35
tf = 0
allowframeloss = false
tossremainder = false
lastframe = tick()
script.Heartbeat:Fire()

game:GetService("RunService").Heartbeat:connect(function(s, p)
	tf = tf + s
	if tf >= frame then
		if allowframeloss then
			script.Heartbeat:Fire()
			lastframe = tick()
		else
			for i = 1, math.floor(tf / frame) do
				script.Heartbeat:Fire()
			end
			lastframe = tick()
		end
		if tossremainder then
			tf = 0
		else
			tf = tf - frame * math.floor(tf / frame)
		end
	end
end)

function swait(num)
	if num == 0 or num == nil then
		ArtificialHB.Event:wait()
	else
		for i = 0, num do
			ArtificialHB.Event:wait()
		end
	end
end

local m = Create("Model"){
	Parent = Character,
	Name = "WeaponModel"
}







function RemoveOutlines(part)
	part.TopSurface, part.BottomSurface, part.LeftSurface, part.RightSurface, part.FrontSurface, part.BackSurface = 10, 10, 10, 10, 10, 10
end
	
CFuncs = {	
	Part = {
		Create = function(Parent, Material, Reflectance, Transparency, BColor, Name, Size)
			local Part = Create("Part"){
				Parent = Parent,
				Reflectance = Reflectance,
				Transparency = Transparency,
				CanCollide = false,
				Locked = true,
				BrickColor = BrickColor.new(tostring(BColor)),
				Name = Name,
				Size = Size,
				Material = Material,
			}
			RemoveOutlines(Part)
			if Size == Vector3.new() then
				Part.Size = Vector3.new(0.2, 0.2, 0.2)
			else
				Part.Size = Size
			end
			return Part
		end;
	};
	
	Mesh = {
		Create = function(Mesh, Part, MeshType, MeshId, OffSet, Scale)
			local Msh = Create(Mesh){
				Parent = Part,
				Offset = OffSet,
				Scale = Scale,
			}
			if Mesh == "SpecialMesh" then
				Msh.MeshType = MeshType
				Msh.MeshId = MeshId
			end
			return Msh
		end;
	};

	Weld = {
		Create = function(Parent, Part0, Part1, C0, C1)
			local Weld = Create("Weld"){
				Parent = Parent,
				Part0 = Part0,
				Part1 = Part1,
				C0 = C0,
				C1 = C1,
			}
			return Weld
		end;
	};

	Sound = {
		Create = function(id, par, vol, pit) 
			local Sound = Create("Sound"){
				Volume = vol,
				Pitch = pit or 1,
				SoundId = "rbxassetid://" .. id,
				Parent = par or workspace,
			}
			Sound:play() 
			return Sound
		end;
	};
	
	Decal = {
		Create = function(Color, Texture, Transparency, Name, Parent)
			local Decal = Create("Decal"){
				Color3 = Color,
				Texture = "rbxassetid://" .. Texture,
				Transparency = Transparency,
				Name = Name,
				Parent = Parent,
			}
			return Decal
		end;
	};
	
	BillboardGui = {
		Create = function(Parent, Image, Position, Size)
			local BillPar = CFuncs.Part.Create(Parent, "SmoothPlastic", 0, 1, BrickColor.new("Black"), "BillboardGuiPart", Vector3.new(1, 1, 1))
			BillPar.CFrame = CFrame.new(Position)
			local Bill = Create("BillboardGui"){
				Parent = BillPar,
				Adornee = BillPar,
				Size = UDim2.new(1, 0, 1, 0),
				SizeOffset = Vector2.new(Size, Size),
			}
			local d = Create("ImageLabel", Bill){
				Parent = Bill,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, 0),
				Image = "rbxassetid://" .. Image,
			}
			return BillPar
		end
	};
	
	ParticleEmitter = {
		Create = function(Parent, Color1, Color2, LightEmission, Size, Texture, Transparency, ZOffset, Accel, Drag, LockedToPart, VelocityInheritance, EmissionDirection, Enabled, LifeTime, Rate, Rotation, RotSpeed, Speed, VelocitySpread)
			local Particle = Create("ParticleEmitter"){
				Parent = Parent,
				Color = ColorSequence.new(Color1, Color2),
				LightEmission = LightEmission,
				Size = Size,
				Texture = Texture,
				Transparency = Transparency,
				ZOffset = ZOffset,
				Acceleration = Accel,
				Drag = Drag,
				LockedToPart = LockedToPart,
				VelocityInheritance = VelocityInheritance,
				EmissionDirection = EmissionDirection,
				Enabled = Enabled,
				Lifetime = LifeTime,
				Rate = Rate,
				Rotation = Rotation,
				RotSpeed = RotSpeed,
				Speed = Speed,
				VelocitySpread = VelocitySpread,
			}
			return Particle
		end;
	};
	
	CreateTemplate = {
		
	};
}



Laser = function(brickcolor, reflect, cframe, x1, y1, z1, x3, y3, z3, delay)
	
	prt = CFuncs.Part.Create(EffectModel, "SmoothPlastic", reflect, 0, brickcolor, "Effect", Vector3.new(.1, 0.5, 0.1))
	prt.Anchored = true
	prt.CFrame = cframe
	prt.Material = "Neon"
	local msh = CFuncs.Mesh.Create("CylinderMesh", prt, "", "", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
	game:GetService("Debris"):AddItem(prt, 10)
	coroutine.resume(coroutine.create(function(Part, Mesh)
		
		for i = 0, 1, delay do
			swait()
			Part.Transparency = i
			Mesh.Scale = Mesh.Scale + Vector3.new(x3, y3, z3)
		end
		Part.Parent = nil
	end
), prt, msh)
end






New = function(Object, Parent, Name, Data)
	local Object = Instance.new(Object)
	for Index, Value in pairs(Data or {}) do
		Object[Index] = Value
	end
	Object.Parent = Parent
	Object.Name = Name
	return Object
end

Handle2=CFuncs.Part.Create(m,Enum.Material.Plastic,1,1,"Medium stone grey","Handle2",Vector3.new(0.440000921, 0.409999877, 0.450001299))
Handle2Weld=CFuncs.Weld.Create(m,Character["Left Arm"],Handle2,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(1.47545052, 0.0741100311, 0.0649585724, 0.030649215, 0.998502314, 0.0453163981, -0.0977259576, 0.0481139421, -0.994049668, -0.99474138, 0.0260382295, 0.099054262))
moter = New("Weld",Handle,"mot",{Part0 = LeftArm,Part1 = Handle2,})


Handle=CFuncs.Part.Create(m,Enum.Material.Plastic,0,1,"Black","Handle",Vector3.new(1, 0.640000343, 0.480000138))
HandleWeld=CFuncs.Weld.Create(m,Character["Right Arm"],Handle,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.0537261963, -0.229599118, 0.664536357, 0.997408867, -0.0183529984, 0.0695609897, 0.0671602935, -0.10906899, -0.991762877, 0.0257887691, 0.993864775, -0.10755378))


FakeHandle=CFuncs.Part.Create(m,Enum.Material.Plastic,0,1,"Black","FakeHandle",Vector3.new(1, 0.640000343, 0.480000138))
FakeHandleWeld=CFuncs.Weld.Create(m,Handle,FakeHandle,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.0537261963, -0.229599118, 0.664536357, 0.997408867, -0.0183529984, 0.0695609897, 0.0671602935, -0.10906899, -0.991762877, 0.0257887691, 0.993864775, -0.10755378))


trigger=CFuncs.Part.Create(m,Enum.Material.Plastic,0,0,"Black","trigger",Vector3.new(1, 0.800000012, 1))
triggerWeld=CFuncs.Weld.Create(m,FakeHandle,trigger,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.151900053, 0.239495739, 0.00701904297, 0.0134571567, 0.99990958, 2.01910734e-05, 7.38943927e-05, -2.11894512e-05, 1, 0.99990952, -0.0134571418, -7.41733238e-05))
CFuncs.Mesh.Create("BlockMesh",trigger,"","",Vector3.new(0, 0, 0),Vector3.new(0.0199999996, 0.5, 0.0700000003))
trigger=CFuncs.Part.Create(m,Enum.Material.Plastic,0,0,"Black","trigger",Vector3.new(1, 0.800000012, 1))
triggerWeld=CFuncs.Weld.Create(m,FakeHandle,trigger,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.429587066, 0.271885633, 0.00701141357, 7.24140555e-05, 4.45842743e-05, 0.99999994, -0.0134558454, -0.999909639, 4.55528498e-05, 0.99990952, -0.0134558454, -7.18068331e-05))
CFuncs.Mesh.Create("BlockMesh",trigger,"","",Vector3.new(0, 0, 0),Vector3.new(0.0199999996, 0.300000012, 0.0700000003))
support=CFuncs.Part.Create(m,Enum.Material.Plastic,0,0,"Black","support",Vector3.new(1, 0.800000012, 1))
supportWeld=CFuncs.Weld.Create(m,FakeHandle,support,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.00704956055, -0.300316542, 0.401988506, 0.999909699, -0.0134435743, -6.93630427e-05, 6.9775153e-05, 3.03909183e-05, 1.00000012, -0.0134435818, -0.999909639, 3.13222408e-05))
CFuncs.Mesh.Create("SpecialMesh",support,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.129999995, 0.100000001, 0.0700000003))
barrel=CFuncs.Part.Create(m,Enum.Material.Plastic,0.20000000298023,0,"Medium stone grey","barrel",Vector3.new(1, 1.20000005, 1))
barrelWeld=CFuncs.Weld.Create(m,FakeHandle,barrel,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.00703048706, -0.529606879, -0.5019629, 0.999909699, -0.0134435743, -6.93630427e-05, -6.9775153e-05, -3.03909183e-05, -1.00000012, 0.0134435818, 0.999909639, -3.13222408e-05))
CFuncs.Mesh.Create("CylinderMesh",barrel,"","",Vector3.new(0, 0.100000001, 0.0149999997),Vector3.new(1, 0.829999983, 0.119999997))
barrelcore=CFuncs.Part.Create(m,Enum.Material.Plastic,0,0,"Really black","barrelcore",Vector3.new(1, 1.20000005, 1))
barrelcoreWeld=CFuncs.Weld.Create(m,FakeHandle,barrelcore,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.00703048706, -0.529606879, -0.5019629, 0.999909699, -0.0134435743, -6.93630427e-05, -6.9775153e-05, -3.03909183e-05, -1.00000012, 0.0134435818, 0.999909639, -3.13222408e-05))
CFuncs.Mesh.Create("CylinderMesh",barrelcore,"","",Vector3.new(0, 0.101000004, 0.0149999997),Vector3.new(1, 0.829999983, 0.109999999))
grip=CFuncs.Part.Create(m,Enum.Material.Plastic,0,0,"Black","grip",Vector3.new(1, 0.800000012, 1))
gripWeld=CFuncs.Weld.Create(m,FakeHandle,grip,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.00703048706, -0.243692428, 0.0935220718, 0.999909699, -0.0134435743, -6.93630427e-05, 0.000538915396, 0.034927085, 0.999389827, -0.0134329498, -0.999299467, 0.0349311605))
CFuncs.Mesh.Create("SpecialMesh",grip,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.129999995, 0.449999988, 0.800000012))
grip=CFuncs.Part.Create(m,Enum.Material.Plastic,0,0,"Black","grip",Vector3.new(1, 0.800000012, 1))
gripWeld=CFuncs.Weld.Create(m,FakeHandle,grip,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.00705337524, -0.280295193, -0.261995792, -0.999909699, 0.0134435743, 6.93630427e-05, 6.9775153e-05, 3.03909183e-05, 1.00000012, 0.0134435818, 0.999909639, -3.13222408e-05))
CFuncs.Mesh.Create("SpecialMesh",grip,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.129999995, 0.100000001, 0.119999997))
grip=CFuncs.Part.Create(m,Enum.Material.Plastic,0,0,"Black","grip",Vector3.new(1, 0.800000012, 1))
gripWeld=CFuncs.Weld.Create(m,FakeHandle,grip,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.00703430176, -0.0529338121, -0.133486509, 0.999909639, -0.0134445727, -6.94710761e-05, 0.012750335, 0.949891746, -0.312319487, 0.00426499359, 0.31229037, 0.949977219))
CFuncs.Mesh.Create("BlockMesh",grip,"","",Vector3.new(0, 0, 0),Vector3.new(0.129999995, 0.899999976, 0.349999994))
grip=CFuncs.Part.Create(m,Enum.Material.Plastic,0,0,"Black","grip",Vector3.new(1, 0.800000012, 1))
gripWeld=CFuncs.Weld.Create(m,FakeHandle,grip,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.00706481934, -0.280296892, -0.291983843, -0.999909699, 0.0134435743, 6.93630427e-05, 6.9775153e-05, 3.03909183e-05, 1.00000012, 0.0134435818, 0.999909639, -3.13222408e-05))
CFuncs.Mesh.Create("SpecialMesh",grip,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.129999995, 0.200000003, 0.0700000003))
grip=CFuncs.Part.Create(m,Enum.Material.Plastic,0,0,"Black","grip",Vector3.new(1, 1.20000005, 1))
gripWeld=CFuncs.Weld.Create(m,FakeHandle,grip,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.0203292221, -0.00703430176, -0.321979046, -6.02649525e-05, -3.16947699e-05, -1.00000012, -0.999909699, 0.0134435594, 5.98318875e-05, 0.0134435594, 0.999909699, -3.25068831e-05))
CFuncs.Mesh.Create("CylinderMesh",grip,"","",Vector3.new(0, 0, 0),Vector3.new(1, 0.109999999, 0.0799999982))
grip6=CFuncs.Part.Create(m,Enum.Material.Plastic,0,0,"Black","grip6",Vector3.new(1, 1.20000005, 1))
grip6Weld=CFuncs.Weld.Create(m,FakeHandle,grip6,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.180281326, -0.00701904297, 0.178030491, -6.02649525e-05, -3.16947699e-05, -1.00000012, -0.999909699, 0.0134435594, 5.98318875e-05, 0.0134435594, 0.999909699, -3.25068831e-05))
CFuncs.Mesh.Create("CylinderMesh",grip6,"","",Vector3.new(0, 0, 0),Vector3.new(1, 0.109999999, 0.0799999982))
gripwood=CFuncs.Part.Create(m,Enum.Material.Plastic,0,0,"Grey","gripwood",Vector3.new(1, 0.800000012, 1))
gripwoodWeld=CFuncs.Weld.Create(m,FakeHandle,gripwood,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.00700759888, -0.0971788168, -0.126956403, 0.999909639, -0.0134445727, -6.94710761e-05, 0.012750335, 0.949891746, -0.312319487, 0.00426499359, 0.31229037, 0.949977219))
CFuncs.Mesh.Create("BlockMesh",gripwood,"","",Vector3.new(0, -0.0299999993, 0),Vector3.new(0.130999997, 0.899999976, 0.300000012))
lock=CFuncs.Part.Create(m,Enum.Material.Plastic,0,0,"Black","lock",Vector3.new(1, 1.20000005, 1))
lockWeld=CFuncs.Weld.Create(m,FakeHandle,lock,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.25027138, -0.00702285767, -0.481977224, -6.77844509e-05, -2.412498e-05, -1.00000012, -0.999909759, 0.0134387538, 6.74538314e-05, 0.0134387463, 0.999909759, -2.50414014e-05))
CFuncs.Mesh.Create("CylinderMesh",lock,"","",Vector3.new(0, 0, 0),Vector3.new(1, 0.0500000007, 0.119999997))
lock=CFuncs.Part.Create(m,Enum.Material.Plastic,0,0,"Black","lock",Vector3.new(1, 1.20000005, 1))
lockWeld=CFuncs.Weld.Create(m,FakeHandle,lock,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.00704574585, 0.364296615, -0.420812368, 0.999909699, -0.0134435743, -6.93630427e-05, -0.00309224986, -0.224969089, -0.974361002, 0.013083294, 0.974273205, -0.224990368))
CFuncs.Mesh.Create("BlockMesh",lock,"","",Vector3.new(0, 0, 0),Vector3.new(0.0599999987, 0.201000005, 0.0500000007))
mag=CFuncs.Part.Create(m,Enum.Material.Plastic,0,0,"Black","mag",Vector3.new(1, 0.800000012, 1))
magWeld=CFuncs.Weld.Create(m,FakeHandle,mag,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.00701904297, -0.0528812408, -0.133502185, 0.999909878, -0.0134301931, -5.27910888e-05, 0.0127419457, 0.949895918, -0.312307149, 0.00424449332, 0.31227833, 0.949981332))
CFuncs.Mesh.Create("BlockMesh",mag,"","",Vector3.new(0, 0, 0),Vector3.new(0.119999997, 0.899999976, 0.200000003))
pull1=CFuncs.Part.Create(m,Enum.Material.Plastic,0,0,"Black","pull1",Vector3.new(1, 1.20000005, 1))
pull1Weld=CFuncs.Weld.Create(m,FakeHandle,pull1,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.00700759888, -0.619629383, -0.401958704, 0.999909699, -0.0134435743, -6.93630427e-05, -6.9775153e-05, -3.03909183e-05, -1.00000012, 0.0134435818, 0.999909639, -3.13222408e-05))
CFuncs.Mesh.Create("CylinderMesh",pull1,"","",Vector3.new(0, 0, 0),Vector3.new(1, 0.829999983, 0.109999999))
pull10=CFuncs.Part.Create(m,Enum.Material.Plastic,0,0,"Black","pull10",Vector3.new(1, 1.20000005, 1))
pull10Weld=CFuncs.Weld.Create(m,FakeHandle,pull10,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.00703811646, -0.32965982, -0.451967001, 0.999909699, -0.0134435743, -6.93630427e-05, -6.9775153e-05, -3.03909183e-05, -1.00000012, 0.0134435818, 0.999909639, -3.13222408e-05))
CFuncs.Mesh.Create("BlockMesh",pull10,"","",Vector3.new(0, 0, 0),Vector3.new(0.140000001, 0.899999976, 0.100000001))
pull11=CFuncs.Part.Create(m,Enum.Material.Plastic,0,0,"Black","pull11",Vector3.new(1, 1.20000005, 1))
pull11Weld=CFuncs.Weld.Create(m,FakeHandle,pull11,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.0670394897, -0.189648718, -0.501974106, 0.999909699, -0.0134435743, -6.93630427e-05, -6.9775153e-05, -3.03909183e-05, -1.00000012, 0.0134435818, 0.999909639, -3.13222408e-05))
CFuncs.Mesh.Create("BlockMesh",pull11,"","",Vector3.new(0, 0, 0),Vector3.new(0.0199999996, 0.629999995, 0.109999999))
pull12=CFuncs.Part.Create(m,Enum.Material.Plastic,0,0,"Black","pull12",Vector3.new(1, 1.20000005, 1))
pull12Weld=CFuncs.Weld.Create(m,FakeHandle,pull12,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.0629768372, -0.189653218, -0.501966715, 0.999909699, -0.0134435743, -6.93630427e-05, -6.9775153e-05, -3.03909183e-05, -1.00000012, 0.0134435818, 0.999909639, -3.13222408e-05))
CFuncs.Mesh.Create("BlockMesh",pull12,"","",Vector3.new(0, 0, 0),Vector3.new(0, 0.629999995, 0.109999999))
pull13=CFuncs.Part.Create(m,Enum.Material.Plastic,0,0,"Black","pull13",Vector3.new(1, 1.20000005, 1))
pull13Weld=CFuncs.Weld.Create(m,FakeHandle,pull13,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.00702285767, 0.150307029, -0.481988907, 0.999909699, -0.0134435743, -6.93630427e-05, -6.9775153e-05, -3.03909183e-05, -1.00000012, 0.0134435818, 0.999909639, -3.13222408e-05))
CFuncs.Mesh.Create("BlockMesh",pull13,"","",Vector3.new(0, 0, 0),Vector3.new(0.140000001, 0.200000003, 0.150000006))
pull14=CFuncs.Part.Create(m,Enum.Material.Plastic,0,0,"Really black","pull14",Vector3.new(1, 1.20000005, 1))
pull14Weld=CFuncs.Weld.Create(m,FakeHandle,pull14,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.00701141357, 0.150305301, -0.481980801, 0.999909699, -0.0134435743, -6.93630427e-05, -6.9775153e-05, -3.03909183e-05, -1.00000012, 0.0134435818, 0.999909639, -3.13222408e-05))
CFuncs.Mesh.Create("BlockMesh",pull14,"","",Vector3.new(0, 0, 0),Vector3.new(0.0599999987, 0.201000005, 0.150000006))
pull15=CFuncs.Part.Create(m,Enum.Material.Plastic,0,0,"Black","pull15",Vector3.new(1, 0.400000006, 1))
pull15Weld=CFuncs.Weld.Create(m,FakeHandle,pull15,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.00703048706, -1.04958391, -0.561964989, 0.999909699, -0.0134400427, -6.49569556e-05, -6.52852468e-05, -2.39983201e-05, -1, 0.0134400502, 0.999909818, -2.48774886e-05))
CFuncs.Mesh.Create("BlockMesh",pull15,"","",Vector3.new(0, 0, 0),Vector3.new(0.00999999978, 0.129999995, 0.100000001))
pull16=CFuncs.Part.Create(m,Enum.Material.Plastic,0,0,"Black","pull16",Vector3.new(1, 0.400000006, 1))
pull16Weld=CFuncs.Weld.Create(m,FakeHandle,pull16,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.0270347595, 0.130312085, -0.571975708, 0.999909699, -0.0134400427, -6.49569556e-05, -6.52852468e-05, -2.39983201e-05, -1, 0.0134400502, 0.999909818, -2.48774886e-05))
CFuncs.Mesh.Create("BlockMesh",pull16,"","",Vector3.new(0, 0, 0),Vector3.new(0.0199999996, 0.129999995, 0.100000001))
pull17=CFuncs.Part.Create(m,Enum.Material.Plastic,0,0,"Black","pull17",Vector3.new(1, 0.400000006, 1))
pull17Weld=CFuncs.Weld.Create(m,FakeHandle,pull17,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.0129585266, 0.130348355, -0.571978331, 0.999909699, -0.0134435743, -6.93630427e-05, -6.9775153e-05, -3.03909183e-05, -1.00000012, 0.0134435818, 0.999909639, -3.13222408e-05))
CFuncs.Mesh.Create("BlockMesh",pull17,"","",Vector3.new(0, 0, 0),Vector3.new(0.0199999996, 0.129999995, 0.100000001))
pull18=CFuncs.Part.Create(m,Enum.Material.Plastic,0,0,"Black","pull18",Vector3.new(1, 0.400000006, 1))
pull18Weld=CFuncs.Weld.Create(m,FakeHandle,pull18,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.00703048706, 0.13034448, -0.561985254, 0.999909759, -0.0134398267, -6.6944398e-05, -6.74682669e-05, -3.82959843e-05, -1, 0.0134398341, 0.999909759, -3.92049551e-05))
CFuncs.Mesh.Create("BlockMesh",pull18,"","",Vector3.new(0, 0, 0),Vector3.new(0.0299999993, 0.129999995, 0.100000001))
pull2=CFuncs.Part.Create(m,Enum.Material.Plastic,0,0,"Black","pull2",Vector3.new(1, 1.20000005, 1))
pull2Weld=CFuncs.Weld.Create(m,FakeHandle,pull2,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.00704574585, -0.619563699, -0.451950073, 0.999909878, -0.0134311616, -6.29704446e-05, -6.34202734e-05, -3.29688191e-05, -1, 0.0134311691, 0.999909878, -3.38107347e-05))
CFuncs.Mesh.Create("BlockMesh",pull2,"","",Vector3.new(0, 0, 0),Vector3.new(0.109999999, 0.829999983, 0.109999999))
pull3=CFuncs.Part.Create(m,Enum.Material.Plastic,0,0,"Black","pull3",Vector3.new(1, 0.800000012, 1))
pull3Weld=CFuncs.Weld.Create(m,FakeHandle,pull3,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.00703811646, -0.739553452, -0.50193429, 0.999909818, -0.0134332404, -6.21890649e-05, -6.25979155e-05, -2.99289823e-05, -1.00000012, 0.0134332553, 0.999909878, -3.07634473e-05))
CFuncs.Mesh.Create("BlockMesh",pull3,"","",Vector3.new(0, 0, 0),Vector3.new(0.140000001, 0.949999988, 0.109999999))
pull4=CFuncs.Part.Create(m,Enum.Material.Plastic,0,0,"Black","pull4",Vector3.new(1, 0.800000012, 1))
pull4Weld=CFuncs.Weld.Create(m,FakeHandle,pull4,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.00704956055, -0.739597261, -0.541920185, 0.999909759, -0.0134378821, -6.57103956e-05, -6.59306534e-05, -1.59516931e-05, -1.00000012, 0.0134378746, 0.999909818, -1.68383121e-05))
CFuncs.Mesh.Create("BlockMesh",pull4,"","",Vector3.new(0, 0, 0),Vector3.new(0.0900000036, 0.949999988, 0.109999999))
pull5=CFuncs.Part.Create(m,Enum.Material.Plastic,0,0,"Black","pull5",Vector3.new(1, 0.800000012, 1))
pull5Weld=CFuncs.Weld.Create(m,FakeHandle,pull5,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.00704193115, 0.0703384876, -0.541975498, 0.999909759, -0.0134378821, -6.57103956e-05, -6.59306534e-05, -1.59516931e-05, -1.00000012, 0.0134378746, 0.999909818, -1.68383121e-05))
CFuncs.Mesh.Create("BlockMesh",pull5,"","",Vector3.new(0, 0, 0),Vector3.new(0.0900000036, 0.5, 0.109999999))
pull6=CFuncs.Part.Create(m,Enum.Material.Plastic,0,0,"Black","pull6",Vector3.new(1, 0.800000012, 1))
pull6Weld=CFuncs.Weld.Create(m,FakeHandle,pull6,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.46642971, -0.739624321, -0.295387268, 0.503457308, -0.864020228, -3.70740891e-05, -7.86371529e-05, -2.91317701e-06, -1.00000012, 0.864020169, 0.503457367, -6.94096088e-05))
CFuncs.Mesh.Create("BlockMesh",pull6,"","",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.949999988, 0.0900000036))
pull7=CFuncs.Part.Create(m,Enum.Material.Plastic,0,0,"Black","pull7",Vector3.new(1, 0.800000012, 1))
pull7Weld=CFuncs.Weld.Create(m,FakeHandle,pull7,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.46647644, 0.070343256, -0.295406342, 0.503451586, -0.864023566, -4.46215272e-05, -8.28690827e-05, 3.34531069e-06, -1.00000012, 0.864023507, 0.503451586, -6.99199736e-05))
CFuncs.Mesh.Create("BlockMesh",pull7,"","",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.5, 0.0900000036))
pull8=CFuncs.Part.Create(m,Enum.Material.Plastic,0,0,"Black","pull8",Vector3.new(1, 0.800000012, 1))
pull8Weld=CFuncs.Weld.Create(m,FakeHandle,pull8,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.459190369, -0.73966372, -0.307416916, 0.526499987, 0.850175321, -3.15755606e-05, -5.32302074e-05, -4.17232513e-06, -1.00000012, -0.850175142, 0.526500046, 4.30643559e-05))
CFuncs.Mesh.Create("BlockMesh",pull8,"","",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 0.949999988, 0.0900000036))
pull9=CFuncs.Part.Create(m,Enum.Material.Plastic,0,0,"Black","pull9",Vector3.new(1, 0.800000012, 1))
pull9Weld=CFuncs.Weld.Create(m,FakeHandle,pull9,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.460895538, -0.129637823, -0.343458176, 0.526488483, 0.850182414, -2.8014183e-05, -4.84357588e-05, -2.96533108e-06, -1.00000012, -0.850182235, 0.526488543, 3.9614737e-05))
CFuncs.Mesh.Create("BlockMesh",pull9,"","",Vector3.new(0, 0, 0),Vector3.new(0.0500000007, 1, 0.0199999996))
support=CFuncs.Part.Create(m,Enum.Material.Plastic,0,0,"Black","support",Vector3.new(1, 1.20000005, 1))
supportWeld=CFuncs.Weld.Create(m,FakeHandle,support,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.00702667236, -0.309642404, -0.451959133, 0.999909699, -0.0134435743, -6.93630427e-05, -6.9775153e-05, -3.03909183e-05, -1.00000012, 0.0134435818, 0.999909639, -3.13222408e-05))
CFuncs.Mesh.Create("BlockMesh",support,"","",Vector3.new(0, -0.0399999991, 0),Vector3.new(0.129999995, 0.899999976, 0.100000001))
support=CFuncs.Part.Create(m,Enum.Material.Plastic,0,0,"Black","support",Vector3.new(1, 1.20000005, 1))
supportWeld=CFuncs.Weld.Create(m,FakeHandle,support,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.00703048706, -0.209693551, -0.401955605, 0.99990958, -0.0134523436, -7.23442063e-05, -7.26664439e-05, -2.34618783e-05, -1.00000012, 0.0134523511, 0.99990958, -2.44379044e-05))
CFuncs.Mesh.Create("CylinderMesh",support,"","",Vector3.new(0, 0.0599999987, 0),Vector3.new(1, 0.899999976, 0.129999995))
support=CFuncs.Part.Create(m,Enum.Material.Plastic,0,0,"Black","support",Vector3.new(1, 0.800000012, 1))
supportWeld=CFuncs.Weld.Create(m,FakeHandle,support,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.00706863403, 0.27032581, -0.341987371, 0.999909699, -0.0134435743, -6.93630427e-05, -6.9775153e-05, -3.03909183e-05, -1.00000012, 0.0134435818, 0.999909639, -3.13222408e-05))
CFuncs.Mesh.Create("BlockMesh",support,"","",Vector3.new(0, 0, 0),Vector3.new(0.129999995, 0.400000006, 0.0399999991))
support=CFuncs.Part.Create(m,Enum.Material.Plastic,0,0,"Black","support",Vector3.new(1, 0.800000012, 1))
supportWeld=CFuncs.Weld.Create(m,FakeHandle,support,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.00703811646, -0.350301504, 0.382001877, 0.999909699, -0.0134444609, -7.0463866e-05, 7.08810985e-05, 3.04579735e-05, 1, -0.0134444609, -0.999909759, 3.13967466e-05))
CFuncs.Mesh.Create("SpecialMesh",support,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(0.129999995, 0.200000003, 0.0399999991))
support=CFuncs.Part.Create(m,Enum.Material.Plastic,0,0,"Black","support",Vector3.new(1, 0.800000012, 1))
supportWeld=CFuncs.Weld.Create(m,FakeHandle,support,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.00700759888, -0.169669658, -0.381963968, 0.999909699, -0.0134435743, -6.93630427e-05, -6.9775153e-05, -3.03909183e-05, -1.00000012, 0.0134435818, 0.999909639, -3.13222408e-05))
CFuncs.Mesh.Create("BlockMesh",support,"","",Vector3.new(0, -0.0399999991, 0),Vector3.new(0.129999995, 1, 0.100000001))
bulletpart=CFuncs.Part.Create(m,Enum.Material.Plastic,0,1,"Black","bulletpart",Vector3.new(0.209999934, 0.170000002, 0.209999904))
bulletpartWeld=CFuncs.Weld.Create(m,FakeHandle,bulletpart,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.496771336, -1.25435734, 0.0321578979, -0.0134708509, -0.999909401, 3.74764204e-06, -7.72606581e-05, -2.71201134e-06, -1.00000012, 0.999909341, -0.013470836, -7.72150233e-05))




function RayCast(Position, Direction, Range, Ignore)
	return game:service("Workspace"):FindPartOnRay(Ray.new(Position, Direction.unit * (Range or 999.999)), Ignore) 
end 

function FindNearestTorso(Position, Distance, SinglePlayer)
	if SinglePlayer then
		return (SinglePlayer.Torso.CFrame.p - Position).magnitude < Distance
	end
	local List = {}
	for i, v in pairs(workspace:GetChildren()) do
		if v:IsA("Model") then
			if v:findFirstChild("Torso") then
				if v ~= Character then
					if (v.Torso.Position - Position).magnitude <= Distance then
						table.insert(List, v)
					end 
				end 
			end 
		end 
	end
	return List
end



function FindNearestHead(Position, Distance, SinglePlayer)
	if SinglePlayer then
		return (SinglePlayer.Head.CFrame.p - Position).magnitude < Distance
	end
	local List = {}
	for i, v in pairs(workspace:GetChildren()) do
		if v:IsA("Model") then
			if v:findFirstChild("Head") then
				if v ~= Character then
					if (v.Head.Position - Position).magnitude <= Distance then
						table.insert(List, v)
					end 
				end 
			end 
		end 
	end
	return List
end







function Damage(Part, hit, minim, maxim, knockback, Type, Property, Delay, HitSound, HitPitch)
	
end

function ShowDamage(Pos, Text, Time, Color)
	local Rate = (1 / 30)
	local Pos = (Pos or Vector3.new(0, 0, 0))
	local Text = (Text or "")
	local Time = (Time or 2)
	local Color = (Color or Color3.new(1, 0, 1))
	local EffectPart = CFuncs.Part.Create(workspace, "SmoothPlastic", 0, 1, BrickColor.new(Color), "Effect", Vector3.new(0, 0, 0))
	EffectPart.Anchored = true
	local BillboardGui = Create("BillboardGui"){
		Size = UDim2.new(3, 0, 3, 0),
		Adornee = EffectPart,
		Parent = EffectPart,
	}
	local TextLabel = Create("TextLabel"){
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		Text = Text,
		Font = "SciFi",
		TextColor3 = Color,
		TextScaled = true,
		Parent = BillboardGui,
	}
	game.Debris:AddItem(EffectPart, (Time))
	EffectPart.Parent = game:GetService("Workspace")
	delay(0, function()
		local Frames = (Time / Rate)
		for Frame = 1, Frames do
			wait(Rate)
			local Percent = (Frame / Frames)
			EffectPart.CFrame = CFrame.new(Pos) + Vector3.new(0, Percent, 0)
			TextLabel.TextTransparency = Percent
		end
		if EffectPart and EffectPart.Parent then
			EffectPart:Destroy()
		end
	end)
end

function MagnitudeDamage(Part, Magnitude, MinimumDamage, MaximumDamage, KnockBack, Type, HitSound, HitPitch)
	for _, c in pairs(workspace:children()) do
		local hum = c:findFirstChild("Humanoid")
		if hum ~= nil then
			local head = c:findFirstChild("Torso")
			if head ~= nil then
				local targ = head.Position - Part.Position
				local mag = targ.magnitude
				if mag <= Magnitude and c.Name ~= Player.Name then 
					Damage(head, head, MinimumDamage, MaximumDamage, KnockBack, Type, RootPart, .1, "rbxassetid://" .. HitSound, HitPitch)
				end
			end
		end
	end
end











EffectModel = Create("Model"){
	Parent = Character,
	Name = "EffectModel",
}


Effects = {
	Block = {
		Create = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay, Type, Part)
			local prt = CFuncs.Part.Create(EffectModel, "Neon", 0, 0, brickcolor, "Effect", Vector3.new())
			prt.Anchored = true
			prt.CFrame = cframe
			msh = CFuncs.Mesh.Create("BlockMesh", prt, "", "", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
			game:GetService("Debris"):AddItem(prt, 10)
			if Type == 1 or Type == nil then
				table.insert(Effects, {
					prt,
					"Block1",
					delay,
					x3,
					y3,
					z3,
					msh
				})
			elseif Type == 2 then
				table.insert(Effects, {
					prt,
					"Block2",
					delay,
					x3,
					y3,
					z3,
					msh
				})
			elseif Type == 3 then
				table.insert(Effects, {
					prt,
					"Block3",
					delay,
					x3,
					y3,
					z3,
					msh,
					Part
				})
			elseif Type == 4 then
				table.insert(Effects, {
					prt,
					"Block2Fire",
					delay,
					x3,
					y3,
					z3,
					msh
				})
			end
		end
	};

	Sphere = {
		Create = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay, parent)
			local prt = CFuncs.Part.Create(EffectModel, "Neon", 0, 0, brickcolor, "Effect", Vector3.new())
			prt.Anchored = true
			prt.CFrame = cframe
			if parent == nil then
				prt.Parent = workspace
			else
				prt.Parent = parent
			end
			local msh = CFuncs.Mesh.Create("SpecialMesh", prt, "Sphere", "", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
			game:GetService("Debris"):AddItem(prt, 10)
			table.insert(Effects, {
				prt,
				"Cylinder",
				delay,
				x3,
				y3,
				z3,
				msh
			})
		end
	};

	Blood = {
		Create = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
			local prt = CFuncs.Part.Create(EffectModel, "Neon", 0, 0, brickcolor, "Effect", Vector3.new())
			prt.Anchored = true
			prt.CFrame = cframe
			local msh = CFuncs.Mesh.Create("SpecialMesh", prt, "Sphere", "", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
			game:GetService("Debris"):AddItem(prt, 10)
			table.insert(Effects, {
				prt,
				"Blood",
				delay,
				x3,
				y3,
				z3,
				msh
			})
		end
	};

	Blast = {
		Create = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay, Part)
			local prt = CFuncs.Part.Create(EffectModel, "Neon", 0, 0, brickcolor, "Effect", Vector3.new())
			prt.Anchored = true
			prt.CFrame = cframe
			local msh = CFuncs.Mesh.Create("SpecialMesh", prt, "FileMesh", "1323306", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
			game:GetService("Debris"):AddItem(prt, 10)
			table.insert(Effects, {
				prt,
				"Block4",
				delay,
				x3,
				y3,
				z3,
				msh,
				Part
			})
		end
	};

	Ring = {
		Create = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
			local prt = CFuncs.Part.Create(EffectModel, "Neon", 0, 0, brickcolor, "Effect", Vector3.new(0.5, 0.5, 0.5))
			prt.Anchored = true
			prt.CFrame = cframe
			local msh = CFuncs.Mesh.Create("SpecialMesh", prt, "FileMesh", "3270017", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
			game:GetService("Debris"):AddItem(prt, 10)
			table.insert(Effects, {
				prt,
				"Cylinder",
				delay,
				x3,
				y3,
				z3,
				msh
			})
		end
	};

	Cylinder = {
		Create = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
			local prt = CFuncs.Part.Create(EffectModel, "Neon", 0, 0, brickcolor, "Effect", Vector3.new())
			prt.Anchored = true
			prt.CFrame = cframe
			local msh = CFuncs.Mesh.Create("CylinderMesh", prt, "", "", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
			game:GetService("Debris"):AddItem(prt, 10)
			table.insert(Effects, {
				prt,
				"Cylinder",
				delay,
				x3,
				y3,
				z3,
				msh
			})
		end
	};

	Head = {
		Create = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
			local prt = CFuncs.Part.Create(EffectModel, "Neon", 0, 0, brickcolor, "Effect", Vector3.new())
			prt.Anchored = true
			prt.CFrame = cframe
			local msh = CFuncs.Mesh.Create("SpecialMesh", prt, "Head", "", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
			game:GetService("Debris"):AddItem(prt, 10)
			table.insert(Effects, {
				prt,
				"Cylinder",
				delay,
				x3,
				y3,
				z3,
				msh
			})
		end
	};

	Wave = {
		Create = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
			local prt = CFuncs.Part.Create(EffectModel, "Neon", 0, 0, brickcolor, "Effect", Vector3.new())
			prt.Anchored = true
			prt.CFrame = cframe
			local msh = CFuncs.Mesh.Create("SpecialMesh", prt, "FileMesh", "20329976", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
			game:GetService("Debris"):AddItem(prt, 10)
			table.insert(Effects, {
				prt,
				"Cylinder",
				delay,
				x3,
				y3,
				z3,
				msh
			})
		end
	};

	Break = {
		Create = function(brickcolor, cframe, x1, y1, z1)
			local prt = CFuncs.Part.Create(EffectModel, "Neon", 0, 0, brickcolor, "Effect", Vector3.new(0.5, 0.5, 0.5))
			prt.Anchored = true
			prt.CFrame = cframe * CFrame.fromEulerAnglesXYZ(math.random(-50, 50), math.random(-50, 50), math.random(-50, 50))
			game:GetService("Debris"):AddItem(prt, 10)
			local msh = CFuncs.Mesh.Create("SpecialMesh", prt, "Sphere", "", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
			local num = math.random(10, 50) / 1000
			table.insert(Effects, {
				prt,
				"Shatter",
				num,
				prt.CFrame,
				math.random() - math.random(),
				0,
				math.random(50, 100) / 100
			})
		end
	};

	Elec = {
		Create = function(brickcolor, cff, x, y, z)
			local prt = CFuncs.Part.Create(EffectModel, "Neon", 0, 0, brickcolor, "Part", Vector3.new(1, 1, 1))
			prt.Anchored = true
			prt.CFrame = cff * CFrame.new(math.random(-x * 100, x * 100) / 100, math.random(-y * 100, y * 100) / 100, math.random(-z * 100, z * 100) / 100)
			prt.CFrame = CFrame.new(prt.Position)
			game:GetService("Debris"):AddItem(prt, 10)
			xval = math.random() / 9
			yval = math.random() / 9
			zval = math.random() / 9
			msh = CFuncs.Mesh.Create("BlockMesh", prt, "", "", Vector3.new(0, 0, 0), Vector3.new(xval, yval, zval))
			eul1 = math.random(-50, 50)
			eul2 = math.random(-50, 50)
			eul3 = math.random(-50, 50)
			euld = CFrame.fromEulerAnglesXYZ(eul1, eul2, eul3)
			euld2 = CFrame.fromEulerAnglesXYZ(-eul1, -eul2, -eul3)
			table.insert(Effects, {
				prt,
				"Elec",
				.05,
				x,
				y,
				z,
				xval,
				yval,
				zval,
				msh,
				euld,
				euld2
			})
		end
	};

	Elec2 = {
		Create = function(brickcolor, cff, x, y, z)
			local prt = CFuncs.Part.Create(EffectModel, "Neon", 0, 0, brickcolor, "Part", Vector3.new(1, 1, 1))
			prt.Anchored = true
			prt.CFrame = cff * CFrame.new(math.random(-x * 100, x * 100) / 100, math.random(-y * 100, y * 100) / 100, math.random(-z * 100, z * 100) / 100)
			prt.CFrame = CFrame.new(prt.Position)
			game:GetService("Debris"):AddItem(prt, 10)
			xval = math.random() / 7
			yval = math.random() / 7
			zval = math.random() / 7
			msh = CFuncs.Mesh.Create("BlockMesh", prt, "", "", Vector3.new(0, 0, 0), Vector3.new(xval, yval, zval))
			eul1 = math.random(-50, 50)
			eul2 = math.random(-50, 50)
			eul3 = math.random(-50, 50)
			euld = CFrame.fromEulerAnglesXYZ(eul1, eul2, eul3)
			euld2 = CFrame.fromEulerAnglesXYZ(-eul1, -eul2, -eul3)
			table.insert(Effects, {
				prt,
				"Elec",
				.1,
				x,
				y,
				z,
				xval,
				yval,
				zval,
				msh,
				euld,
				euld2
			})
		end
	};

	Clone = {
		Create = function() 
			for _, v in pairs(Torso.Parent:children()) do
				if v.className == "Part" and v.Name ~= "HumanoidRootPart" then
					local c = CFuncs.Part.Create(EffectModel, "Neon", 0, .5, BrickColor.new("Bright blue"), "Effect", v.Size)
					c.Anchored = true
					c.CFrame = v.CFrame
					game:GetService("Debris"):AddItem(c, 5)
					local cmsh = nil
					if v.Name == "Head" then
						cmsh = CFuncs.Mesh.Create("SpecialMesh", c, "Head", "", Vector3.new(0, 0, 0), v.Mesh.Scale)
					else
						cmsh = CFuncs.Mesh.Create("BlockMesh", c, "", "", Vector3.new(0, 0, 0), Vector3.new(1, 1, 1))
					end
					table.insert(Effects, {
						c,
						"Cylinder",
						0.05,
						0.1,
						0.1,
						0.1,
						cmsh
					})
				end
			end
		end
	};

	EffectTemplate = {

	};
}


shoot = function(mouse, aoe , partt, SpreadAmount, multiply)
	
	local SpreadVectors = Vector3.new(math.random(-SpreadAmount, SpreadAmount), math.random(-SpreadAmount, SpreadAmount), math.random(-SpreadAmount, SpreadAmount))
	local MainPos = partt.Position
	local MainPos2 = mouse.Hit.p + SpreadVectors
	local MouseLook = CFrame.new((MainPos + MainPos2) / 2, MainPos2)
	local speed = 100
	local num = 500
	coroutine.resume(coroutine.create(function()
		
		repeat
			swait()
			local hit, pos = RayCast(MainPos, MouseLook.lookVector, speed, RootPart.Parent)
			local mag = (MainPos - pos).magnitude                                                            
			Laser(BrickColor.new("Gold"), 0, CFrame.new((MainPos + pos)/2, pos) * CFrame.Angles(1.57, 0, 0), 5, mag * (speed / (speed / 2)), .2, .2, 0, .2, 0.1)
			MainPos = MainPos + MouseLook.lookVector * speed
			num = num - 1
			MouseLook = MouseLook * CFrame.Angles(math.rad(-1), 0, 0)
			if hit ~= nil then
									if hit.Name == "Torso" or hit.Name == "Right Leg" or hit.Name == "Left Leg" or hit.Name == "Right Arm" or hit.Name == "Left Arm" then
				num = 0
				local refpart = CFuncs.Part.Create(EffectModel, "SmoothPlastic", 0, 1, "Really black", "Effect", Vector3.new())
				refpart.Anchored = true
				refpart.CFrame = CFrame.new(pos)
				CFuncs.Sound.Create("255661850", refpart, 1, 1)
local smonk = Instance.new("ParticleEmitter",refpart)
			smonk.LightEmission = .1
			smonk.Size = NumberSequence.new(0.2)
			smonk.Texture = "http://www.roblox.com/asset/?ID=256293532"
			aaa = NumberSequence.new({NumberSequenceKeypoint.new(0, .2),NumberSequenceKeypoint.new(1, 1)})
			bbb = NumberSequence.new({NumberSequenceKeypoint.new(0, .3),NumberSequenceKeypoint.new(0.0636, 0), NumberSequenceKeypoint.new(1, 1)})
			smonk.Transparency = bbb
			smonk.Size = aaa
			smonk.ZOffset = 0
			smonk.Acceleration = Vector3.new(0, -5, 0)
			smonk.LockedToPart = false
			smonk.EmissionDirection = "Back"
			smonk.Lifetime = NumberRange.new(.1, .5)
			smonk.Rate = 50
			smonk.Rotation = NumberRange.new(-100, 100)
			smonk.RotSpeed = NumberRange.new(-100, 100)
			smonk.Speed = NumberRange.new(4)
			smonk.VelocitySpread = 50
			smonk.Enabled=true
game:GetService("Debris"):AddItem(smonk, .3)
							elseif hit.Name == "Head" then
						num = 0
				local refpart = CFuncs.Part.Create(EffectModel, "SmoothPlastic", 0, 1, "Really black", "Effect", Vector3.new())
				refpart.Anchored = true
				refpart.CFrame = CFrame.new(pos)
				CFuncs.Sound.Create("296102734", refpart, 1, 1)
				game:GetService("Debris"):AddItem(refpart, 2)
            local smonk = Instance.new("ParticleEmitter",refpart)
			smonk.LightEmission = .1
			smonk.Size = NumberSequence.new(0.2)
			smonk.Texture = "http://www.roblox.com/asset/?ID=256293532"
			aaa = NumberSequence.new({NumberSequenceKeypoint.new(0, .2),NumberSequenceKeypoint.new(1, 1.5)})
			bbb = NumberSequence.new({NumberSequenceKeypoint.new(0, .3),NumberSequenceKeypoint.new(0.0636, 0), NumberSequenceKeypoint.new(1, 1)})
			smonk.Transparency = bbb
			smonk.Size = aaa
			smonk.ZOffset = 0
			smonk.Acceleration = Vector3.new(0, -5, 0)
			smonk.LockedToPart = false
			smonk.EmissionDirection = "Back"
			smonk.Lifetime = NumberRange.new(.1, .5)
			smonk.Rate = 50
			smonk.Rotation = NumberRange.new(-100, 100)
			smonk.RotSpeed = NumberRange.new(-100, 100)
			smonk.Speed = NumberRange.new(4)
			smonk.VelocitySpread = 100
			smonk.Enabled=true
game:GetService("Debris"):AddItem(smonk, .3)
				else
					num = 0
				local refpart = CFuncs.Part.Create(EffectModel, "SmoothPlastic", 0, 1, "Really black", "Effect", Vector3.new())
				refpart.Anchored = true
				refpart.CFrame = CFrame.new(pos)
			        CFuncs.Sound.Create("341519743", prt, 1, 1)
				game:GetService("Debris"):AddItem(refpart, .2)		
				end
				end
			do
				if num <= 0 then
					local refpart = CFuncs.Part.Create(EffectModel, "SmoothPlastic", 0, 1, "Really black", "Effect", Vector3.new())
					refpart.Anchored = true
					refpart.CFrame = CFrame.new(pos)
                    Effects.Block.Create(BrickColor.new("Flame reddish orange"), refpart.CFrame, .5, .5, .5, .5, .5, .5, .1, 1)
					if hit ~= nil then
						MagnitudeDamage(refpart, aoe, 2 * multiply, 2 * multiply, 0, "Normal", "233856154", 1)		
					end
					game:GetService("Debris"):AddItem(refpart, 0)
				end
			end
		until num <= 0
	end
))
end




local Grabbed = false


function smear()
	Attack = true

	Humanoid.AutoRotate = false
	Humanoid.JumpPower = 0
	Humanoid.WalkSpeed = 0
				local grab = nil
			executing = true	
		for i = 0, 1, 0.1 do
		swait()
		PlayAnimationFromTable({
         CFrame.new(0.0246932413, -0.0966757834, -0.0092370566, 0.713696778, 5.59592329e-22, 0.700454772, -9.27150216e-22, 1, 1.45779223e-22, -0.700454772, -7.53468894e-22, 0.713696778) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.098094359, 1.53651738, -0.281765848, 0.593379974, 0.280785412, -0.754360616, -0.0276839901, 0.943748772, 0.329502523, 0.804446399, -0.174636483, 0.567774832) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(1.58677018, 0.143787161, 0.0495693758, 0.968102753, -0.250522822, -0.00394502282, 0.250228018, 0.965921044, 0.0662006512, -0.0127741396, -0.0650762022, 0.997798622) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-1.74332106, 0.446618229, -0.859300971, 0.795205951, 0.606264353, -0.0095520094, -0.0538869984, 0.0549720451, -0.997032762, -0.603940368, 0.793361068, 0.0763838589) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.648194611, -1.97843742, -0.088139981, 0.954304218, -0.129303336, -0.269414723, 0.107585981, 0.989748061, -0.0939367935, 0.278798997, 0.0606590137, 0.958431959) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.671899676, -2.02211809, 0.00866907835, 0.94230175, 0.108399026, -0.316728801, -0.108764999, 0.993929207, 0.0165804606, 0.316603303, 0.0188252106, 0.948371291) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
		}, .2, false)
	for i, v in pairs(FindNearestHead(Head.CFrame.p, 10)) do
		if v:FindFirstChild('Head') then
			Grabbed = true
			grab = v
		end
							if Grabbed == true then
								targetted = nil
			grab.Humanoid.PlatformStand = true
			end
	end
		end
	
	local grab = nil
	
		for i = 0, .5, 0.1 do
		swait()
		PlayAnimationFromTable({
         CFrame.new(-0, -0, 0, 1, 0, 0, 0, 0.939692736, 0.342019886, 0, -0.342019916, 0.939692736) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0, 1.52020586, -0.279066354, 1, 0, 0, 0, 0.866024911, 0.500000954, 0, -0.500000954, 0.866024852) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(1.70777297, 0.0838996619, 0.338782728, 0.939692616, -0.342020124, 1.00488698e-07, 0.296197832, 0.813797116, 0.500001192, -0.171010554, -0.469847381, 0.866024733) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.786648035, 0.607858896, -1.09360671, 0.866025388, -0.500000238, 0, -0.171010032, -0.296197921, -0.939692736, 0.469846606, 0.813797772, -0.342019886) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.500007629, -2.07035375, 0.196404651, 1, 0, 0, 0, 0.984807789, 0.173648685, 0, -0.173648715, 0.984807789) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.499992371, -1.8793813, -0.684038281, 1, 0, 0, 0, 0.939692736, -0.342019916, 0, 0.342019886, 0.939692736) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
		}, .3, false)
			for i, v in pairs(FindNearestHead(Head.CFrame.p, 10)) do
		if v:FindFirstChild('Head') then
			Grabbed = true
			grab = v
		end
		lockcam.CameraType = "Scriptable"
							if Grabbed == true then
								targetted = nil
			grab.Humanoid.PlatformStand = true
			grab.Head.CFrame = Handle2.CFrame * CFrame.Angles(0,math.rad(-90),0)
			end
			end
		Torso.Velocity=RootPart.CFrame.lookVector*100
		end

				if Grabbed == true and grab ~= nil then
					targetted = nil
			grab.Humanoid.PlatformStand = true
			grab.Head.CFrame = Handle2.CFrame 
			grab.Head.CanCollide = false
		local ow = CFuncs.Sound.Create("393884633", grab.Head, 2, 1)	
	for i = 0, .5, 0.1 do
		swait()
		PlayAnimationFromTable({
         CFrame.new(0, 0.0116673782, -0.230620712, 1, 0, 0, 0, 0.64278698, 0.766044974, 0, -0.766044974, 0.64278698) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0, 1.52020407, -0.279065013, 1, 0, 0, 0, 0.866025746, 0.499999493, 0, -0.499999493, 0.866025746) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(1.76213956, 0.181882262, 0.169026196, 0.939693749, -0.342016995, -3.97785186e-07, 0.296195716, 0.813798964, 0.499999344, -0.171007916, -0.469846368, 0.866025805) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.795767486, 0.409343213, -1.44306374, 0.973481894, -0.226395503, 0.0328332447, 0.000464975834, -0.141566098, -0.989928722, 0.228763461, 0.963693023, -0.137706786) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.500007629, -1.95507848, 0.396064222, 1, 0, 0, 0, 0.866025746, 0.499999493, 0, -0.499999493, 0.866025746) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.499992371, -1.69905818, -0.869703174, 1, 0, 0, 0, 0.766043782, -0.64278847, 0, 0.64278847, 0.766043782) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
		}, .3, false)
lockcam:Interpolate(RootPart.CFrame*CFrame.new(2,2,5),grab.Head.CFrame,.1)
		grab.Head.CFrame = Handle2.CFrame * CFrame.Angles(0,math.rad(-90),0)
				moter.C0 = clerp(moter.C0, CFrame.new(0.0111928731, -1.63769662, -0.318741947, -0.0172089636, 8.2552433e-06, -0.999852061, 0.999852061, 7.4505806e-07, -0.0172089189, 5.66244125e-07, -1.00000012, -8.2552433e-06) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 0.3)
	end
	CFuncs.Sound.Create("307379917", grab.Torso, 2, 1)
	for i = 0, 4, 0.1 do
		swait()
		PlayAnimationFromTable({
         CFrame.new(0, -0.554424644, -0.230621904, 1, 0, 0, 0, 0.173647001, 0.984807968, 0, -0.984807968, 0.173647001) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0, 1.26466095, -0.540713072, 1, 0, 0, 0, 0.866026163, 0.499998748, 0, -0.499998748, 0.866026163) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(1.76214743, 0.0730022341, 0.237322643, 0.939693749, -0.342016995, -3.97785186e-07, 0.342016965, 0.939693809, -1.1920929e-06, 7.74860382e-07, 9.68575478e-07, 1) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.848383009, 0.642179489, -1.0361222, 0.973482251, -0.194533557, -0.120370619, -0.113977194, 0.043772921, -0.992518663, 0.198347136, 0.979918718, 0.0204397887) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.500007629, -1.24131715, -0.550035954, 1, 0, 0, 0, 0.939693153, 0.342018843, 0, -0.342018843, 0.939693153) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.499992371, -0.981758952, -1.45210898, 1, 0, 0, 0, 0.64278692, -0.766045153, 0, 0.766045153, 0.64278692) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
		}, .3, false)
		lockcam:Interpolate(RootPart.CFrame*CFrame.new(2,2,5),grab.Head.CFrame,.1)
			local smonk = Instance.new("ParticleEmitter",grab.Head)
			smonk.LightEmission = .1
			smonk.Size = NumberSequence.new(0.2)
			smonk.Texture = "http://www.roblox.com/asset/?ID=552389687"
			aaa = NumberSequence.new({NumberSequenceKeypoint.new(0, .1),NumberSequenceKeypoint.new(1, .5)})
			bbb = NumberSequence.new({NumberSequenceKeypoint.new(0, .3),NumberSequenceKeypoint.new(0.0636, 0), NumberSequenceKeypoint.new(1, 1)})
			smonk.Transparency = bbb
			smonk.Size = aaa
			smonk.ZOffset = -1
			smonk.Acceleration = Vector3.new(0, -5, 0)
			smonk.LockedToPart = false
			smonk.EmissionDirection = "Bottom"
			smonk.Lifetime = NumberRange.new(.2, 5)
			smonk.Rate = 10
			smonk.Rotation = NumberRange.new(-100, 100)
			smonk.RotSpeed = NumberRange.new(-100, 100)
			smonk.Speed = NumberRange.new(-.3)
			smonk.VelocitySpread = 10
			smonk.Enabled=true
            game:GetService("Debris"):AddItem(smonk, 1)
	Torso.Velocity=RootPart.CFrame.lookVector*40
	grab.Head.CFrame = Handle2.CFrame * CFrame.Angles(0,math.rad(-90),0)		
	end
	grab.Torso.Velocity=RootPart.CFrame.lookVector*0
	Torso.Velocity=RootPart.CFrame.lookVector*0
	grab.Torso.CanCollide = false
	--smashy
	for i = 0, .7, 0.1 do
	for i = 0, .4, 0.1 do
		swait()
		PlayAnimationFromTable({
         CFrame.new(-2.62260437e-06, -0.554422975, -0.230619952, 0.642787039, -3.83130924e-07, 0.766044974, -0.754407108, 0.173647448, 0.633021772, -0.13302201, -0.984807909, 0.111618027) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.165599957, 1.45203376, -0.1389575, 0.888377428, 0.383021414, -0.253140748, -0.249999091, 0.866026103, 0.433011889, 0.385079265, -0.321393013, 0.86511302) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(1.639135, 0.378064632, -0.171392277, 0.584366381, -0.700027764, 0.410459995, 0.671396554, 0.132976457, -0.729070723, 0.455788136, 0.701625764, 0.547703087) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-1.37148404, 0.736055136, -0.588378668, 0.84817493, -0.521483123, -0.093031399, -0.120593652, -0.019078508, -0.992518544, 0.515806735, 0.853048444, -0.0790694579) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(1.04601848, -1.78701377, -0.224999949, 0.642787039, -0.262003303, -0.719846725, -3.83130924e-07, 0.939692438, -0.342021108, 0.766044974, 0.219846994, 0.604021966) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.479837954, -1.03251898, -1.26565886, 0.642787039, -0.586824656, -0.492404163, -3.83130924e-07, 0.642787278, -0.766044915, 0.766044974, 0.492403895, 0.413175076) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
		}, .3, false)
		lockcam:Interpolate(Head.CFrame*CFrame.new(2,2,0),grab.Head.CFrame,.1)
		grab.Head.CFrame = LeftArm.CFrame * CFrame.new(0,-3,0) * CFrame.Angles(0,math.rad(-90),0)
	end
	local smonk = Instance.new("ParticleEmitter",grab.Head)
			smonk.LightEmission = .1
			smonk.Size = NumberSequence.new(0.2)
			smonk.Texture = "http://www.roblox.com/asset/?ID=122022304"
			aaa = NumberSequence.new({NumberSequenceKeypoint.new(0, 1),NumberSequenceKeypoint.new(1, 3)})
			bbb = NumberSequence.new({NumberSequenceKeypoint.new(0, .3),NumberSequenceKeypoint.new(0.0636, 0), NumberSequenceKeypoint.new(1, 1)})
			smonk.Transparency = bbb
			smonk.Size = aaa
			smonk.ZOffset = 1
			smonk.Acceleration = Vector3.new(0,.3, 0)
			smonk.LockedToPart = false
			smonk.EmissionDirection = "Back"
			smonk.Lifetime = NumberRange.new(.2, 5)
			smonk.Rate = 100
			smonk.Rotation = NumberRange.new(-10, 10)
			smonk.RotSpeed = NumberRange.new(-10, 10)
			smonk.Speed = NumberRange.new(2)
			smonk.VelocitySpread = 1000
			smonk.Enabled=true
            game:GetService("Debris"):AddItem(smonk, .5)
	for i = 0, .4, 0.1 do
		swait()
		PlayAnimationFromTable({
         CFrame.new(-1.78813934e-06, -0.554422975, -0.230621129, 0.766044021, -9.53147946e-07, -0.642788172, 0.633023024, 0.173646212, 0.754406333, 0.111616999, -0.984808087, 0.133021265) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.347562611, 1.26466119, -0.414210379, 0.766044021, -0.321392179, 0.556671917, -9.53147946e-07, 0.866026521, 0.499998033, -0.642788172, -0.383021086, 0.66341424) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(1.65797925, -0.0622069128, -0.187585682, 0.944800258, -0.261999041, 0.196745977, 0.296194345, 0.939693809, -0.17101036, -0.140076444, 0.219845727, 0.96542567) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-1.72933996, 0.531819761, -0.983813822, 0.873225331, 0.487284154, 0.00563029945, -0.11397732, 0.215456128, -0.969839096, -0.473800451, 0.846246302, 0.243681118) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.173988, -1.20138502, -1.24044585, 0.766044021, 0.604024172, 0.219843864, -9.53147946e-07, 0.342017144, -0.939693689, -0.642788172, 0.719846606, 0.262000799) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-1.31641626, -0.981757283, -0.790990889, 0.766044021, 0.111620195, 0.633022487, -9.53147946e-07, 0.98480767, -0.173648924, -0.642788172, 0.133022159, 0.754406214) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
		}, .3, false)
		grab.Head.CFrame = LeftArm.CFrame * CFrame.new(0,-3,0) * CFrame.Angles(0,math.rad(-90),0)
lockcam:Interpolate(Head.CFrame*CFrame.new(2,2,0),grab.Head.CFrame,.1)
	end
		CFuncs.Sound.Create("710036613", grab.Torso, 1, 1)
			end		
					for i = 0, 3, 0.1 do
		swait()
		PlayAnimationFromTable({
         CFrame.new(-2.62260437e-06, -0.554422975, -0.230619952, 0.642787039, -3.83130924e-07, 0.766044974, -0.754407108, 0.173647448, 0.633021772, -0.13302201, -0.984807909, 0.111618027) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.165599957, 1.45203376, -0.1389575, 0.888377428, 0.383021414, -0.253140748, -0.249999091, 0.866026103, 0.433011889, 0.385079265, -0.321393013, 0.86511302) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(1.639135, 0.378064632, -0.171392277, 0.584366381, -0.700027764, 0.410459995, 0.671396554, 0.132976457, -0.729070723, 0.455788136, 0.701625764, 0.547703087) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-1.37148404, 0.736055136, -0.588378668, 0.84817493, -0.521483123, -0.093031399, -0.120593652, -0.019078508, -0.992518544, 0.515806735, 0.853048444, -0.0790694579) * CFrame.new(0 + 0.1 * math.cos(Sine/15), .5 + 0.1 * math.cos(Sine/30), 0) * CFrame.Angles(0 + 0.1 * math.cos(Sine/15), 0, 0), 
         CFrame.new(1.04601848, -1.78701377, -0.224999949, 0.642787039, -0.262003303, -0.719846725, -3.83130924e-07, 0.939692438, -0.342021108, 0.766044974, 0.219846994, 0.604021966) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.479837954, -1.03251898, -1.26565886, 0.642787039, -0.586824656, -0.492404163, -3.83130924e-07, 0.642787278, -0.766044915, 0.766044974, 0.492403895, 0.413175076) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
		}, .3, false)
		grab.Head.CFrame = LeftArm.CFrame * CFrame.new(0,-3,0) * CFrame.Angles(0,math.rad(-90),0)
lockcam:Interpolate(Head.CFrame*CFrame.new(2,2,8),grab.Head.CFrame,.8)
					end
					local smonk = Instance.new("ParticleEmitter",grab.Head)
								smonk.LightEmission = .1
			smonk.Size = NumberSequence.new(0.2)
			smonk.Texture = "http://www.roblox.com/asset/?ID=122022304"
			aaa = NumberSequence.new({NumberSequenceKeypoint.new(0, 1),NumberSequenceKeypoint.new(1, 3)})
			bbb = NumberSequence.new({NumberSequenceKeypoint.new(0, .3),NumberSequenceKeypoint.new(0.0636, 0), NumberSequenceKeypoint.new(1, 1)})
			smonk.Transparency = bbb
			smonk.Size = aaa
			smonk.ZOffset = 1
			smonk.Acceleration = Vector3.new(0,5, 0)
			smonk.LockedToPart = false
			smonk.EmissionDirection = "Back"
			smonk.Lifetime = NumberRange.new(.2, 5)
			smonk.Rate = 1000
			smonk.Rotation = NumberRange.new(-10, 10)
			smonk.RotSpeed = NumberRange.new(-10, 10)
			smonk.Speed = NumberRange.new(5)
			smonk.VelocitySpread = 1000
			smonk.Enabled=true
            game:GetService("Debris"):AddItem(smonk, .8)
		   CFuncs.Sound.Create("429400881", grab.Torso, 5, .8)			
						for i = 0, 3, 0.1 do
		swait()
		PlayAnimationFromTable({
         CFrame.new(-1.78813934e-06, -0.554422975, -0.230621129, 0.766044021, -9.53147946e-07, -0.642788172, 0.633023024, 0.173646212, 0.754406333, 0.111616999, -0.984808087, 0.133021265) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.347562611, 1.26466119, -0.414210379, 0.766044021, -0.321392179, 0.556671917, -9.53147946e-07, 0.866026521, 0.499998033, -0.642788172, -0.383021086, 0.66341424) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(1.65797925, -0.0622069128, -0.187585682, 0.944800258, -0.261999041, 0.196745977, 0.296194345, 0.939693809, -0.17101036, -0.140076444, 0.219845727, 0.96542567) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-1.72933996, 0.531819761, -0.983813822, 0.873225331, 0.487284154, 0.00563029945, -0.11397732, 0.215456128, -0.969839096, -0.473800451, 0.846246302, 0.243681118) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.173988, -1.20138502, -1.24044585, 0.766044021, 0.604024172, 0.219843864, -9.53147946e-07, 0.342017144, -0.939693689, -0.642788172, 0.719846606, 0.262000799) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-1.31641626, -0.981757283, -0.790990889, 0.766044021, 0.111620195, 0.633022487, -9.53147946e-07, 0.98480767, -0.173648924, -0.642788172, 0.133022159, 0.754406214) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
		}, .3, false)
		grab.Head.CFrame = LeftArm.CFrame * CFrame.new(0,-3,0) * CFrame.Angles(0,math.rad(-90),0)
lockcam:Interpolate(Head.CFrame*CFrame.new(2,2,0),grab.Head.CFrame,.5)
						end
				grab.Head.Anchored = false
						end
			if grab ~= nil then
				grab.Head:Destroy()
			end			
	grab=nil
	Grabbed = false
	executing = false			
	Humanoid.AutoRotate = true	
	Humanoid.JumpPower = 100
	Humanoid.WalkSpeed = 25
		Attack = false
		lockcam.CameraType = "Custom"
	end
	

crosshair = Instance.new("BillboardGui",Character)
crosshair.Size = UDim2.new(10,0,10,0)
crosshair.Enabled = false
crosshair.AlwaysOnTop = true
crosshair2 = Instance.new("BillboardGui",Character)
crosshair2.Size = UDim2.new(10,0,10,0)
crosshair2.Enabled = false
crosshair2.AlwaysOnTop = true

imgl = Instance.new("ImageLabel",crosshair)
imgl.Position = UDim2.new(0,0,0,0)
imgl.Size = UDim2.new(1,0,1,0)
imgl.Image = "rbxassetid://1122662303"
imgl.BackgroundTransparency = 1
imgl.ImageColor3 = Color3.new(.5,0,0)


crosshair3 = Instance.new("BillboardGui",Character)
crosshair3.Size = UDim2.new(10,0,10,0)
crosshair3.Enabled = false
crosshair3.AlwaysOnTop = true

imgl3 = Instance.new("ImageLabel",crosshair3)
imgl3.Position = UDim2.new(0,0,0,0)
imgl3.Size = UDim2.new(1,0,1,0)
imgl3.Image = "rbxassetid://18006519"
imgl3.BackgroundTransparency = 1
imgl3.ImageColor3 = Color3.new(0,0,0)

imgl2 = Instance.new("ImageLabel",crosshair)
imgl2.Position = UDim2.new(0,0,0,0)
imgl2.Size = UDim2.new(1,0,1,0)
imgl2.Image = "rbxassetid://1122660386"
imgl2.BackgroundTransparency = 1
imgl2.ImageColor3 = Color3.new(0,0,0)

--Credit to CKBackup for his targeting system.--

targetted = nil

function TargetSelect(person)
local dd=coroutine.wrap(function()
if targetted ~= person then
targetted = person
for i = 0,8,1 do
crosshair.Size = UDim2.new(0+i,0,0+i,0)
crosshair2.Size = UDim2.new(.1+i,0,.1+i,0)
crosshair3.Size = UDim2.new(0+i,0,0+i,0)
wait(.05)
end
end
end)
dd()
end

function LockOn()
if Mouse.Target.Parent ~= Character and Mouse.Target.Parent.Parent ~= Character and Mouse.Target.Parent:FindFirstChild("Head") ~= nil then
TargetSelect(Mouse.Target.Parent.Head)
print(Mouse.Target)
CFuncs.Sound.Create("376178316", Mouse.Target.Parent.Head, 2, .8)
else end
  end



function pepper()
	Attack = true
	Humanoid.AutoRotate = false
	Humanoid.JumpPower = 0
	Humanoid.WalkSpeed = 0
	
				local grab = nil
			executing = true	
		for i = 0, 1, 0.1 do
		swait()
		PlayAnimationFromTable({
         CFrame.new(0.0246932413, -0.0966757834, -0.0092370566, 0.713696778, 5.59592329e-22, 0.700454772, -9.27150216e-22, 1, 1.45779223e-22, -0.700454772, -7.53468894e-22, 0.713696778) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.098094359, 1.53651738, -0.281765848, 0.593379974, 0.280785412, -0.754360616, -0.0276839901, 0.943748772, 0.329502523, 0.804446399, -0.174636483, 0.567774832) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(1.58677018, 0.143787161, 0.0495693758, 0.968102753, -0.250522822, -0.00394502282, 0.250228018, 0.965921044, 0.0662006512, -0.0127741396, -0.0650762022, 0.997798622) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-1.74332106, 0.446618229, -0.859300971, 0.795205951, 0.606264353, -0.0095520094, -0.0538869984, 0.0549720451, -0.997032762, -0.603940368, 0.793361068, 0.0763838589) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.648194611, -1.97843742, -0.088139981, 0.954304218, -0.129303336, -0.269414723, 0.107585981, 0.989748061, -0.0939367935, 0.278798997, 0.0606590137, 0.958431959) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.671899676, -2.02211809, 0.00866907835, 0.94230175, 0.108399026, -0.316728801, -0.108764999, 0.993929207, 0.0165804606, 0.316603303, 0.0188252106, 0.948371291) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
		}, .2, false)
		end

	            local grab = nil
	
		for i = 0, 1, 0.1 do
		swait()
		PlayAnimationFromTable({
         CFrame.new(-0, -0, 0, 1, 0, 0, 0, 0.939692736, 0.342019886, 0, -0.342019916, 0.939692736) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0, 1.52020586, -0.279066354, 1, 0, 0, 0, 0.866024911, 0.500000954, 0, -0.500000954, 0.866024852) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(1.70777297, 0.0838996619, 0.338782728, 0.939692616, -0.342020124, 1.00488698e-07, 0.296197832, 0.813797116, 0.500001192, -0.171010554, -0.469847381, 0.866024733) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.786648035, 0.607858896, -1.09360671, 0.866025388, -0.500000238, 0, -0.171010032, -0.296197921, -0.939692736, 0.469846606, 0.813797772, -0.342019886) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.500007629, -2.07035375, 0.196404651, 1, 0, 0, 0, 0.984807789, 0.173648685, 0, -0.173648715, 0.984807789) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.499992371, -1.8793813, -0.684038281, 1, 0, 0, 0, 0.939692736, -0.342019916, 0, 0.342019886, 0.939692736) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
		}, .3, false)
			for i, v in pairs(FindNearestTorso(Torso.CFrame.p, 10)) do
		if v:FindFirstChild('Torso') and Grabbed ~= true then
			Grabbed = true

			grab = v
		end
							if Grabbed == true then
								targetted = nil
			grab.Humanoid.PlatformStand = true
			grab.Torso.CFrame = Handle2.CFrame * CFrame.Angles(0,math.rad(-90),0)
			end
			end
					Torso.Velocity=RootPart.CFrame.lookVector*100
		end


	
				if Grabbed == true and grab ~= nil then
					targetted = nil
			grab.Humanoid.PlatformStand = true
			grab.Torso.CFrame = Handle2.CFrame * CFrame.Angles(0,math.rad(-90),0)
			grab.Torso.CanCollide = false
		--grab here		
	for i = 0, .3, 0.1 do
		swait()
		PlayAnimationFromTable({
         CFrame.new(0, 0.0116673782, -0.230620712, 1, 0, 0, 0, 0.64278698, 0.766044974, 0, -0.766044974, 0.64278698) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0, 1.52020407, -0.279065013, 1, 0, 0, 0, 0.866025746, 0.499999493, 0, -0.499999493, 0.866025746) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(1.76213956, 0.181882262, 0.169026196, 0.939693749, -0.342016995, -3.97785186e-07, 0.296195716, 0.813798964, 0.499999344, -0.171007916, -0.469846368, 0.866025805) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.795767486, 0.409343213, -1.44306374, 0.973481894, -0.226395503, 0.0328332447, 0.000464975834, -0.141566098, -0.989928722, 0.228763461, 0.963693023, -0.137706786) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.500007629, -1.95507848, 0.396064222, 1, 0, 0, 0, 0.866025746, 0.499999493, 0, -0.499999493, 0.866025746) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.499992371, -1.69905818, -0.869703174, 1, 0, 0, 0, 0.766043782, -0.64278847, 0, 0.64278847, 0.766043782) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
		}, .3, false)
		grab.Torso.CFrame = Handle2.CFrame * CFrame.Angles(0,math.rad(-90),0)
				moter.C0 = clerp(moter.C0, CFrame.new(0.0111928731, -1.63769662, -0.318741947, -0.0172089636, 8.2552433e-06, -0.999852061, 0.999852061, 7.4505806e-07, -0.0172089189, 5.66244125e-07, -1.00000012, -8.2552433e-06) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 0.3)
	end
	
	for i = 0, 1, 0.1 do
		swait()
		PlayAnimationFromTable({
         CFrame.new(0, -0.554424644, -0.230621904, 1, 0, 0, 0, 0.173647001, 0.984807968, 0, -0.984807968, 0.173647001) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0, 1.26466095, -0.540713072, 1, 0, 0, 0, 0.866026163, 0.499998748, 0, -0.499998748, 0.866026163) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(1.76214743, 0.0730022341, 0.237322643, 0.939693749, -0.342016995, -3.97785186e-07, 0.342016965, 0.939693809, -1.1920929e-06, 7.74860382e-07, 9.68575478e-07, 1) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.848383009, 0.642179489, -1.0361222, 0.973482251, -0.194533557, -0.120370619, -0.113977194, 0.043772921, -0.992518663, 0.198347136, 0.979918718, 0.0204397887) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.500007629, -1.24131715, -0.550035954, 1, 0, 0, 0, 0.939693153, 0.342018843, 0, -0.342018843, 0.939693153) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.499992371, -0.981758952, -1.45210898, 1, 0, 0, 0, 0.64278692, -0.766045153, 0, 0.766045153, 0.64278692) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
		}, .3, false)
grab.Torso.CFrame = Handle2.CFrame * CFrame.Angles(0,math.rad(-90),0)			
	end
	lockcam.CameraType = "Scriptable"
				--release here
					for i = 0, .3, 0.1 do
		swait()
		PlayAnimationFromTable({
         CFrame.new(-0, -0.790954828, 0.162615269, 1, 0, 0, 0, 0.64278698, 0.766044974, 0, -0.766044974, 0.64278698) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0, 1.55287015, 0.135475516, 1, 0, 0, 0, 0.939691961, -0.342022002, 0, 0.342022002, 0.939691961) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.965891123, 0.600056291, -0.939134777, 0.984807968, 0.173647299, 6.93650236e-07, 1.01327896e-06, -1.7285347e-06, -1.00000012, -0.173647314, 0.984807849, -1.81794167e-06) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.848382771, 0.642180681, -1.03612173, 0.973482251, -0.194533288, -0.120371334, -0.113977998, 0.0437724888, -0.992518544, 0.198346853, 0.979918897, 0.0204392672) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.500007629, -0.797153175, -0.95421052, 1, 0, 0, 0, 0.64278698, -0.766044974, 0, 0.766044974, 0.64278698) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.499992371, -0.700443864, -1.01739883, 1, 0, 0, 0, 0.64278698, -0.766044974, 0, 0.766044974, 0.64278698) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
		}, .3, false)
grab.Torso.Velocity= Vector3.new(0,0,0)
					end
					grab.Torso.Anchored = true
					Humanoid.JumpPower = 100
					Humanoid.Jump = true
					Torso.Velocity=RootPart.CFrame.upVector*150
					CFuncs.Sound.Create("158149887", Torso, 1, 1)
					wait(.1)
						for i = 0, .3, 0.1 do
							Torso.Velocity=RootPart.CFrame.lookVector*40
		swait()
		PlayAnimationFromTable({
         CFrame.new(-0, -0.486727536, -0.199950755, 1, 0, 0, 0, 0.64278698, 0.766044974, 0, -0.766044974, 0.64278698) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.0483627319, 1.54976475, 0.0516630113, 1, 0, 0, 0, 0.939691961, -0.342022002, 0, 0.342022002, 0.939691961) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(1.38765192, 1.19624639, -0.26731497, 0.98480922, 0.0301625114, -0.171000317, 1.10268593e-05, -0.984808326, -0.173645556, -0.173640087, 0.171005875, -0.969848573) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-1.319543, 1.38152361, -0.336561173, 0.973482132, -0.120370626, 0.194534108, -0.113977373, -0.992518663, -0.0437721014, 0.198347583, 0.0204388499, -0.979918599) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.500007629, -1.27044821, -0.954210758, 1, 0, 0, 0, 0.939692497, -0.34202078, 0, 0.34202078, 0.939692497) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.499992371, -1.1737386, -1.01739967, 1, 0, 0, 0, 0.939692497, -0.34202078, 0, 0.34202078, 0.939692497) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
		}, .3, false)
grab.Torso.Velocity= Vector3.new(0,0,0)
						end
						grab.Torso.Anchored = false
						grab.Torso.CanCollide = true
	Humanoid.JumpPower = 0
	RootPart.CFrame=RootPart.CFrame*CFrame.new(0,0,5)
		for i = 0, .3, 0.1 do
		swait()
		PlayAnimationFromTable({
         CFrame.new(0.428418577, -0.671607018, -0.504335344, 0.279453993, -0.262003154, 0.923720658, -0.663414001, 0.642787337, 0.383022666, -0.694109023, -0.719846487, 0.0058129211) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.0483628362, 1.549775, 0.0516622961, 1, 5.96046448e-08, -2.98023224e-08, -2.98023224e-08, 0.939693034, -0.342019409, 4.61004674e-08, 0.342019379, 0.939692855) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(1.37295699, 1.17039251, -0.337434739, 0.975084543, -0.109461486, -0.192946702, -0.170998245, -0.924961448, -0.339420587, -0.141314715, 0.363957286, -0.920633197) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-1.36459041, 0.411512792, -0.67284143, 0.973482847, -0.071649164, -0.21724999, -0.113974214, 0.671512127, -0.732176006, 0.198345765, 0.737521529, 0.645539343) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.499992371, -1.23907411, -0.86791718, 1, 0, 0, -2.98023224e-08, 0.939692259, 0.342021227, 4.61004674e-08, -0.342021227, 0.939692259) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.49999243, -1.17373872, -1.01739335, 1, 5.96046448e-08, -2.98023224e-08, -2.98023224e-08, 0.939693034, -0.342019409, 4.61004674e-08, 0.342019379, 0.939692855) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
		}, .3, false)
grab.Torso.Velocity= Vector3.new(0,0,0)
lockcam:Interpolate(Torso.CFrame*CFrame.new(3,3,5),grab.Torso.CFrame,.03)
		RootPart.CFrame = CFrame.new(RootPart.Position, Vector3.new(grab.Torso.Position.X, RootPart.Position.Y, RootPart.Position.Y))
		Torso.Velocity=RootPart.CFrame.lookVector*20
	end
		for i = 0, .3, 0.1 do
		swait()
		PlayAnimationFromTable({
         CFrame.new(-0.672757447, -0.735233426, -0.293752909, -0.962360024, 0.00164131995, 0.271772951, -0.0779609978, 0.956289232, -0.281838685, -0.260356098, -0.292417973, -0.920166552) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.0483631641, 1.42946541, -0.278911769, 1, -1.93715096e-07, 3.12924385e-06, -8.86619091e-07, 0.93969202, 0.342022359, -3.05473804e-06, -0.342022389, 0.939691842) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(1.37296712, 1.17040694, -0.337452441, 0.975084305, -0.109462924, -0.192946956, -0.17099987, -0.924960554, -0.3394216, -0.141314253, 0.363958538, -0.92063278) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-1.36458802, 0.411512852, -0.672853589, 0.973482966, -0.0716485977, -0.217249781, -0.113973796, 0.671514273, -0.73217392, 0.198345542, 0.737519622, 0.645541549) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.499996156, -1.23906803, -0.8679353, 1, 6.51925802e-09, 2.98023224e-08, -7.4505806e-09, 0.93969214, 0.342021704, -2.98023224e-08, -0.342021674, 0.93969214) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.499984771, -1.17374265, -1.01740098, 1, 1.49011612e-08, 1.49011612e-08, -7.4505806e-09, 0.939693391, -0.342018157, -2.98023224e-08, 0.342018127, 0.939693391) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
		}, .3, false)
grab.Torso.Velocity= Vector3.new(0,0,0)
lockcam:Interpolate(Torso.CFrame*CFrame.new(3,3,5),grab.Torso.CFrame,.03)
		RootPart.CFrame = CFrame.new(RootPart.Position, Vector3.new(grab.Torso.Position.X, RootPart.Position.Y, RootPart.Position.Y))
		Torso.Velocity=RootPart.CFrame.lookVector*30
	end			
		for i = 0, 1, 0.1 do
		swait()
		PlayAnimationFromTable({
         CFrame.new(-0.672760248, -0.525442183, -0.31977427, -0.962360263, 0.00164178992, 0.271772176, 0.0157880038, 0.998630762, 0.0498734191, -0.271318138, 0.0522869304, -0.961068571) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.0483647995, 1.42946613, -0.278905123, 1, 9.983778e-07, 2.77161598e-06, -1.89431012e-06, 0.939691663, 0.342023015, -2.29477882e-06, -0.342023104, 0.939691663) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(1.09112859, 0.115017235, -1.0051564, 0.975084007, 0.192946017, -0.109467886, -0.171004131, 0.339421302, -0.924959898, -0.141311631, 0.920633078, 0.363958895) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.0609193072, 0.338854641, -0.991647899, 0.297654182, -0.872375369, -0.387767076, -0.132688791, 0.364431024, -0.921728671, 0.945407808, 0.325808793, -0.00728001073) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.500003815, -1.88333619, -0.430999637, 1, 7.4505806e-09, 0, 0, 0.93969208, 0.342021674, 0, -0.342021674, 0.939692259) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.499977082, -1.17373788, -1.01740336, 1, 0, -2.98023224e-08, 0, 0.939693451, -0.342018157, 0, 0.342018187, 0.939693511) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
		}, .3, false)
grab.Torso.Velocity= Vector3.new(0,0,0)
lockcam:Interpolate(Torso.CFrame*CFrame.new(3,3,5),grab.Torso.CFrame,.03)
		RootPart.CFrame = CFrame.new(RootPart.Position, Vector3.new(grab.Torso.Position.X, RootPart.Position.Y, RootPart.Position.Y))
		Torso.Velocity=RootPart.CFrame.lookVector*40
		end	
		--pew here
				for i = 0, 1, 0.1 do
		swait()
		PlayAnimationFromTable({
         CFrame.new(-0.672760248, -0.525442183, -0.31977427, -0.962360263, 0.00164178992, 0.271772176, 0.0157880038, 0.998630762, 0.0498734191, -0.271318138, 0.0522869304, -0.961068571) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.0483647995, 1.42946613, -0.278905123, 1, 9.983778e-07, 2.77161598e-06, -1.89431012e-06, 0.939691663, 0.342023015, -2.29477882e-06, -0.342023104, 0.939691663) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(1.09112859, 0.115017235, -1.0051564, 0.975084007, 0.192946017, -0.109467886, -0.171004131, 0.339421302, -0.924959898, -0.141311631, 0.920633078, 0.363958895) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.0609193072, 0.338854641, -0.991647899, 0.297654182, -0.872375369, -0.387767076, -0.132688791, 0.364431024, -0.921728671, 0.945407808, 0.325808793, -0.00728001073) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.500003815, -1.88333619, -0.430999637, 1, 7.4505806e-09, 0, 0, 0.93969208, 0.342021674, 0, -0.342021674, 0.939692259) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.499977082, -1.17373788, -1.01740336, 1, 0, -2.98023224e-08, 0, 0.939693451, -0.342018157, 0, 0.342018187, 0.939693511) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
		}, .3, false)
grab.Torso.Velocity= Vector3.new(0,0,0)
lockcam:Interpolate(Torso.CFrame*CFrame.new(3,3,5),grab.Torso.CFrame,.03)
		RootPart.CFrame = CFrame.new(RootPart.Position, Vector3.new(grab.Torso.Position.X, RootPart.Position.Y, RootPart.Position.Y))
			    Effects.Block.Create(BrickColor.new("Gold"), bulletpart.CFrame, .5, .5, .5, .5, .5, .5, .1, 1)
		        Effects.Block.Create(BrickColor.new("Flame reddish orange"), bulletpart.CFrame, .5, .5, .5, .5, .5, .5, .1, 1)
				local shell = CFuncs.Part.Create(EffectModel, "SmoothPlastic", .1, 0, "Gold", "Effect", Vector3.new(.5,.8,.5))
				local shllmsh = CFuncs.Mesh.Create("CylinderMesh", shell, "", "", Vector3.new(0, 0, 0), Vector3.new(.3, .4, .3))
				shell.Anchored = false
				shell.Position = barrelcore.Position
				shell.CanCollide = true
				shell.Velocity=RootPart.CFrame.rightVector*10
				CFuncs.Sound.Create("1456344653", shell, 1, 1)
				game:GetService("Debris"):AddItem(shell, 2)
				CFuncs.Sound.Create("356911785", bulletpart, .5, 1)
			local smonk2 = Instance.new("ParticleEmitter",bulletpart)
			smonk2.LightEmission = .1
			smonk2.Size = NumberSequence.new(0.2)
			smonk2.Texture = "http://www.roblox.com/asset/?ID=476778304"
			aaa2 = NumberSequence.new({NumberSequenceKeypoint.new(0, .2),NumberSequenceKeypoint.new(1, 1.1)})
			bbb2 = NumberSequence.new({NumberSequenceKeypoint.new(0, .3),NumberSequenceKeypoint.new(0.0636, 0), NumberSequenceKeypoint.new(1, 1)})
			smonk2.Transparency = bbb2
			smonk2.Size = aaa2
			smonk2.ZOffset = 0
			smonk2.Acceleration = Vector3.new(0, -5, 0)
			smonk2.LockedToPart = false
			smonk2.EmissionDirection = "Back"
			smonk2.Lifetime = NumberRange.new(.1, .5)
			smonk2.Rate = 1000
			smonk2.Rotation = NumberRange.new(-100, 100)
			smonk2.RotSpeed = NumberRange.new(-100, 100)
			smonk2.Speed = NumberRange.new(4)
			smonk2.VelocitySpread = 100
			smonk2.Enabled=true
                        game:GetService("Debris"):AddItem(smonk2, .1)
		        Torso.Velocity=RootPart.CFrame.lookVector*50
				end	
	CFuncs.Sound.Create("521472140", grab.Torso, 5, 1)
	ShowDamage((grab.Torso.CFrame * CFrame.new(0, 0, (grab.Torso.Size.Z / 2)).p + Vector3.new(0, 3, 0)), "Crit!", 2, BrickColor.new(Torso.Color).Color)			
				end
	lockcam.CameraType = "Custom"			
	grab=nil
	Grabbed = false
	executing = false			
	Humanoid.AutoRotate = true	
	Humanoid.JumpPower = 100
	Humanoid.WalkSpeed = 25
		Attack = false
end




function righthop()
				Attack = true
			CFuncs.Sound.Create("158149887", Torso, 1, 1)
			Humanoid.Jump = true
				for i = 0, .5, 0.1 do
		swait()
					PlayAnimationFromTable({
         CFrame.new(-0, -1.01481628, -8.04662704e-07, 1, 0, 0, 0, 0.866025686, 0.499999642, -0, -0.499999642, 0.866025686) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0, 1.45637476, -0.213752031, 1, 0, 0, 0, 0.939692676, 0.342020601, 0, -0.342020601, 0.939692676) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(1.80887365, 0.563777864, 0.393151999, 0.642787039, -0.766044915, -1.2109125e-06, 0.754407167, 0.633021533, 0.173648313, -0.133021653, -0.111619815, 0.984807789) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-1.67181289, 0.594474256, -0.03263852, 0.499999285, 0.866025865, 1.98491279e-07, -0.750001073, 0.433012605, -0.499998599, -0.43301177, 0.249998808, 0.866026282) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.5, -1.80666828, -0.689023316, 1, 0, 0, 0, 0.984807849, 0.173648134, 0, -0.173648164, 0.984807849) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.5, -1.42673647, -0.144118369, 1, 0, 0, 0, 0.766044736, 0.642787457, 0, -0.642787457, 0.766044736) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
					}, .3, false)
				end
			Torso.Velocity=RootPart.CFrame.rightVector*200
	for i = 0, 1, 0.1 do
		swait()
		PlayAnimationFromTable({
         CFrame.new(0.708232701, 0.127894983, 0.246774122, 0.76604414, -0.111618884, 0.633022666, 0, 0.984807849, 0.173648044, -0.642788053, -0.13302207, 0.754406214) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.0324593484, 1.43977821, -0.119624585, 0.995960355, -0.0868238062, -0.0229113102, 0.0894833133, 0.938373625, 0.333838284, -0.00748568773, -0.334539831, 0.942351937) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(1.69410944, 0.329396009, -0.667013586, 0.977326989, -0.133022755, 0.164733544, 0.196574897, 0.280932605, -0.939380229, 0.0786799788, 0.95046401, 0.30071193) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-1.50714529, 0.0157378055, -0.431941032, 0.884520769, 0.235685706, -0.402585804, -0.362369925, 0.890611291, -0.274772465, 0.29378742, 0.388926923, 0.873169541) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.618915975, -1.85825384, -0.515439391, 0.98480773, 0.173648864, -1.81794167e-06, -0.17101045, 0.969846725, 0.173646331, 0.0301553011, -0.171007901, 0.984808087) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.523646474, -1.39458823, -0.171092927, 0.939692676, 0.342020273, 3.57627869e-07, -0.262003183, 0.719847083, 0.642786682, 0.219845772, -0.604022026, 0.766045213) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
		}, .3, false)
	end
	Attack = false	
end



function backhop()
				Attack = true
			CFuncs.Sound.Create("158149887", Torso, 1, 1)
			Humanoid.Jump = true
				for i = 0, .5, 0.1 do
		swait()
					PlayAnimationFromTable({
         CFrame.new(-0, -1.01481628, -8.04662704e-07, 1, 0, 0, 0, 0.866025686, 0.499999642, -0, -0.499999642, 0.866025686) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0, 1.45637476, -0.213752031, 1, 0, 0, 0, 0.939692676, 0.342020601, 0, -0.342020601, 0.939692676) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(1.80887365, 0.563777864, 0.393151999, 0.642787039, -0.766044915, -1.2109125e-06, 0.754407167, 0.633021533, 0.173648313, -0.133021653, -0.111619815, 0.984807789) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-1.67181289, 0.594474256, -0.03263852, 0.499999285, 0.866025865, 1.98491279e-07, -0.750001073, 0.433012605, -0.499998599, -0.43301177, 0.249998808, 0.866026282) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.5, -1.80666828, -0.689023316, 1, 0, 0, 0, 0.984807849, 0.173648134, 0, -0.173648164, 0.984807849) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.5, -1.42673647, -0.144118369, 1, 0, 0, 0, 0.766044736, 0.642787457, 0, -0.642787457, 0.766044736) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
					}, .3, false)
				end
			Torso.Velocity=RootPart.CFrame.lookVector*-200
	for i = 0, 1, 0.1 do
		swait()
		PlayAnimationFromTable({
         CFrame.new(-0.0724115372, 0.127895057, 0.313171744, 1, 0, 0, 0, 0.984807849, 0.173647985, 0, -0.173647985, 0.984807849) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.0169060901, 1.6077503, -0.180746168, 0.995960236, -0.0868240073, -0.0229110774, 0.089483425, 0.938373208, 0.333839238, -0.00748612173, -0.334540784, 0.94235158) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(1.70837259, 0.360651702, -0.922262371, 0.97732687, -0.133022964, 0.16473335, 0.196574748, 0.280932844, -0.939380288, 0.0786801279, 0.95046401, 0.300712109) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-1.48861361, 0.317329109, -0.925790071, 0.994410336, -0.000923748419, -0.105581462, -0.100659929, 0.293561995, -0.950625718, 0.0318728462, 0.955939651, 0.291828096) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.604445279, -1.94474173, -0.43701914, 0.94886601, -0.0119064255, -0.315454632, -0.0935085714, 0.943841219, -0.316891491, 0.301512092, 0.330185235, 0.894465506) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.577895403, -1.96714401, -0.475817055, 0.982055664, -0.0277231932, 0.186542824, 0.0885364786, 0.941134036, -0.326233506, -0.166517526, 0.336895287, 0.926700354) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
		}, .3, false)
	end
	Attack = false	
end




function lefthop()
			Attack = true
			Humanoid.Jump = true
			CFuncs.Sound.Create("158149887", Torso, 1, 1)
				for i = 0, .5, 0.1 do
		swait()
					PlayAnimationFromTable({
         CFrame.new(-0, -1.01481628, -8.04662704e-07, 1, 0, 0, 0, 0.866025686, 0.499999642, -0, -0.499999642, 0.866025686) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0, 1.45637476, -0.213752031, 1, 0, 0, 0, 0.939692676, 0.342020601, 0, -0.342020601, 0.939692676) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(1.80887365, 0.563777864, 0.393151999, 0.642787039, -0.766044915, -1.2109125e-06, 0.754407167, 0.633021533, 0.173648313, -0.133021653, -0.111619815, 0.984807789) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-1.67181289, 0.594474256, -0.03263852, 0.499999285, 0.866025865, 1.98491279e-07, -0.750001073, 0.433012605, -0.499998599, -0.43301177, 0.249998808, 0.866026282) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.5, -1.80666828, -0.689023316, 1, 0, 0, 0, 0.984807849, 0.173648134, 0, -0.173648164, 0.984807849) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.5, -1.42673647, -0.144118369, 1, 0, 0, 0, 0.766044736, 0.642787457, 0, -0.642787457, 0.766044736) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
					}, .3, false)
				end
			Torso.Velocity=RootPart.CFrame.rightVector*-200
	for i = 0, 1, 0.1 do
		swait()
		PlayAnimationFromTable({
         CFrame.new(-0.0850991905, 0.127894506, -0.50492847, 0.866025388, 0.0868241936, -0.492404073, 0, 0.98480773, 0.173648342, 0.500000238, -0.150383845, 0.852868438) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.0324628651, 1.43977714, -0.119621098, 0.928060651, -0.0868241191, -0.362167478, 0.198266238, 0.938373506, 0.283100247, 0.315268338, -0.334539741, 0.888081789) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(1.82837343, 0.425938904, -0.29435727, 0.642787039, -0.663414657, 0.383022308, 0.754407167, 0.635036588, -0.166127652, -0.133021653, 0.395739436, 0.908677995) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.822531939, 0.843190134, -1.47252464, 0.884521008, -0.355543315, -0.30201298, -0.362369865, -0.115946069, -0.924794376, 0.293787181, 0.927440405, -0.231394917) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.63746208, -1.78279781, -0.693231404, 0.984807849, -0.173648208, -1.1920929e-07, 0.171010107, 0.969846427, 0.173647493, -0.0301534832, -0.171009362, 0.984807909) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.471737981, -1.40906096, -0.158949912, 1.00000012, 7.15255737e-07, -5.96046448e-07, -1.56462193e-07, 0.766044557, 0.642787457, 8.64267349e-07, -0.642787457, 0.766044617) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
		}, .3, false)
	end
	Attack = false	
end



focused = false



function fire()
		Attack = true
	Humanoid.WalkSpeed = 8
	Humanoid.JumpPower = 0
Humanoid.AutoRotate = false
	bodygyro = Instance.new("BodyGyro",RootPart)
		bodygyro.MaxTorque = Vector3.new(50000,50000,50000)
			bodygyro.D = 2500
				bodygyro.P = 80000
		for i = 0, .5, 0.1 do
		swait()
		PlayAnimationFromTable({
         CFrame.new(-0.285053253, 0, 0.000710010529, 1, 0, 0, 0, 1, 0, 0, 0, 1) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(1.62422657e-06, 1.4772042, 0.113299504, 0.984807789, -2.16066837e-07, -0.173648417, 2.38418579e-07, 1, 2.98023224e-08, 0.173648387, -7.4505806e-08, 0.984807789) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.934092045, 0.617779732, -0.808870494, 0.958027482, -0.264440954, -0.110700212, -0.158811927, -0.168076277, -0.972897351, 0.238667816, 0.949642777, -0.203018084) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.00781965256, 0.58910501, -0.971779227, 0.754009128, -0.616460741, 0.226818621, 0.069166556, -0.268873394, -0.960689008, 0.653212428, 0.740056396, -0.160094544) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.597427905, -1.81130469, -0.378196716, 0.984808087, -1.49011612e-08, -0.173647672, 0.0301536024, 0.98480773, 0.171010017, 0.17100957, -0.173648089, 0.969846487) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.500000119, -1.96961212, -0.0941648632, 1.00000024, 7.4505806e-09, 2.98023224e-08, 7.4505806e-09, 1, 0, 0, 0, 1.00000012) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
		}, .3, false)
		bodygyro.CFrame = CFrame.new(RootPart.Position, Vector3.new(Mouse.Hit.p.X, RootPart.Position.Y, Mouse.Hit.p.Z))
		end

			local smonk = Instance.new("ParticleEmitter",bulletpart)
			smonk.LightEmission = .1
			smonk.Size = NumberSequence.new(0.2)
			smonk.Texture = "http://www.roblox.com/asset/?ID=476778304"
			aaa = NumberSequence.new({NumberSequenceKeypoint.new(0, .2),NumberSequenceKeypoint.new(1, 1)})
			bbb = NumberSequence.new({NumberSequenceKeypoint.new(0, .3),NumberSequenceKeypoint.new(0.0636, 0), NumberSequenceKeypoint.new(1, 1)})
			smonk.Transparency = bbb
			smonk.Size = aaa
			smonk.ZOffset = 0
			smonk.Acceleration = Vector3.new(0, -5, 0)
			smonk.LockedToPart = false
			smonk.EmissionDirection = "Back"
			smonk.Lifetime = NumberRange.new(.1, .3)
			smonk.Rate = 50
			smonk.Rotation = NumberRange.new(-100, 100)
			smonk.RotSpeed = NumberRange.new(-100, 100)
			smonk.Speed = NumberRange.new(4)
			smonk.VelocitySpread = 100
			smonk.Enabled=true


		        Effects.Block.Create(BrickColor.new("Gold"), bulletpart.CFrame, .5, .5, .5, .5, .5, .5, .1, 1)
		        Effects.Block.Create(BrickColor.new("Flame reddish orange"), bulletpart.CFrame, .5, .5, .5, .5, .5, .5, .1, 1)
				local shell = CFuncs.Part.Create(EffectModel, "SmoothPlastic", .1, 0, "Gold", "Effect", Vector3.new(.5,.8,.5))
				local shllmsh = CFuncs.Mesh.Create("CylinderMesh", shell, "", "", Vector3.new(0, 0, 0), Vector3.new(.3, .4, .3))
				shell.Anchored = false
				shell.Position = barrelcore.Position
				shell.CanCollide = true
				shell.Velocity=RootPart.CFrame.rightVector*10
				CFuncs.Sound.Create("1456344653", shell, 1, 1)
				game:GetService("Debris"):AddItem(shell, 2)
shoot(Mouse,3,bulletpart,0,10)
CFuncs.Sound.Create("356911785", bulletpart, .5, 1)
Torso.Velocity=RootPart.CFrame.lookVector*-5
	for i = 0, 1, 0.1 do
		swait()
		PlayAnimationFromTable({
         CFrame.new(-0.285053253, 0, 0.000710010529, 1, 0, 0, 0, 1, 0, 0, 0, 1) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.0369947627, 1.48165417, 0.0668118149, 0.984807968, -0.0593912825, -0.163174778, 0.0301539991, 0.983905494, -0.176127136, 0.171009004, 0.16853103, 0.970748782) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.950688183, 0.676530004, -0.873103976, 0.997509122, 0.0604504608, 0.0363512188, 0.062037006, -0.506553113, -0.859974027, -0.0335720032, 0.860087097, -0.509041429) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.151879251, 0.598398328, -1.02295005, 0.881140769, -0.420461625, 0.216339961, -0.0945639759, -0.604967773, -0.790614784, 0.463301867, 0.676184893, -0.572822273) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.612729192, -1.76533437, -0.18090108, 0.984807968, -0.0593911, -0.163174957, 0.0593909994, 0.998222888, -0.00488329167, 0.163175002, -0.00488201762, 0.98658514) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.514649093, -2.02197218, -0.350653172, 0.984807849, 3.4669165e-07, -0.173648134, -0.0301539954, 0.984807849, -0.171009868, 0.171009988, 0.173648044, 0.969846368) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
		}, .3, false)
bodygyro.CFrame = CFrame.new(RootPart.Position, Vector3.new(Mouse.Hit.p.X, RootPart.Position.Y, Mouse.Hit.p.Z))
	end
								    Attack = false
									Humanoid.WalkSpeed = 25
                                    smonk.Enabled=false
bodygyro:Destroy()
Humanoid.AutoRotate = true
Humanoid.JumpPower = 100
end


local AlignChar = game.Players.LocalPlayer.Character
local Hat = AlignChar:FindFirstChild("Type-49 Abomindation Back Accessory")

local Count = 1
function Align(Part0,Part1,Position,Angle)
    local AlignPos = Instance.new('AlignPosition', Part1); AlignPos.Name = "AliP_"..Count
    AlignPos.ApplyAtCenterOfMass = true;
    AlignPos.MaxForce = 5772000--67752;
    AlignPos.MaxVelocity = math.huge/9e110;
    AlignPos.ReactionForceEnabled = false;
    AlignPos.Responsiveness = 200;
    AlignPos.RigidityEnabled = false;
    local AlignOri = Instance.new('AlignOrientation', Part1); AlignOri.Name = "AliO_"..Count
    AlignOri.MaxAngularVelocity = math.huge/9e110;
    AlignOri.MaxTorque = 5772000
    AlignOri.PrimaryAxisOnly = false;
    AlignOri.ReactionTorqueEnabled = false;
    AlignOri.Responsiveness = 200;
    AlignOri.RigidityEnabled = false;
    local AttachmentA=Instance.new('Attachment',Part1); AttachmentA.Name = "AthP_"..Count
    local AttachmentB=Instance.new('Attachment',Part0); AttachmentB.Name = "AthP_"..Count
    local AttachmentC=Instance.new('Attachment',Part1); AttachmentC.Name = "AthO_"..Count
    local AttachmentD=Instance.new('Attachment',Part0); AttachmentD.Name = "AthO_"..Count
    AttachmentC.Orientation = Angle
    AttachmentA.Position = Position
    AlignPos.Attachment1 = AttachmentA;
    AlignPos.Attachment0 = AttachmentB;
    AlignOri.Attachment1 = AttachmentC;
    AlignOri.Attachment0 = AttachmentD;
    Count = Count + 1
end
Hat.Handle.AccessoryWeld:Destroy()
Align(Hat.Handle,game.Players.LocalPlayer.Character.Reanim.WeaponModel.Handle,Vector3.new(-.2,0.7,-1),Vector3.new(0,-90,-50))

-- part0 - the hat.
-- part1 - the model we want to align it with.


function autofire()
		Attack = true
	Humanoid.WalkSpeed = 0
	Humanoid.JumpPower = 0
Humanoid.AutoRotate = false
	    focused = true
		for i = 0, .5, 0.1 do
		swait()
		PlayAnimationFromTable({
         CFrame.new(-0.285053253, 0, 0.000710010529, 1, 0, 0, 0, 1, 0, 0, 0, 1) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(1.62422657e-06, 1.4772042, 0.113299504, 0.984807789, -2.16066837e-07, -0.173648417, 2.38418579e-07, 1, 2.98023224e-08, 0.173648387, -7.4505806e-08, 0.984807789) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.934092045, 0.617779732, -0.808870494, 0.958027482, -0.264440954, -0.110700212, -0.158811927, -0.168076277, -0.972897351, 0.238667816, 0.949642777, -0.203018084) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.00781965256, 0.58910501, -0.971779227, 0.754009128, -0.616460741, 0.226818621, 0.069166556, -0.268873394, -0.960689008, 0.653212428, 0.740056396, -0.160094544) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.597427905, -1.81130469, -0.378196716, 0.984808087, -1.49011612e-08, -0.173647672, 0.0301536024, 0.98480773, 0.171010017, 0.17100957, -0.173648089, 0.969846487) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.500000119, -1.96961212, -0.0941648632, 1.00000024, 7.4505806e-09, 2.98023224e-08, 7.4505806e-09, 1, 0, 0, 0, 1.00000012) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
		}, .3, false)
		end

			local smonk = Instance.new("ParticleEmitter",bulletpart)
			smonk.LightEmission = .1
			smonk.Size = NumberSequence.new(0.2)
			smonk.Texture = "http://www.roblox.com/asset/?ID=476778304"
			aaa = NumberSequence.new({NumberSequenceKeypoint.new(0, .2),NumberSequenceKeypoint.new(1, 1)})
			bbb = NumberSequence.new({NumberSequenceKeypoint.new(0, .3),NumberSequenceKeypoint.new(0.0636, 0), NumberSequenceKeypoint.new(1, 1)})
			smonk.Transparency = bbb
			smonk.Size = aaa
			smonk.ZOffset = 0
			smonk.Acceleration = Vector3.new(0, -5, 0)
			smonk.LockedToPart = false
			smonk.EmissionDirection = "Back"
			smonk.Lifetime = NumberRange.new(.1, .3)
			smonk.Rate = 50
			smonk.Rotation = NumberRange.new(-100, 100)
			smonk.RotSpeed = NumberRange.new(-100, 100)
			smonk.Speed = NumberRange.new(4)
			smonk.VelocitySpread = 100
			smonk.Enabled=true


		        Effects.Block.Create(BrickColor.new("Gold"), bulletpart.CFrame, .5, .5, .5, .5, .5, .5, .1, 1)
		        Effects.Block.Create(BrickColor.new("Flame reddish orange"), bulletpart.CFrame, .5, .5, .5, .5, .5, .5, .1, 1)
				local shell = CFuncs.Part.Create(EffectModel, "SmoothPlastic", .1, 0, "Gold", "Effect", Vector3.new(.5,.8,.5))
				local shllmsh = CFuncs.Mesh.Create("CylinderMesh", shell, "", "", Vector3.new(0, 0, 0), Vector3.new(.3, .4, .3))
				shell.Anchored = false
				shell.Position = barrelcore.Position
				shell.CanCollide = true
				shell.Velocity=RootPart.CFrame.rightVector*10
				CFuncs.Sound.Create("1456344653", shell, 1, 1)
				game:GetService("Debris"):AddItem(shell, 2)
				if targetted.Parent.Humanoid.Health > 100 then
					targetted.Parent.Humanoid.Health = 0
					ShowDamage((targetted.Parent.Torso.CFrame * CFrame.new(0, 0, (targetted.Parent.Torso.Size.Z / 2)).p + Vector3.new(0, 3, 0)), "[Health fixed]", 2, BrickColor.new("Really red").Color)
								elseif targetted.Parent.Humanoid.Health <= 100 then
					targetted.Parent.Humanoid.Health = targetted.Parent.Humanoid.Health - 30
					ShowDamage((targetted.Parent.Torso.CFrame * CFrame.new(0, 0, (targetted.Parent.Torso.Size.Z / 2)).p + Vector3.new(0, 3, 0)), "-30", 2, BrickColor.new(Torso.Color).Color)
													elseif targetted.Parent.Humanoid.Health <= 30 then

				end

CFuncs.Sound.Create("356911785", bulletpart, .5, 1)
	for i = 0, .5, 0.1 do
		swait()
		PlayAnimationFromTable({
         CFrame.new(-0.285053253, 0, 0.000710010529, 1, 0, 0, 0, 1, 0, 0, 0, 1) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.0369947627, 1.48165417, 0.0668118149, 0.984807968, -0.0593912825, -0.163174778, 0.0301539991, 0.983905494, -0.176127136, 0.171009004, 0.16853103, 0.970748782) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.950688183, 0.676530004, -0.873103976, 0.997509122, 0.0604504608, 0.0363512188, 0.062037006, -0.506553113, -0.859974027, -0.0335720032, 0.860087097, -0.509041429) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.151879251, 0.598398328, -1.02295005, 0.881140769, -0.420461625, 0.216339961, -0.0945639759, -0.604967773, -0.790614784, 0.463301867, 0.676184893, -0.572822273) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.612729192, -1.76533437, -0.18090108, 0.984807968, -0.0593911, -0.163174957, 0.0593909994, 0.998222888, -0.00488329167, 0.163175002, -0.00488201762, 0.98658514) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.514649093, -2.02197218, -0.350653172, 0.984807849, 3.4669165e-07, -0.173648134, -0.0301539954, 0.984807849, -0.171009868, 0.171009988, 0.173648044, 0.969846368) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
		}, .3, false)
	end
								    Attack = false
									focused = false	
									Humanoid.WalkSpeed = 25
                                    smonk.Enabled=false
Humanoid.AutoRotate = true
Humanoid.JumpPower = 100
end







Mouse.Button1Up:connect(function()
	if Attack == false and Anim ~= "Fall" and Anim ~= "Jump" and targetted == nil then
	fire()
	elseif Attack == false and Anim ~= "Fall" and Anim ~= "Jump" and targetted ~= nil then
	autofire()
	end
end)






Mouse.KeyDown:connect(function(Key)
	Key = Key:lower()
		if Attack == false and Anim ~= "Fall" and Anim ~= "Jump" and Key == 'e' then
righthop()
			elseif Attack == false and Anim ~= "Fall" and Anim ~= "Jump" and Key == 'q'  then
		lefthop()
			elseif Attack == false and Anim ~= "Fall" and Anim ~= "Jump" and Key == 'r'  then
		     backhop()
						   elseif Attack == false and Key == 'z' and Anim ~= "Fall" and Anim ~= "Jump" then
							pepper()
		                         elseif Attack == false and Key == 'x' and Anim ~= "Fall" and Anim ~= "Jump" then
							       smear()
										 elseif Attack == false and Key == 'f' and Anim ~= "Fall" and Anim ~= "Jump" and targetted == nil then
							              LockOn()
		                 						elseif Attack == false and Key == 'f' and targetted ~= nil then
													targetted = nil
													bodygyroo:Destroy()
							        			
	end
end)


	executing = false

local function OnHumanoidStateChange(oldState, newState)    --last thing humanoid was doing, current thing humanoid is doing
    if newState == Enum.HumanoidStateType.Landed and oldState == Enum.HumanoidStateType.Freefall and executing ~= true then --if they were falling and just landed then
       			if Attack == false then
				Attack = true 
				Humanoid.AutoRotate = false
				Humanoid.WalkSpeed = 0
				Humanoid.JumpPower = 0
				Torso.Velocity=RootPart.CFrame.lookVector*0
			CFuncs.Sound.Create("608350178", Torso, 3, 1)
	for i = 0, 1, 0.1 do
		swait()
		PlayAnimationFromTable({
         CFrame.new(-0, -1.01481593, 2.98023224e-08, 1, 0, 0, 0, 0.866025388, 0.500000238, 0, -0.500000238, 0.866025388) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0, 1.49999499, 1.11760201e-08, 1, 0, 0, 0, 0.999998331, -7.45067918e-09, 0, 7.45069251e-09, 1) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0),
         CFrame.new(1.50000763, -0.131187856, 0.26789096, 1, 0, 0, 0, 0.984807849, 0.173648536, 0, -0.173648536, 0.984807849) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.934591651, -0.108145729, -0.566749334, 0.984807849, 0.173647985, 0, -0.150383562, 0.852868617, -0.500000238, -0.0868240371, 0.492404163, 0.866025388) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.5, -0.643755913, -0.994426787, 1, 0, 0, 0, 0.984807789, -0.173648715, 0, 0.173648685, 0.984807789) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.5, -1.78364873, 0.343712032, 1, 0, 0, 0, 0.642787695, 0.766044557, 0, -0.766044557, 0.642787695) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
		}, .3, false)
	end
	
			end
							Humanoid.AutoRotate = true
				Humanoid.WalkSpeed = 25
				Humanoid.JumpPower = 100
				Attack = false
    end
end


Humanoid.StateChanged:connect(OnHumanoidStateChange)


destroyable = false

spawn(function()
	while true do
if targetted ~= nil and targetted.Parent.Head ~= nil then
		print("ghay")
	bodygyroo = Instance.new("BodyGyro",RootPart)
		bodygyroo.MaxTorque = Vector3.new(50000,50000,50000)
			bodygyroo.D = 2500
				bodygyroo.P = 50000
				while targetted ~= nil do
				bodygyroo.CFrame = CFrame.new(RootPart.Position, Vector3.new(targetted.Parent.Head.Position.X,RootPart.Position,targetted.Parent.Head.Position.Z))
				wait(.01)
				end
  elseif targetted == nil and destroyable == true then
	bodygyroo:Destroy()
	wait(.01)
elseif targetted ~= nil and Attack ~= true and focused ~= true then
		bodygyroo:Destroy()
end 
wait(.001)
	end
end)




while true do
	swait()
	for i, v in pairs(Character:GetChildren()) do
		if v:IsA("Part") then
			v.Material = "SmoothPlastic"
		elseif v:IsA("Accessory") then
			v:WaitForChild("Handle").Material = "SmoothPlastic"
		end
	end
	for i, v in pairs(Character:GetChildren()) do
		if v:IsA'Model' then
			for _, c in pairs(v:GetChildren()) do
				if c:IsA'Part' then
					c.CustomPhysicalProperties = PhysicalProperties.new(0.001, 0.001, 0.001, 0.001, 0.001)
				end
			end
		end
	end
	TorsoVelocity = (RootPart.Velocity * Vector3.new(1, 0, 1)).magnitude 
	Velocity = RootPart.Velocity.y
	Sine = Sine + Change
	local hit, pos = RayCast(RootPart.Position, (CFrame.new(RootPart.Position, RootPart.Position - Vector3.new(0, 1, 0))).lookVector, 4, Character)
	if RootPart.Velocity.y > 1 and hit == nil then 
		Anim = "Jump"
		if Attack == false then
			Change = 1
		PlayAnimationFromTable({
         CFrame.new(-0, -1.01481628, -8.04662704e-07, 1, 0, 0, 0, 0.866025686, 0.499999642, -0, -0.499999642, 0.866025686) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0, 1.45637476, -0.213752031, 1, 0, 0, 0, 0.939692676, 0.342020601, 0, -0.342020601, 0.939692676) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(1.80887365, 0.563777864, 0.393151999, 0.642787039, -0.766044915, -1.2109125e-06, 0.754407167, 0.633021533, 0.173648313, -0.133021653, -0.111619815, 0.984807789) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-1.67181289, 0.594474256, -0.03263852, 0.499999285, 0.866025865, 1.98491279e-07, -0.750001073, 0.433012605, -0.499998599, -0.43301177, 0.249998808, 0.866026282) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.5, -1.80666828, -0.689023316, 1, 0, 0, 0, 0.984807849, 0.173648134, 0, -0.173648164, 0.984807849) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.5, -1.42673647, -0.144118369, 1, 0, 0, 0, 0.766044736, 0.642787457, 0, -0.642787457, 0.766044736) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
		}, .3, false)
								FakeHandleWeld.C0 = clerp(FakeHandleWeld.C0, CFrame.new(0, -.1, .8) * CFrame.Angles(math.rad(80), math.rad(0), math.rad(0)), 0.3)
		
		end	
	elseif RootPart.Velocity.y < -1 and hit == nil then 
		Anim = "Fall"
		if Attack == false then
			Change = 1
		PlayAnimationFromTable({
         CFrame.new(-0, -1.01481628, -8.04662704e-07, 1, 0, 0, 0, 0.866025686, 0.499999642, -0, -0.499999642, 0.866025686) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0, 1.45637476, -0.213752031, 1, 0, 0, 0, 0.939692676, 0.342020601, 0, -0.342020601, 0.939692676) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(1.53209591, 0.16416876, 0.0263971146, 0.98480773, -0.173648164, -1.55591565e-07, 0.171010092, 0.969846427, 0.173648164, -0.0301535316, -0.171010077, 0.984807849) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-1.64498818, 0.287739754, -0.209731221, 0.86602509, 0.500000656, 7.92254752e-07, -0.433013529, 0.750000894, -0.499998152, -0.25, 0.433010578, 0.86602664) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.5, -1.26449406, -1.10387921, 1, 0, 0, 0, 0.984807849, -0.173647985, 0, 0.173647985, 0.984807849) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.5, -1.24956489, -0.292783707, 1, 0, 0, 0, 0.642787695, 0.766044557, 0, -0.766044557, 0.642787695) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
		}, .3, false)
						FakeHandleWeld.C0 = clerp(FakeHandleWeld.C0, CFrame.new(0, -.1, .8) * CFrame.Angles(math.rad(80), math.rad(0), math.rad(0)), 0.3)
		end		
	elseif TorsoVelocity < 1 and hit ~= nil then
		Anim = "Idle"
		if Attack == false then
			Change = 1
		PlayAnimationFromTable({
         CFrame.new(-0.00794177782, -7.4505806e-09, 0.0224991869, 0.76604414, 0.111618884, 0.633022666, 0, 0.984807849, -0.173648044, -0.642788053, 0.13302207, 0.754406214) * CFrame.new(0, 0 + 0.05 * math.cos(Sine/30), 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.0413136631, 1.49691474, -0.148686588, 0.767336428, 0.138277978, -0.626158178, 0.0824353173, 0.947098911, 0.310174853, 0.635923922, -0.289626002, 0.715344429) * CFrame.new(0, 0 + 0.05 * math.cos(Sine/15), 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.825092554, 0.0104905069, -0.775937021, 0.866025388, 0.433013171, -0.249999434, -0.433012217, 0.399518192, -0.808013439, -0.250001132, 0.808012903, 0.533492804) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.241498172, 0.0799458325, -0.802346468, 0.866025567, -0.469846159, 0.171009794, 0.383021832, 0.40355885, -0.830923855, 0.321393847, 0.785101831, 0.529453576) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(0.62906158, -2.01587725, 0.0849169493, 0.939692438, 0, -0.342020959, 0.0593912601, 0.984807849, 0.163175747, 0.336824834, -0.173648044, 0.92541641) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.43440938, -2.03143525, -0.00331869721, 0.98480773, 0, 0.173648447, -0.0301537216, 0.984807849, 0.171009928, -0.171010375, -0.173648044, 0.969846368) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
		}, .3, false)
				FakeHandleWeld.C0 = clerp(FakeHandleWeld.C0, CFrame.new(0, -.1, .8) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(0)), 0.3)
		end
	elseif TorsoVelocity > 2 and hit ~= nil then
		Anim = "Walk"
            if Attack == false then
                            PlayAnimationFromTable({
         CFrame.new(-0, -0, 0, 1, 0, 0, 0, 0.996187985, 0.0871556774, 0, -0.0871556699, 0.996194661) * CFrame.new(0, 0 + .1 * math.cos(Sine/35), 0) * CFrame.Angles(-.3 + 0.05 * math.cos(Sine/30), 0, 0),
         CFrame.new(0, 1.49999499, 1.11760201e-08, 1, 0, 0, 0, 0.999998331, -7.45067918e-09, 0, 7.45069251e-09, 1) * CFrame.new(0, 0 + 0.05 * math.cos(Sine/15), 0) * CFrame.Angles(0 + 0.05 * math.cos(Sine/15), 0, 0),
         CFrame.new(0.825092554, 0.0104905069, -0.775937021, 0.866025388, 0.433013171, -0.249999434, -0.433012217, 0.399518192, -0.808013439, -0.250001132, 0.808012903, 0.533492804) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
         CFrame.new(-0.241498172, 0.0799458325, -0.802346468, 0.866025567, -0.469846159, 0.171009794, 0.383021832, 0.40355885, -0.830923855, 0.321393847, 0.785101831, 0.529453576) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
		 CFrame.new(0.5, -2.00000334, 2.67028881e-005, 1, 0, 0, 0, 1.00000024, 0, 0, 0, 1.00000024) * CFrame.new(0, .4 + .8 * math.cos((Sine) / 2), -.1 + 1 * math.cos((Sine) / 4)) * CFrame.Angles(math.rad(1.8 - 50 * math.cos((Sine) / 4)), math.rad(0), math.rad(0)),
	     CFrame.new(-0.5, -2.00000334, 2.67028881e-005, 1, 0, 0, 0, 1.00000024, 0, 0, 0, 1.00000024) * CFrame.new(0, .4 + .8 * math.cos((Sine) / 2), .1 - 1 * math.cos((Sine) / 4)) * CFrame.Angles(math.rad(-1.8 + 50 * math.cos((Sine) / 4)), math.rad(0), math.rad(0)),
}, .3, false)
		FakeHandleWeld.C0 = clerp(FakeHandleWeld.C0, CFrame.new(0, -.1, .8) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(0)), 0.3)

end
end
	if #Effects > 0 then
		for e = 1, #Effects do
			if Effects[e] ~= nil then
				local Thing = Effects[e]
				if Thing ~= nil then
					local Part = Thing[1]
					local Mode = Thing[2]
					local Delay = Thing[3]
					local IncX = Thing[4]
					local IncY = Thing[5]
					if Thing[1].Transparency <= 1 then
						if Thing[2] == "Block1" then
							Thing[1].CFrame = Thing[1].CFrame * CFrame.fromEulerAnglesXYZ(math.random(-50, 50), math.random(-50, 50), math.random(-50, 50))
							Mesh = Thing[7]
							Mesh.Scale = Mesh.Scale + Vector3.new(Thing[4], Thing[5], Thing[6])
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
						elseif Thing[2] == "Ice" then
							if Thing[6] <= Thing[5] then
								Thing[6] = Thing[6] + .05
								Thing[1].CFrame = Thing[1].CFrame * CFrame.new(0, .4, 0)
							else
								Thing[1].Transparency = Thing[1].Transparency + Thing[3]
							end
						elseif Thing[2] == "Shatter" then
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
							Thing[4] = Thing[4] * CFrame.new(0, Thing[7], 0)
							Thing[1].CFrame = Thing[4] * CFrame.fromEulerAnglesXYZ(Thing[6], 0, 0)
							Thing[6] = Thing[6] + Thing[5]
						elseif Thing[2] == "Block2" then
							Thing[1].CFrame = Thing[1].CFrame
							Mesh = Thing[7]
							Mesh.Scale = Mesh.Scale + Vector3.new(Thing[4], Thing[5], Thing[6])
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
						elseif Thing[2] == "Block3" then
							Thing[1].CFrame = Thing[8].CFrame * CFrame.fromEulerAnglesXYZ(math.random(-50, 50), math.random(-50, 50), math.random(-50, 50))
							Mesh = Thing[7]
							Mesh.Scale = Mesh.Scale + Vector3.new(Thing[4], Thing[5], Thing[6])
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
						elseif Thing[2] == "Block4" then
							Thing[1].CFrame = Thing[8].CFrame * CFrame.new(0, -Thing[7].Scale.Y, 0) * CFrame.fromEulerAnglesXYZ(3.14, 0, 0)
							Mesh = Thing[7]
							Mesh.Scale = Mesh.Scale + Vector3.new(Thing[4], Thing[5], Thing[6])
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
						elseif Thing[2] == "Block2Fire" then
							Thing[1].CFrame = Thing[1].CFrame * CFrame.fromEulerAnglesXYZ(math.random(-50, 50), math.random(-50, 50), math.random(-50, 50))
							Mesh = Thing[7]
							Mesh.Scale = Mesh.Scale + Vector3.new(Thing[4], Thing[5], Thing[6])
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
							if Thing[1].Transparency >= .3 then
								Thing[1].BrickColor = BrickColor.new("Bright red")
							else
								Thing[1].BrickColor = BrickColor.new("Bright yellow")
							end
						elseif Thing[2] == "Cylinder" then
							Mesh = Thing[7]
							Mesh.Scale = Mesh.Scale + Vector3.new(Thing[4], Thing[5], Thing[6])
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
						elseif Thing[2] == "Blood" then
							Mesh = Thing[7]
							Thing[1].CFrame = Thing[1].CFrame * CFrame.new(0, -.5, 0)
							Mesh.Scale = Mesh.Scale + Vector3.new(Thing[4], Thing[5], Thing[6])
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
						elseif Thing[2] == "Elec" then
							Mesh = Thing[10]
							Mesh.Scale = Mesh.Scale + Vector3.new(Thing[7], Thing[8], Thing[9])
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
							Thing[1].CFrame = Thing[1].CFrame * Thing[11] * CFrame.new(0, 0, .2)
							Thing[1].Rotation = Vector3.new(0, 0, 0)
						elseif Thing[2] == "Disappear" then
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
						end
					else
						Part.Parent = nil
						table.remove(Effects, e)
					end
				end
			end
		end
	end	
	if Humanoid.PlatformStand == true then
		Humanoid.PlatformStand = false
	end
	if targetted ~= nil then
		destroyable = true
Humanoid.AutoRotate = false
crosshair.Adornee = targetted.Parent.Head
crosshair.Enabled = true
crosshair2.Adornee = targetted.Parent.Head
crosshair2.Enabled = true
crosshair3.Adornee = targetted.Parent.Head
crosshair3.Enabled = true
lockcam.CameraType = "Scriptable"
lockcam:Interpolate(RootPart.CFrame*CFrame.new(2,2,8),targetted.Parent.Head.CFrame,.1)
	elseif targetted == nil and executing == false then
		lockcam.CameraType = "Custom"
crosshair.Adornee = nil
crosshair.Enabled = false
crosshair2.Adornee = nil
crosshair2.Enabled = false
crosshair3.Adornee = nil
crosshair3.Enabled = false	
Humanoid.AutoRotate = true
	end	
end
