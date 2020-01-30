return Def.ActorFrame{
	LoadActor("label")..{
		InitCommand=cmd(x,124;y,-4);
		SetCommand=function(self)
			local song = GAMESTATE:GetCurrentSong()
			if song then
				local td = song:GetTimingData()
				local dispBpms = song:GetDisplayBpms()
				if dispBpms[1] == dispBpms[2] then
					(THEME:GetMetric("BPMDisplay","SetNormalCommand"))(self)
				else
					(THEME:GetMetric("BPMDisplay","SetChangeCommand"))(self)
				end
			else
				(THEME:GetMetric("BPMDisplay","SetNoBpmCommand"))(self)
			end;
		end;
		CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
	};
	Def.BPMDisplay {
		File=THEME:GetPathF("BPMDisplay", "bpm");
		Name="BPMDisplay";
		InitCommand=cmd(x,110;y,-6;halign,1);
		SetCommand=function(self) self:SetFromGameState() end;
		CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
		CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
	};
	Def.Sprite{
		Texture=THEME:GetPathG("ScreenSelectMusic","BPMDisplay/tran");
		Frames=Sprite.LinearFrames(16, 1);
		InitCommand=cmd(x,150;y,-9);
		SetCommand=function(self)
			local song = GAMESTATE:GetCurrentSong()
			if song then
				local td = song:GetTimingData()
				local dispBpms = song:GetDisplayBpms()
				if dispBpms[1] == dispBpms[2] then
					(THEME:GetMetric("BPMDisplay","SetNormalCommand"))(self)
					self:Load(THEME:GetPathG("ScreenSelectMusic","BPMDisplay/tran"))
				else
					(THEME:GetMetric("BPMDisplay","SetChangeCommand"))(self)
					self:Load(THEME:GetPathG("ScreenSelectMusic","BPMDisplay/redtran"))
				end
				local bpmLimited = clamp(math.abs(dispBpms[2]),1,9999)
				local bps = (1/bpmLimited)*7.5;
				self:SetAllStateDelays(bps);
			else
				(THEME:GetMetric("BPMDisplay","SetNoBpmCommand"))(self)
				self:Load(THEME:GetPathG("ScreenSelectMusic","BPMDisplay/tran"))
			end;
		end;
		CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
	};
};