-- ScreenDemonstration Overlay
local t = Def.ActorFrame{
	InitCommand=function(self)
		-- force characters if the player has any
		if hasChars then
			local randChar1 = CHARMAN:GetRandomCharacter():GetCharacterID()
			local randChar2 = CHARMAN:GetRandomCharacter():GetCharacterID()
			GAMESTATE:SetCharacter(PLAYER_1,randChar1);
			GAMESTATE:SetCharacter(PLAYER_2,randChar2);
		end
	end;

	-- masks
	Def.Quad{
		InitCommand=cmd(CenterX;y,SCREEN_TOP;zoomto,SCREEN_WIDTH,44;diffuse,color("0,0,0,1");valign,0);
	};
	Def.Quad{
		InitCommand=cmd(CenterX;y,SCREEN_BOTTOM;zoomto,SCREEN_WIDTH,72;diffuse,color("0,0,0,1");valign,1);
	};

	LoadFont("ScreenSystemLayer credits normal")..{
		InitCommand=cmd(Center;SetTextureFiltering,false;zoom,2;settext,"GAME OVER");
		OnCommand=cmd(diffuseblink;effectcolor1,color("1,1,1,0.5");effectcolor2,color("0,0,0,1"));
	};

	LoadActor("_demonstration")..{
		InitCommand=cmd(x,SCREEN_CENTER_X-314;y,SCREEN_TOP+30;halign,0;);
	};
	LoadActor("_stars")..{
		InitCommand=cmd(x,SCREEN_CENTER_X+313;y,SCREEN_BOTTOM-57;halign,1;);
	};
};

return t;