local grades = {
	Grade_Tier01 = 0;
	Grade_Tier02 = 1;
	Grade_Tier03 = 2;
	Grade_Tier04 = 3;
	Grade_Tier05 = 4;
	Grade_Tier06 = 5;
	Grade_Tier07 = 6;
	Grade_Failed = 7;
	Grade_None = 8;
};

local t = LoadActor("grades") .. {
	InitCommand=cmd(pause);
	SetGradeCommand=function(self, params)
		local state = grades[params.Grade] or grades['Grade_None'];
		if state then
			self:visible( true );
			self:diffuse(color(params.PlayerNumber == PLAYER_1 and "#2DE9D3" or "#ED712E"));
			self:setstate(state);
		else
			self:visible( false );
		end;
	end;
};

return t;