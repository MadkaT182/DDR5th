return Def.ActorFrame {
	LoadActor("Loading")..{
		OnCommand=cmd(diffusealpha,0;sleep,.5;linear,.5;diffusealpha,1);
	};
};