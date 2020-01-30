setenv("TitleChoice",1)

local Star = LoadActor("stars");
local starTravel = SCREEN_WIDTH*2.96875
local starStartX = SCREEN_WIDTH*2.03125

local card1Type = GAMESTATE:GetCoinMode() == 'CoinMode_Home' and "home" or "arcade"

local t = Def.ActorFrame{
	LoadActor("bg")..{
		InitCommand=cmd(Center;FullScreen);
	};

	-- stars layers
	Star..{
		InitCommand=cmd(x,starStartX;y,SCREEN_CENTER_Y-48);
		OnCommand=cmd(linear,2;addx,-starTravel;);
	};
	Star..{
		InitCommand=cmd(x,starStartX;y,SCREEN_CENTER_Y+20);
		OnCommand=cmd(sleep,1;linear,2;addx,-starTravel;);
	};
	Star..{
		InitCommand=cmd(x,starStartX;y,SCREEN_CENTER_Y+140);
		OnCommand=cmd(sleep,2;linear,2;addx,-starTravel;);
	};
	Star..{
		InitCommand=cmd(x,starStartX;y,SCREEN_CENTER_Y-60);
		OnCommand=cmd(sleep,5;linear,2;addx,-starTravel;);
	};
	Star..{
		InitCommand=cmd(x,starStartX;y,SCREEN_CENTER_Y);
		OnCommand=cmd(sleep,6;linear,2;addx,-starTravel;);
	};
	Star..{
		InitCommand=cmd(x,starStartX;y,SCREEN_CENTER_Y+120);
		OnCommand=cmd(sleep,7;linear,2;addx,-starTravel;);
	};
	Star..{
		InitCommand=cmd(x,starStartX;y,SCREEN_CENTER_Y-60);
		OnCommand=cmd(sleep,11;linear,2;addx,-starTravel;);
	};
	Star..{
		InitCommand=cmd(x,starStartX;y,SCREEN_CENTER_Y+10);
		OnCommand=cmd(sleep,12;linear,2;addx,-starTravel;);
	};
	Star..{
		InitCommand=cmd(x,starStartX;y,SCREEN_CENTER_Y+110);
		OnCommand=cmd(sleep,13;linear,2;addx,-starTravel;);
	};

	Def.ActorFrame{
		Name="CardFrame";
		InitCommand=cmd(Center);
		-- 182x58 to begin with (04.783, f287)
		-- 566x66 before going to vertzoom (04.967, f298)
		-- starts to vertzoom at 05.000, f300
		-- there is a skip at this part in the video :|
		-- 566x386 is the final size.
		LoadActor("_frame topleft")..{
			Name="TopLeft";
			InitCommand=cmd(x,-20;y,-18);
			OnCommand=cmd(linear,0.25;addx,-227;sleep,0.1;linear,0.3;addy,-163);
		};
		LoadActor("_frame middle x")..{
			Name="TopCenter";
			InitCommand=cmd(y,-2;cropbottom,0.5);
			OnCommand=cmd(linear,0.25;zoomx,116;sleep,0.1;linear,0.3;addy,-163);
		};
		LoadActor("_frame topright")..{
			Name="TopRight";
			InitCommand=cmd(x,20;y,-18);
			OnCommand=cmd(linear,0.25;addx,225;sleep,0.1;linear,0.3;addy,-163);
		};

		LoadActor("_frame middle y")..{
			Name="Left";
			InitCommand=cmd(x,-227;y,-3;cropright,0.5;diffusealpha,0;SetTextureFiltering,false);
			OnCommand=cmd(sleep,0.35;diffusealpha,1;linear,0.3;zoomy,160);
		};
		LoadActor("_frame middle y")..{
			Name="Right";
			InitCommand=cmd(x,225;y,-3;cropleft,0.5;diffusealpha,0;SetTextureFiltering,false);
			OnCommand=cmd(sleep,0.35;diffusealpha,1;linear,0.3;zoomy,160);
		};

		LoadActor("_frame botleft")..{
			Name="BotLeft";
			InitCommand=cmd(x,-20;y,18);
			OnCommand=cmd(linear,0.25;addx,-227;sleep,0.1;linear,0.3;addy,149);
		};
		LoadActor("_frame middle x")..{
			Name="BotCenter";
			InitCommand=cmd(y,2;croptop,0.5);
			OnCommand=cmd(linear,0.25;zoomx,116;sleep,0.1;linear,0.3;addy,149);
		};
		LoadActor("_frame botright")..{
			Name="BotRight";
			InitCommand=cmd(x,20;y,18);
			OnCommand=cmd(linear,0.25;addx,225;sleep,0.1;linear,0.3;addy,149);
		};
	};

	-- test my best, ok?
	LoadActor(THEME:GetPathS("_intro","testmybest"))..{
		OnCommand=cmd(sleep,9.5;queuecommand,"X");
		XCommand=cmd(play);
	};

	Def.ActorFrame{
		Name="Cards";
		InitCommand=cmd(x,SCREEN_CENTER_X-1;y,SCREEN_CENTER_Y-7);
		LoadActor("1 "..card1Type)..{
			InitCommand=cmd(croptop,0.5;cropbottom,0.5);
			OnCommand=cmd(sleep,0.35;linear,0.3;croptop,0;cropbottom,0;sleep,3.0);
		};
		LoadActor("2")..{
			InitCommand=cmd(diffusealpha,0;);
			OnCommand=cmd(sleep,3.0;linear,0.3;diffusealpha,1;sleep,3.0;linear,0.3);
		};
		LoadActor("logo")..{
			OnCommand=cmd(stop;sleep,3.3;queuecommand,"Sound");
			SoundCommand=cmd(play);
			OffCommand=cmd(stop);
			Condition=not IsHome()
		};
		LoadActor("3")..{
			InitCommand=cmd(diffusealpha,0;);
			OnCommand=cmd(sleep,6.0;linear,0.3;diffusealpha,1;sleep,3.0;linear,0.3);
		};
		LoadActor("4")..{
			InitCommand=cmd(diffusealpha,0;);
			OnCommand=cmd(sleep,9.0;linear,0.3;diffusealpha,1;sleep,3.0;linear,0.3);
		};
		LoadActor("5")..{
			InitCommand=cmd(diffusealpha,0;);
			OnCommand=cmd(sleep,12.0;linear,0.3;diffusealpha,1;sleep,3.0;linear,0.3);
		};
		LoadActor("6")..{
			InitCommand=cmd(diffusealpha,0;);
			OnCommand=cmd(sleep,15.0;linear,0.5;diffusealpha,1;);
		};
	};
	-- fade
	Def.Quad{
		InitCommand=cmd(Center;FullScreen;diffusealpha,0;blend,Blend.Add);
		OnCommand=cmd(sleep,15.5;linear,0.5;diffusealpha,1);
	};
};

return t;