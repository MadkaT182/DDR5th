return Def.ActorFrame{
	LoadActor(THEME:GetPathG("ScreenGameplay","LifeFrame"))..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_TOP+23;addy,-100;linear,1;addy,100);
	};
	LoadActor(THEME:GetPathG("ScreenGameplay","ScoreFrame"))..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-32;addy,100;linear,1;addy,-100);
		OffCommand=cmd(linear,1;addy,100);
	};
};