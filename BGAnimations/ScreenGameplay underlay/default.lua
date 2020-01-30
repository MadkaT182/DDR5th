local t = Def.ActorFrame{
	Def.ActorFrame{
		Name="BarPart";
		InitCommand=cmd(Center);

		Def.Quad{
			Name="TheBar";
			InitCommand=cmd(zoomto,SCREEN_WIDTH,76;diffuse,color("0,0,0,0"));
			ShowDangerAllMessageCommand=cmd(diffusealpha,1);
			HideDangerAllMessageCommand=cmd(diffusealpha,0);
		};

		-- danger #1 (pink)
		LoadActor("_danger pink")..{
			InitCommand=cmd(diffusealpha,0);
			ShowDangerAllMessageCommand=cmd();
			HideDangerAllMessageCommand=cmd(stopeffect;diffusealpha,0);
		};
		-- danger #2 (green)
		LoadActor("_danger green")..{
			InitCommand=cmd(diffusealpha,0);
			ShowDangerAllMessageCommand=cmd();
			HideDangerAllMessageCommand=cmd(stopeffect;diffusealpha,0);
		};
	};
	Def.Quad{
		Name="TopMask";
		InitCommand=cmd(CenterX;y,SCREEN_TOP;valign,0;zoomto,SCREEN_WIDTH,46;diffuse,color("0,0,0,1"));
	};
	Def.Quad{
		Name="BotMask";
		InitCommand=cmd(CenterX;y,SCREEN_BOTTOM;valign,1;zoomto,SCREEN_WIDTH,67;diffuse,color("0,0,0,1"));
	};
};

return t