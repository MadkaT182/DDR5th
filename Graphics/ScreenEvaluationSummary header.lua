return Def.ActorFrame {
	LoadActor("_header/base");
	LoadActor("_header/head_left")..{
		OnCommand=cmd(x,-SCREEN_WIDTH/2;horizalign,left);
	};
	LoadActor("_header/head_right")..{
		OnCommand=cmd(x,SCREEN_WIDTH/2;horizalign,right);
	};
	LoadActor("_header/title_result")..{
		OnCommand=cmd(x,-SCREEN_WIDTH/2+24;y,4;horizalign,left);
	};
};