AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include('shared.lua')


function ENT:Initialize( )
	
	self:SetModel( "models/props_trainstation/payphone001a.mdl" )
	self:PhysicsInit(SOLID_VPHYSICS);
    self:SetMoveType(MOVETYPE_VPHYSICS);
    self:SetSolid(SOLID_VPHYSICS);
	self:SetUseType( SIMPLE_USE )


end

function ENT:OnTakeDamage()
	return false 
end 

function ENT:AcceptInput( Name, Activator, Caller )	

	if Name == "Use" and Caller:IsPlayer() then
		 
		umsg.Start("pubano", Caller) 
		umsg.End()
		
	end
	
end

 util.AddNetworkString( "npcayzano" )
net.Receive( "npcayzano", function(length, ply)
local Text = net.ReadString()
 for k,v in pairs(player.GetAll()) do
DarkRP.talkToPerson(v, Color(255,0,0), "[Anonyme] ", Color(0,0,0), Text, nil)
end
end)
util.AddNetworkString( "bouttonano" )
net.Receive( "bouttonano", function(length, ply)
local Text = net.ReadString()
 for k,v in pairs(player.GetAll()) do
DarkRP.talkToPerson(v, Color(255,0,0), "[Anonyme] ", Color(0,0,0), Text, nil)
end
end)

util.AddNetworkString( "npcayz" )
net.Receive( "npcayz", function(length, ply)
 local money = ply:getDarkRPVar("money")   if money >= 100 then
   DarkRP.notify(ply,0,7,"Vous avez acheté un Advert pour 100€!")
ply:addMoney(100 * -1)
 else
  DarkRP.notify(ply,1,7,"Vous n'avez pas assez d'argent pour acheter un Advert")
return false
end
local Text = net.ReadString()
 for k,v in pairs(player.GetAll()) do
DarkRP.talkToPerson(v, Color(234,255,0), "[Publicite] " .. ply:Nick(), Color(234,255,0), Text, ply)
end
end)

util.AddNetworkString( "bouttonbuyadvert" )
net.Receive( "bouttonbuyadvert", function(length, ply)
 local money = ply:getDarkRPVar("money")   if money >= 100 then
   DarkRP.notify(ply,0,7,"Vous avez acheté un Advert pour 100€!")
ply:addMoney(100 * -1)
 else
  DarkRP.notify(ply,1,7,"Vous n'avez pas assez d'argent pour acheter un Advert")
return false
end
local Text = net.ReadString()
 for k,v in pairs(player.GetAll()) do
DarkRP.talkToPerson(v, Color(234,255,0), "[Publicite] " .. ply:Nick(), Color(234,255,0), Text, ply)
end
end)
