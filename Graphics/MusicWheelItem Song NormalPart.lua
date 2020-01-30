local t = Def.ActorFrame{
	--BG
	-- LoadActor("songbg")..{};
	LoadActor("longver")..{
		InitCommand=cmd(x,-30;y,-16);
		SetCommand=function(self,param)
			if param.Song then
				local isLongOrMarathon = param.Song:IsLong() or param.Song:IsMarathon();
				self:visible(isLongOrMarathon)
			else
				self:visible(false)
			end;
		end;
	};
	--Title
	LoadFont("TextBanner text")..{
		InitCommand=cmd(x,-115;y,-6;halign,0;skewx,-.05;maxwidth,214);
		SetCommand=function(self,param)
			if param.Song then
				local dir = param.Song:GetSongDir();
				self:settext(param.Song:GetDisplayMainTitle());
				self:diffuse(color(GetSongColor(param.Song:GetDisplayFullTitle())));
			else
				self:settext("");
			end;
		end;
	};
	--Artist
	LoadFont("TextBanner text")..{
		InitCommand=cmd(x,-115;y,11;zoom,.5;halign,0;skewx,-.05;maxwidth,428);
		SetCommand=function(self,param)
			if param.Song then
				local dir = param.Song:GetSongDir();
				self:settext(param.Song:GetDisplayArtist());
				self:diffuse(color(GetSongColor(param.Song:GetDisplayFullTitle())));
			else
				self:settext("");
			end;
		end;
	};
	--SubTitle
	LoadFont("TextBanner text")..{
		InitCommand=cmd(x,-115;y,4;zoom,.3;halign,0;skewx,-.05;maxwidth,642);
		SetCommand=function(self,param)
			if param.Song then
				local dir = param.Song:GetSongDir();
				self:settext(param.Song:GetDisplaySubTitle());
				self:diffuse(color(GetSongColor(param.Song:GetDisplayFullTitle())));
			else
				self:settext("");
			end;
		end;
	};
	--Spin edit
	SetMessageCommand=function(self,params)
		if params.Song then
			local curStyle = GAMESTATE:GetCurrentStyle()
			local curStepType = curStyle:GetStepsType()
			local icon = self:GetParent():GetChild("WheelNotifyIcon")
			if params.Song:HasStepsTypeAndDifficulty(curStepType,'Difficulty_Edit') then
				icon:spin();
				icon:effectmagnitude(0,255,0);
			else
				icon:stopeffect();
				icon:rotationy(0);
			end;
		end;
	end;
};

return t;