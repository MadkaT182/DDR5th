return Def.ActorFrame{
	LoadActor(THEME:GetPathB("ScreenLogo","background"));
	Def.Quad{
		InitCommand=cmd(Center;FullScreen;diffuse,color("0,0,0,0.625"));
	};
};