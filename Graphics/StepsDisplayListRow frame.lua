local CustomDifficultyToColor = {
	Beginner	= "#42CBFF",
	Easy		= "#E9E406",
	Medium		= "#F835AD",
	Hard		= "#03DC1B",
	Challenge	= "#6857EE",
	Edit		= "#E1E1E1",
};

local CustomDifficultyToState = {
	Beginner = 0,
	Easy = 1,
	Medium = 2,
	Hard = 3,
	Challenge = 4,
	Edit = 5
}

local DifficultyToState = {
	Difficulty_Beginner = 0,
	Difficulty_Easy = 1,
	Difficulty_Medium = 2,
	Difficulty_Hard = 3,
	Difficulty_Challenge = 4,
	Difficulty_Edit = 5,
}

local t = Def.ActorFrame{
	LoadFont("StepsDisplay ticks")..{
		InitCommand=cmd(x,-76;horizalign,left;settext,string.rep("1",9));
		SetCommand=function(self,param)
			self:diffuse(color(CustomDifficultyToColor[param.CustomDifficulty]));
		end;
	};
	LoadFont("StepsDisplay ticks")..{
		InitCommand=cmd(x,-76;horizalign,left);
		SetCommand=function(self,param)
			local meter = param.Meter;
			if meter then
				if meter > 9 then
					self:settext(string.rep("0",9));
				else
					self:settext(string.rep("0",meter));
				end
			end
			self:diffuse(color(CustomDifficultyToColor[param.CustomDifficulty]));
		end;
	};
	LoadFont("StepsDisplay ticks")..{
		InitCommand=cmd(x,-76;horizalign,left;diffuse,color("#FF0000"));
		SetCommand=function(self,param)
			local hmeter = param.Meter;
			if hmeter then
				if hmeter > 9 then
					local xmeter = 0;
					if hmeter > 18 then
						self:settext(string.rep("0",9));
						self:textglowmode('TextGlowMode_Inner');
						self:diffuseshift();
						self:effectcolor1(color(CustomDifficultyToColor[param.CustomDifficulty]));
						self:effectcolor2(1,1,1,1);
					else
						xmeter = hmeter - 9;
						self:settext(string.rep("0",xmeter));
					end
				else
					self:settext("");
				end
			end
		end;
	};
	LoadActor(THEME:GetPathG("ScreenSelectMusic", "StepsDisplayList/_cursor p1"))..{
		Name="FrameP1";
		InitCommand=cmd(x,-100;player,PLAYER_1;animate,false;diffusealpha,.5);
		SetCommand=function(self,param)
			local curdiff = param.CustomDifficulty;
			local state = CustomDifficultyToState[curdiff] or CustomDifficultyToState["Edit"];
			self:setstate(state);
		end;
		CurrentStepsP1ChangedMessageCommand=cmd(playcommand,"UpdateVisibility");
		UpdateVisibilityCommand=function(self)
			local steps = GAMESTATE:GetCurrentSteps(PLAYER_1)
			if steps then
				local p1Diff = steps:GetDifficulty();
				local matchState = DifficultyToState[p1Diff];
				self:visible(self:GetState() ~= matchState)
			else
				self:visible(false)
			end
		end;
	};
	LoadActor(THEME:GetPathG("ScreenSelectMusic", "StepsDisplayList/_cursor p2"))..{
		Name="FrameP2";
		InitCommand=cmd(x,100;player,PLAYER_2;animate,false;diffuse,color("0.5,0.5,0.5,1"););
		SetCommand=function(self,param)
			local curdiff = param.CustomDifficulty;
			local state = CustomDifficultyToState[curdiff] or CustomDifficultyToState["Edit"];
			self:setstate(state);
		end;
		CurrentStepsP2ChangedMessageCommand=cmd(playcommand,"UpdateVisibility");
		UpdateVisibilityCommand=function(self)
			local steps = GAMESTATE:GetCurrentSteps(PLAYER_2)
			if steps then
				local p2Diff = steps:GetDifficulty();
				local matchState = DifficultyToState[p2Diff];
				self:visible(self:GetState() ~= matchState)
			else
				self:visible(false)
			end
		end;
	};
};

return t;