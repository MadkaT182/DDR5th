function LoadSteps(self,player)
	local difficultyStates = {
		Difficulty_Beginner	 = 0,
		Difficulty_Easy		 = 1,
		Difficulty_Medium	 = 2,
		Difficulty_Hard		 = 3,
		Difficulty_Challenge = 4,
		Difficulty_Edit		 = 5,
	};
	local selection;
	if GAMESTATE:IsCourseMode() then
		selection = GAMESTATE:GetCurrentTrail(player);
		local entry = selection:GetTrailEntry(GAMESTATE:GetLoadingCourseSongIndex()+1);
		selection = entry:GetSteps();
	else
		selection = GAMESTATE:GetCurrentSteps(player);
	end
	local diff = selection:GetDifficulty();
	local state = difficultyStates[diff] or 5;
	return state;
end;

local t = Def.ActorFrame{};

for player in ivalues(GAMESTATE:GetHumanPlayers()) do
t[#t+1] = Def.ActorFrame{
	LoadActor(THEME:GetPathG("","gameplay_diff"))..{
	InitCommand=function(self)
		self:x(player == PLAYER_1 and SCREEN_CENTER_X-224 or SCREEN_CENTER_X+224);
		self:pause();
		self:setstate(LoadSteps(self,player));
	end;
	};
};
end

return t;