return Def.ActorFrame{
	LoadActor("_explanation jp")..{
		InitCommand=cmd(x,SCREEN_CENTER_X+132;y,SCREEN_CENTER_Y-171;cropbottom,1);
		OnCommand=cmd(linear,0.5;cropbottom,0);
		OffCommand=cmd(linear,0.5;cropbottom,1);
	};
	LoadActor("joint premium")..{
		InitCommand=cmd(x,SCREEN_CENTER_X-207;y,SCREEN_CENTER_Y-170;cropbottom,1);
		BeginCommand=function(self)
			if GAMESTATE:GetCoinMode() == 'CoinMode_Home' then
				self:visible(false)
			else
				self:visible(PREFSMAN:GetPreference("Premium") == "Premium_2PlayersFor1Credit")
			end;
		end;
		OnCommand=cmd(linear,0.5;cropbottom,0);
		OffCommand=cmd(linear,0.5;cropbottom,1);
	};
	-- Def.Sprite{
	-- 	Name="HelpP1";
	-- 	InitCommand=cmd(x,SCREEN_CENTER_X-160;y,SCREEN_BOTTOM-34;addy,100;playcommand,"Set");
	-- 	OnCommand=cmd(diffuseblink;effectperiod,1.056;linear,0.25;addy,-100;);
	-- 	OffCommand=cmd(linear,0.25;addy,100;);
	-- 	PlayerJoinedMessageCommand=cmd(playcommand,"Set");
	-- 	SetCommand=function(self)
	-- 		local helpGraphic;
	-- 		if GAMESTATE:IsHumanPlayer(PLAYER_1) then
	-- 			helpGraphic = THEME:GetPathG("","_help/_lr-start "..GetGraphicType())
	-- 		else
	-- 			helpGraphic = THEME:GetPathG("","_help/_join "..GetGraphicType())
	-- 		end;
	-- 		self:Load(helpGraphic);
	-- 	end;
	-- };
	-- Def.Sprite{
	-- 	Name="HelpP2";
	-- 	InitCommand=cmd(x,SCREEN_CENTER_X+160;y,SCREEN_BOTTOM-34;addy,100;playcommand,"Set");
	-- 	OnCommand=cmd(diffuseblink;effectperiod,1.056;linear,0.25;addy,-100;);
	-- 	OffCommand=cmd(linear,0.25;addy,100;);
	-- 	PlayerJoinedMessageCommand=cmd(playcommand,"Set");
	-- 	SetCommand=function(self)
	-- 		local helpGraphic;
	-- 		if GAMESTATE:IsHumanPlayer(PLAYER_2) then
	-- 			helpGraphic = THEME:GetPathG("","_help/_lr-start "..GetGraphicType())
	-- 		else
	-- 			helpGraphic = THEME:GetPathG("","_help/_join "..GetGraphicType())
	-- 		end;
	-- 		self:Load(helpGraphic);
	-- 	end;
	-- };
};