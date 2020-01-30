local t = LoadFallbackB();

t[#t+1] = Def.ActorFrame{
	LoadActor(THEME:GetPathG("ScreenSelectMusic","BPMDisplay"))..{
		OnCommand=cmd(x,SCREEN_CENTER_X-172;y,SCREEN_CENTER_Y-143);
		OffCommand=cmd(linear,0.3;zoomy,0);
	};
	LoadActor(THEME:GetPathG("ScreenSelectMusic","StageDisplay"))..{
		OnCommand=cmd(x,SCREEN_CENTER_X-253;y,SCREEN_CENTER_Y-151);
		OffCommand=cmd(linear,0.3;zoomy,0);
		Condition=not GAMESTATE:IsCourseMode();
	};
	LoadActor(THEME:GetPathG("ScreenSelectMusic","SortDisplay"))..{
		InitCommand=cmd(x,math.floor(SCREEN_CENTER_X-238);y,math.floor(SCREEN_CENTER_Y-171));
		OnCommand=cmd(addx,-(SCREEN_WIDTH*0.625);bounceend,0.5;addx,(SCREEN_WIDTH*0.625));
		OffCommand=cmd(bouncebegin,0.5;addx,-(SCREEN_WIDTH*0.625));
		Condition=not GAMESTATE:IsCourseMode();
	};
	LoadActor(THEME:GetPathG("ScreenSelectMusic","Balloon"))..{
		OnCommand=cmd(x,SCREEN_CENTER_X+206;y,SCREEN_CENTER_Y-62);
		OffCommand=cmd(linear,0.2;zoomy,0);
		ShowCommand=cmd(linear,0.2;zoomy,1;bob;effectmagnitude,0,-7,0);
		HideCommand=cmd(linear,0.2;zoomy,0);
	};
	LoadActor(THEME:GetPathG("ScreenSelectMusic","StepsDisplayList"))..{
		OnCommand=cmd(x,SCREEN_CENTER_X-161;y,SCREEN_CENTER_Y-23;draworder,74;diffusealpha,0;linear,0.5;diffusealpha,1);
		OffCommand=cmd(linear,0.5;diffusealpha,0);
		Condition=not GAMESTATE:IsCourseMode();
	};
	CurrentSongChangedMessageCommand=function(self)
		-- highlight hackery
		local song = GAMESTATE:GetCurrentSong()
		local highlightColor = color("#3A3A6B7F")
		if song then
			local isLongOrMarathon = song:IsLong() or song:IsMarathon();
			highlightColor = isLongOrMarathon and color("#FF00007F") or color("#3A3ABB7F")
		end;
		local highlight = SCREENMAN:GetTopScreen():GetChild("MusicWheel"):GetChild("Highlight")
		if highlight then
			highlight:diffuse(highlightColor)
		end
	end;
};

-- t[#t+1] = StandardDecorationFromFileOptional("Edits","Edits");

-- for pn in ivalues(GAMESTATE:GetHumanPlayers()) do
-- 	local optIcons = LoadActor( THEME:GetPathG( Var "LoadingScreen", "OptionIcons" ), pn );
-- 	t[#t+1] = StandardDecorationFromTable( "OptionIcons" .. ToEnumShortString(pn), optIcons );
-- end

return t;