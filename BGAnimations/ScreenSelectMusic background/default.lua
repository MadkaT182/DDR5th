return Def.ActorFrame{
	LoadActor("_song bg")..{
		InitCommand=cmd(Center);
	};
	Def.Quad{
		Name="LeftMask";
		InitCommand=cmd(x,WideScale(SCREEN_CENTER_X+315,SCREEN_CENTER_X+422);y,SCREEN_BOTTOM-71;zoomto,SCREEN_WIDTH,24;MaskSource);
	};
	LoadActor("difficulty tab")..{
		InitCommand=cmd(x,WideScale(SCREEN_CENTER_X+212,SCREEN_CENTER_X+207);y,SCREEN_BOTTOM-71;MaskDest);
		OnCommand=cmd(texcoordvelocity,.05,0);
	};
	LoadActor("circles")..{
		InitCommand=cmd(x,SCREEN_CENTER_X+140;y,SCREEN_CENTER_Y-12);
	};
	LoadActor("dots")..{
		InitCommand=cmd(x,SCREEN_CENTER_X-301;y,SCREEN_CENTER_Y-95);
	};
};