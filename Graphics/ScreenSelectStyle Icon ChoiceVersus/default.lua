-- ScreenSelectStyle/Versus
local masterPlayer = GAMESTATE:GetMasterPlayerNumber() == PLAYER_1 and "P1" or "P2"
local secondPlayer = GAMESTATE:GetMasterPlayerNumber() == PLAYER_1 and "P2" or "P1"

local t = Def.ActorFrame{
	LoadActor(THEME:GetPathG("_pad","double"))..{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+28;cropbottom,1);
		OnCommand=cmd(linear,0.5;cropbottom,0);
		OffCommand=cmd(linear,0.5;cropbottom,1);
		GainFocusCommand=cmd(diffuse,color("1,1,1,1"));
		LoseFocusCommand=cmd(diffuse,color("0.25,0.25,0.25,1"));
	};
	LoadActor(THEME:GetPathG("","_dancers/dancer"..masterPlayer))..{
		InitCommand=cmd(x,SCREEN_CENTER_X-45;y,SCREEN_CENTER_Y-49;cropbottom,1);
		OnCommand=cmd(linear,0.5;cropbottom,0);
		OffCommand=cmd(linear,0.5;cropbottom,1);
		GainFocusCommand=cmd(diffuse,color("1,1,1,1");play);
		LoseFocusCommand=cmd(diffuse,color("0.55,0.55,0.55,1");pause);
	};
	LoadActor(THEME:GetPathG("","_dancers/dancer"..secondPlayer))..{
		InitCommand=cmd(x,SCREEN_CENTER_X+40;y,SCREEN_CENTER_Y-87;cropbottom,1);
		OnCommand=cmd(linear,0.5;cropbottom,0);
		OffCommand=cmd(linear,0.5;cropbottom,1);
		GainFocusCommand=cmd(diffuse,color("1,1,1,1");play);
		LoseFocusCommand=cmd(diffuse,color("0.5,0.5,0.5,1");pause);
	};

	-- join
	LoadActor(THEME:GetPathG("_selstyle","join "..secondPlayer))..{
		InitCommand=cmd(x,SCREEN_CENTER_X+40;y,SCREEN_CENTER_Y-87;diffuseshift;effectcolor1,color("1,1,1,1");effectcolor2,color("0,0,0,1");effectperiod,0.5;cropbottom,1);
		BeginCommand=function(self)
			-- don't show in Home mode.
			if GAMESTATE:GetCoinMode() == 'CoinMode_Home' then
				self:visible(false)
			end;
			-- don't show if Joint Premium is on
			if PREFSMAN:GetPreference("Premium") == "Premium_2PlayersFor1Credit" then
				self:visible(false)
			end
		end;
		OnCommand=cmd(linear,0.5;cropbottom,0);
		OffCommand=cmd(linear,0.5;cropbottom,1);
		PlayerJoinedMessageCommand=cmd(playcommand,"Off");
	};

	Def.ActorFrame{
		Name="StageBubbleFrame";
		InitCommand=cmd(x,SCREEN_CENTER_X-120;y,SCREEN_CENTER_Y-29);
		GainFocusCommand=cmd(stoptweening;linear,0.2;y,SCREEN_CENTER_Y-140);
		LoseFocusCommand=cmd(stoptweening;linear,0.2;y,SCREEN_CENTER_Y+17);
		LoadActor(THEME:GetPathG("_stage bubble","right"))..{
			InitCommand=cmd(cropbottom,1);
			OnCommand=cmd(linear,0.5;cropbottom,0);
			OffCommand=cmd(sleep,0.1;linear,0.4;cropbottom,1);
			GainFocusCommand=cmd(bob;effectmagnitude,0,10,0;diffuse,color("1,1,1,1"););
			LoseFocusCommand=cmd(stopeffect;diffuse,color("0.5,0.5,0.5,1"));
		};
		LoadFont("ScreenSelectStyle NumStages")..{
			Text=PREFSMAN:GetPreference("SongsPerPlay");
			InitCommand=cmd(x,-25;y,-9;);
			OffCommand=cmd(sleep,0.25;diffusealpha,0);
			GainFocusCommand=cmd(bob;effectmagnitude,0,10,0;diffuse,color("1,1,1,1"););
			LoseFocusCommand=cmd(stopeffect;diffuse,color("0.5,0.5,0.5,1"));
		};
		Def.Quad{
			InitCommand=cmd(x,-25;y,2;zoomto,22,20;valign,1;diffuse,color("#9CFF00"));
			OnCommand=cmd(linear,0.5;zoomy,0);
			OffCommand=cmd(linear,0.25;zoomy,10;sleep,0.01;cropbottom,0.6;linear,0.1;zoomy,20;cropbottom,1);
			GainFocusCommand=cmd(bob;effectmagnitude,0,10,0;diffuse,color("#9CFF00"));
			LoseFocusCommand=cmd(stopeffect;diffuse,color("#4A7B00"));
		};
	};

	LoadActor("_label")..{
		InitCommand=cmd(x,SCREEN_CENTER_X-176;y,SCREEN_CENTER_Y+144);
		OnCommand=function(self)
			if GAMESTATE:GetNumPlayersEnabled() == 1 then
				self:cropbottom(1);
				self:linear(0.5);
				self:cropbottom(0);
			end
		end;
		OffCommand=cmd(linear,0.5;cropbottom,1);
		GainFocusCommand=cmd(visible,true);
		LoseFocusCommand=cmd(visible,false);
	};
	LoadActor("_explain")..{
		Name="ExplainMain";
		InitCommand=cmd(x,SCREEN_CENTER_X+86;y,SCREEN_CENTER_Y+160;cropright,1;cropbottom,0.5);
		OnCommand=function(self)
			self:hibernate(0.1);
			if GAMESTATE:GetNumPlayersEnabled() == 2 then
				self:queuecommand("GainFocus");
			end
		end;
		OffCommand=cmd(stoptweening;linear,0.5;cropbottom,1);
		GainFocusCommand=cmd(stoptweening;visible,true;cropright,1;linear,0.5;cropright,0);
		LoseFocusCommand=cmd(stoptweening;visible,false;cropright,0);
	};
	LoadActor("_explain")..{
		Name="ExplainSecondary";
		InitCommand=cmd(x,SCREEN_CENTER_X+86;y,SCREEN_CENTER_Y+160;cropright,1;croptop,0.5);
		OnCommand=function(self)
			self:hibernate(0.1);
			if GAMESTATE:GetNumPlayersEnabled() == 2 then
				self:queuecommand("GainFocus");
			end
		end;
		OffCommand=cmd(stoptweening;linear,0.5;cropbottom,1);
		GainFocusCommand=cmd(stoptweening;visible,true;cropright,1;sleep,1;linear,0.5;cropright,0);
		LoseFocusCommand=cmd(stoptweening;visible,false;cropright,0);
	};
	Def.Quad{
		Name="Line1Hider";
		InitCommand=cmd(x,SCREEN_CENTER_X-74;y,SCREEN_CENTER_Y+148;zoomto,16,24;diffuse,color("#009CD6");diffusealpha,0);
		OnCommand=function(self)
			self:hibernate(0.1);
			if GAMESTATE:GetNumPlayersEnabled() == 2 then
				self:queuecommand("GainFocus");
			end
		end;
		OffCommand=cmd(stoptweening;linear,0.5;cropbottom,1);
		GainFocusCommand=cmd(diffusealpha,1;x,SCREEN_CENTER_X-74;diffuseblink;effectcolor1,color("#009CD600");effectcolor2,color("#009CD6FF");effectperiod,0.25;linear,0.5;x,SCREEN_CENTER_X+254;sleep,0.5;diffusealpha,0);
		LoseFocusCommand=cmd(stoptweening;x,SCREEN_CENTER_X-74;diffusealpha,0);
	};
	Def.Quad{
		Name="Line2Hider";
		InitCommand=cmd(x,SCREEN_CENTER_X-74;y,SCREEN_CENTER_Y+172;zoomto,16,24;diffuse,color("#009CD6");diffusealpha,0);
		OnCommand=function(self)
			self:hibernate(0.1);
			if GAMESTATE:GetNumPlayersEnabled() == 2 then
				self:queuecommand("GainFocus");
			end
		end;
		OffCommand=cmd(stoptweening;linear,0.5;cropbottom,1);
		GainFocusCommand=cmd(diffusealpha,0;x,SCREEN_CENTER_X-74;sleep,1;diffusealpha,1;diffuseblink;effectcolor1,color("#009CD600");effectcolor2,color("#009CD6FF");effectperiod,0.25;linear,0.5;x,SCREEN_CENTER_X+254);
		LoseFocusCommand=cmd(stoptweening;x,SCREEN_CENTER_X-74;diffusealpha,0);
	};
};

return t;