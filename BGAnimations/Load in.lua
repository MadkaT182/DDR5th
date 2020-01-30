return Def.ActorFrame {
	LoadActor("Loading")..{
		OnCommand=cmd(diffusealpha,1;linear,.3;diffusealpha,0);
	};
};