return Def.ActorFrame{
	LoadActor("framenormal")..{
		Condition=not IsUsingWideScreen();
	};
	LoadActor("framewide")..{
		Condition=IsUsingWideScreen();
	};
}