return Def.ActorFrame{
	LoadActor(THEME:GetPathG("ScreenGameplay","StageDisplay"))..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_TOP+58;addy,-100;linear,1;addy,100);
		OffCommand=cmd(linear,1;addy,-100);
	};
	LoadActor(THEME:GetPathG("ScreenGameplay","difficulty"))..{
		OnCommand=cmd(y,SCREEN_CENTER_Y+154);
		Condition=not GAMESTATE:IsDemonstration();
	};
	-- LoadActor(THEME:GetPathG("ScreenGameplay","EditName"))..{

	-- };
};