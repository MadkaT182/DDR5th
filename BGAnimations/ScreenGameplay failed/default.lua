-- ScreenGameplay failed

local travelDist = SCREEN_WIDTH*1.9;
local LeftToRight = Def.ActorFrame{
	LoadActor("_LeftToRight");
	Def.Quad{
		InitCommand=cmd(addx,-64;diffuse,color("#000000FF");halign,1;zoomto,travelDist,32);
	};
};

local RightToLeft = Def.ActorFrame{
	LoadActor("_RightToLeft");
	Def.Quad{
		InitCommand=cmd(addx,64;diffuse,color("#000000FF");halign,0;zoomto,travelDist,32);
	};
};

local t = Def.ActorFrame{
	-- noise!
	LoadActor("failed")..{ StartTransitioningCommand=cmd(play); };

	Def.Quad{
		Name="Blocker";
		InitCommand=cmd(Center;FullScreen;diffuse,color("0,0,0,0"));
		OnCommand=cmd(sleep,0.6;linear,0.6;diffusealpha,1);
	};

	-- LeftToRight x6
	-- Left side starts with two stars in the middle (Y); 6 stars total
	LeftToRight..{
		InitCommand=cmd(x,SCREEN_LEFT-640;y,SCREEN_CENTER_Y-160);
		OnCommand=cmd(linear,1.2;addx,travelDist);
	};
	LeftToRight..{
		InitCommand=cmd(x,SCREEN_LEFT-480;y,SCREEN_CENTER_Y-96);
		OnCommand=cmd(linear,1.2;addx,travelDist);
	};
	LeftToRight..{
		InitCommand=cmd(x,SCREEN_LEFT-320;y,SCREEN_CENTER_Y-32);
		OnCommand=cmd(linear,1.2;addx,travelDist);
	};
	LeftToRight..{
		InitCommand=cmd(x,SCREEN_LEFT-320;y,SCREEN_CENTER_Y+32);
		OnCommand=cmd(linear,1.2;addx,travelDist);
	};
	LeftToRight..{
		InitCommand=cmd(x,SCREEN_LEFT-400;y,SCREEN_CENTER_Y+96);
		OnCommand=cmd(linear,1.2;addx,travelDist);
	};
	LeftToRight..{
		InitCommand=cmd(x,SCREEN_LEFT-480;y,SCREEN_CENTER_Y+160);
		OnCommand=cmd(linear,1.2;addx,travelDist);
	};

	-- RightToLeft x6
	-- Right side starts with one star in the middle (Y); 6 stars total
	RightToLeft..{
		InitCommand=cmd(x,SCREEN_RIGHT+560;y,SCREEN_CENTER_Y-192);
		OnCommand=cmd(linear,1.2;addx,-travelDist);
	};
	RightToLeft..{
		InitCommand=cmd(x,SCREEN_RIGHT+480;y,SCREEN_CENTER_Y-128);
		OnCommand=cmd(linear,1.2;addx,-travelDist);
	};
	RightToLeft..{
		InitCommand=cmd(x,SCREEN_RIGHT+400;y,SCREEN_CENTER_Y-64);
		OnCommand=cmd(linear,1.2;addx,-travelDist);
	};
	RightToLeft..{
		InitCommand=cmd(x,SCREEN_RIGHT+320;y,SCREEN_CENTER_Y);
		OnCommand=cmd(linear,1.2;addx,-travelDist);
	};
	RightToLeft..{
		InitCommand=cmd(x,SCREEN_RIGHT+400;y,SCREEN_CENTER_Y+64);
		OnCommand=cmd(linear,1.2;addx,-travelDist);
	};
	RightToLeft..{
		InitCommand=cmd(x,SCREEN_RIGHT+480;y,SCREEN_CENTER_Y+128);
		OnCommand=cmd(linear,1.2;addx,-travelDist);
	};

	-- todo: add the two "failed" ghosts
	LoadActor("_failed")..{
		Name="Main";
		InitCommand=cmd(Center;diffusealpha,0;zoom,4);
		OnCommand=cmd(sleep,0.5;bounceend,0.6;diffusealpha,1;zoom,1;sleep,2;linear,0.5;diffusealpha,0);
	};
	-- failed ghost 1
	LoadActor("_failed")..{
		Name="Ghost1";
		InitCommand=cmd(Center;diffusealpha,0;zoom,4);
		OnCommand=cmd(sleep,0.6;bounceend,0.6;diffusealpha,0.25;zoom,1;sleep,0.01;diffusealpha,0);
	};
	-- failed ghost 2
	LoadActor("_failed")..{
		Name="Ghost2";
		InitCommand=cmd(Center;diffusealpha,0;zoom,4);
		OnCommand=cmd(sleep,0.7;bounceend,0.6;diffusealpha,0.25;zoom,1;sleep,0.01;diffusealpha,0);
	};
};

return t;