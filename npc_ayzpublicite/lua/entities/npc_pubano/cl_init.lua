include('shared.lua')
 
surface.CreateFont( "HUDNumber5", {
    font = "HudNumbers",
    size = 13,
    weight = 500,
} )
 
function pubano ()
 
    local DermaFrame = vgui.Create( "DFrame" )
    DermaFrame:SetPos( ScrW()/2-150, ScrH()/2-150 )
    DermaFrame:SetSize( 350, 350 )
    DermaFrame:SetTitle( "" )
    DermaFrame:SetVisible( true )
    DermaFrame:MakePopup()
    DermaFrame:ShowCloseButton( false )
    local MainPanel = vgui.Create("DPanel", DermaFrame)
    MainPanel:SetSize(DermaFrame:GetWide(), DermaFrame:GetTall())
    MainPanel.Paint = function(self)
 
        draw.RoundedBox( 5, 0, 0, MainPanel:GetWide(), MainPanel:GetTall(), Color( 52, 57, 62, 250))
        draw.SimpleText("Diffuser une annonce", "Trebuchet24", 20, 10,Color(255,255,255,250),TEXT_ALIGN_LEFT)
        draw.SimpleText("ANNONCE PUBLICITAIRE", "Trebuchet24", 100, 65,Color(255,255,255,250),TEXT_ALIGN_LEFT)
        draw.SimpleText("ANNONCE ANONYME", "Trebuchet24", 100, 220,Color(255,255,255,250),TEXT_ALIGN_LEFT)
end

local CloseButton = vgui.Create("DButton", DermaFrame)
CloseButton:SetSize(DermaFrame:GetWide() / 10, DermaFrame:GetTall() / 10- 5) 
CloseButton:AlignRight(8)
CloseButton:AlignTop(8)
CloseButton:SetText("")
CloseButton.DoClick = function()

DermaFrame:Close()

end
CloseButton.Paint = function(self)

draw.RoundedBox(0,0,0,CloseButton:GetWide(),CloseButton:GetTall(),Color(255,0,0,255))

draw.DrawText("X ","Trebuchet24",CloseButton:GetWide() / 4+1,CloseButton:GetTall() / 11,Color(255,255,255,255),TEXT_ALIGN_LEFT) 

if CloseButton:IsHovered() then

draw.DrawText("X ","Trebuchet24",CloseButton:GetWide() / 4+1,CloseButton:GetTall() / 11-2,Color(255,255,255,255),TEXT_ALIGN_LEFT) 
end

end
DButtonAdvert = vgui.Create("DButton",DermaFrame)
DButtonAdvert:SetText("Advert")
DButtonAdvert:SetParent( DermaFrame )  
DButtonAdvert:SetPos(100,100)
DButtonAdvert:SetTextColor( Color( 0, 0, 0, 255 ) )
DButtonAdvert:SetFont("Trebuchet24")
DButtonAdvert:SetSize(150,50)
DButtonAdvert.Paint = function( self, w, h )
    draw.RoundedBox( 4, 0, 0, w, h, Color( 207, 77, 0, 225 ) )
end
DButtonAdvert.DoClick = function()
DermaFrame:Close()
 local FrameAdvert = vgui.Create( "DFrame" )
FrameAdvert:SetSize( 400, 200 )
FrameAdvert:Center()
FrameAdvert:SetTitle( "" )
FrameAdvert:ShowCloseButton( false )
FrameAdvert:MakePopup()
FrameAdvert.Paint = function( self, w, h )
    draw.RoundedBox( 4, 0, 0, w, h, Color( 0, 0, 0, 255 ) )
	draw.SimpleText("Payer 100€ Pour faire un Advert", "Trebuchet24", 60, 150,Color(255,255,255,250),TEXT_ALIGN_LEFT)
end
local CloseButton = vgui.Create("DButton", FrameAdvert)
CloseButton:SetSize(FrameAdvert:GetWide() / 10, FrameAdvert:GetTall() / 6- 5) 
CloseButton:AlignRight(8)
CloseButton:AlignTop(8)
CloseButton:SetText("")
CloseButton.DoClick = function()

FrameAdvert:Close()

end
CloseButton.Paint = function(self)

draw.RoundedBox(0,0,0,CloseButton:GetWide(),CloseButton:GetTall(),Color(255,0,0,255))

draw.DrawText("X ","Trebuchet24",CloseButton:GetWide() / 4+1,CloseButton:GetTall() / 11,Color(255,255,255,255),TEXT_ALIGN_LEFT) 

if CloseButton:IsHovered() then

draw.DrawText("X ","Trebuchet24",CloseButton:GetWide() / 4+1,CloseButton:GetTall() / 11-2,Color(255,255,255,255),TEXT_ALIGN_LEFT) 
end

end
local TextEntryAdvert = vgui.Create( "DTextEntry", FrameAdvert )
TextEntryAdvert:SetPos( 50, 50 )
TextEntryAdvert:SetSize( 300, 25 )
TextEntryAdvert:SetText("Veuillez saisir votre message ici même...")
TextEntryAdvert.OnEnter = function( self )
text = self:GetValue()
 
net.Start( "npcayz" )
    net.WriteString( TextEntryAdvert:GetValue() )
net.SendToServer()

end
DButtonpub = vgui.Create("DButton",DermaFrame)
DButtonpub:SetText("Envoyer")
DButtonpub:SetParent( FrameAdvert )  
DButtonpub:SetPos(125,95)
DButtonpub:SetTextColor( Color( 0,0,0, 250 ) )
DButtonpub:SetFont("Trebuchet24")
DButtonpub:SetSize(150,50)
DButtonpub.Paint = function( self, w, h )
    draw.RoundedBox( 4, 0, 0, w, h, Color( 255, 255, 255, 255 ) )
end
DButtonpub.DoClick = function()
FrameAdvert:Close()
TextEntryAdvert:GetValue()
net.Start( "bouttonbuyadvert" )
    net.WriteString( TextEntryAdvert:GetValue() )
net.SendToServer()
end
end
DermaButtonAno = vgui.Create("DButton",DermaFrame)
DermaButtonAno:SetText("Anonyme")
DermaButtonAno:SetParent( DermaFrame ) 
DermaButtonAno:SetPos(100,250)
DermaButtonAno:SetTextColor( Color( 0, 0, 0, 255 ) )
DermaButtonAno:SetFont("Trebuchet24")
DermaButtonAno:SetSize(150,50)
DermaButtonAno.Paint = function( self, w, h )
    draw.RoundedBox( 4, 0, 0, w, h, Color( 207, 77, 0, 225 ) )
end
 DermaButtonAno.DoClick = function()
 DermaFrame:Close()
local FrameAno = vgui.Create( "DFrame" )
FrameAno:SetSize( 400, 200 )
FrameAno:SetTitle( "" )
FrameAno:Center()
FrameAno:MakePopup()
FrameAno:ShowCloseButton( false )
FrameAno.Paint = function( self, w, h )
draw.RoundedBox( 4, 0, 0, w, h, Color( 0, 0, 0, 255 ) )
draw.SimpleText("Publier une Annonce Anonyme", "Trebuchet24", 60, 150,Color(255,255,255,250),TEXT_ALIGN_LEFT)
end
local CloseButton = vgui.Create("DButton", FrameAno)
CloseButton:SetSize(FrameAno:GetWide() / 10, FrameAno:GetTall() / 6- 5) 
CloseButton:AlignRight(8)
CloseButton:AlignTop(8)
CloseButton:SetText("")
CloseButton.DoClick = function()

FrameAno:Close()

end
CloseButton.Paint = function(self)

draw.RoundedBox(0,0,0,CloseButton:GetWide(),CloseButton:GetTall(),Color(255,0,0,255))

draw.DrawText("X ","Trebuchet24",CloseButton:GetWide() / 4+1,CloseButton:GetTall() / 11,Color(255,255,255,255),TEXT_ALIGN_LEFT) 

if CloseButton:IsHovered() then

draw.DrawText("X ","Trebuchet24",CloseButton:GetWide() / 4+1,CloseButton:GetTall() / 11-2,Color(255,255,255,255),TEXT_ALIGN_LEFT) 
end

end
local TextEntryAno = vgui.Create( "DTextEntry", FrameAno )
TextEntryAno:SetPos( 50, 50 )
TextEntryAno:SetSize( 300, 25 )
TextEntryAno:SetText("Veuillez saisir votre message ici même...")
TextEntryAno.OnEnter = function( self )
    text = self:GetValue()
   
net.Start( "npcayzano" )
    net.WriteString( TextEntryAno:GetValue() )
net.SendToServer()
end
DButtonano = vgui.Create("DButton",DermaFrame)
DButtonano:SetText("Envoyer")
DButtonano:SetParent( FrameAno )  
DButtonano:SetPos(125,95)
DButtonano:SetTextColor( Color( 0, 0, 0, 250 ) )
DButtonano:SetFont("Trebuchet24")
DButtonano:SetSize(150,50)
DButtonano.Paint = function( self, w, h )
    draw.RoundedBox( 4, 0, 0, w, h, Color( 255, 255, 255, 255 ) )
end
DButtonano.DoClick = function()
FrameAno:Close()
TextEntryAno:GetValue()
net.Start( "bouttonano" )
    net.WriteString( TextEntryAno:GetValue() )
net.SendToServer()
end
end
 
end

usermessage.Hook("pubano", pubano)
 
 
hook.Add("PostDrawOpaqueRenderables", "pubano", function()
    for _, ent in pairs (ents.FindByClass("npc_pubano")) do
        if ent:GetPos():Distance(LocalPlayer():GetPos()) < 1000 then
            local Ang = ent:GetAngles()
 
            Ang:RotateAroundAxis( Ang:Forward(), 90)
            Ang:RotateAroundAxis( Ang:Right(), -90)
       
            cam.Start3D2D(ent:GetPos()+ent:GetUp()*79, Ang, 0.20)
                draw.SimpleTextOutlined( 'NPC AYPUB', "HUDNumber5", 0, 0, Color( 255, 0, 0, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, Color(0, 0, 0, 255))          
            cam.End3D2D()
        end
    end
end)

