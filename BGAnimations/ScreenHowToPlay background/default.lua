local t = Def.ActorFrame{
	LoadActor("bgtile")..{
		InitCommand=cmd(Center;FullScreen;);
		OnCommand=function(self)
			local w = DISPLAY:GetDisplayWidth() / self:GetWidth();
			local h = DISPLAY:GetDisplayHeight() / self:GetHeight();
			self:customtexturerect(0,0,w*0.5,h*0.5);
			self:texcoordvelocity(.6,.6);
		end;
	};
};

return t;