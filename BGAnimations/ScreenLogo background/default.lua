return Def.ActorFrame{
	LoadActor("bgnormal")..{
		InitCommand=cmd(Center);
		Condition=not IsUsingWideScreen();
	};
	LoadActor("bgwide")..{
		InitCommand=cmd(Center);
		Condition=IsUsingWideScreen();
	};
}