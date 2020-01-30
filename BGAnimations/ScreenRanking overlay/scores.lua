-- scores.lua: handles the actual score display
local defaultName = THEME:GetMetric("ScreenRanking","NoScoreName")
local defaultScore = THEME:GetMetric("ScreenRanking","NoScoreScore")

-- holds high score lists
local scoresSingle = {}
local scoresDouble = {}

local nameColors = {
	single = { Main=color("#007BFF"), Stroke=color("#001839") },
	double = { Main=color("#FFFF00"), Stroke=color("#424A00") },
}

local function MakeScore(rank,type)
	return Def.ActorFrame{
		LoadFont("_2070polyester round 24px")..{
			Name="ScoreName";
			InitCommand=cmd();
			BeginCommand=function(self)
				--self:settext(defaultName)
				self:diffuse(nameColors[type].Main)
				self:strokecolor(nameColors[type].Stroke)
			end;
			RankingPageSwitchMessageCommand=function(self,param)
				local scores
				if type == "single" then
					scores = scoresSingle[param.Type]:GetHighScores()
				elseif type == "double" then
					scores = scoresDouble[param.Type]:GetHighScores()
				end

				if scores[rank] then
					self:settext(scores[rank]:GetName())
				else
					self:settext(defaultName)
				end
			end;
		};
		LoadFont("_ranking score")..{
			Name="ScoreNumber";
			InitCommand=cmd(x,144;y,3;);
			BeginCommand=function(self)
				--self:settextf("%09d",defaultScore)
			end;
			RankingPageSwitchMessageCommand=function(self,param)
				local scores
				if type == "single" then
					scores = scoresSingle[param.Type]:GetHighScores()
				elseif type == "double" then
					scores = scoresDouble[param.Type]:GetHighScores()
				end

				if scores[rank] then
					self:settextf("%09d",scores[rank]:GetScore())
				else
					self:settextf("%09d",defaultScore)
				end
			end;
		};
	};
end

return Def.ActorFrame{
	Def.Actor{
		Name="ScoreController";
		BeginCommand=function(self)
			local machineProfile = PROFILEMAN:GetMachineProfile()
			scoresSingle["A"] = machineProfile:GetCategoryHighScoreList('StepsType_Dance_Single','RankingCategory_a')
			scoresSingle["B"] = machineProfile:GetCategoryHighScoreList('StepsType_Dance_Single','RankingCategory_b')
			scoresSingle["C"] = machineProfile:GetCategoryHighScoreList('StepsType_Dance_Single','RankingCategory_c')
			scoresDouble["A"] = machineProfile:GetCategoryHighScoreList('StepsType_Dance_Double','RankingCategory_a')
			scoresDouble["B"] = machineProfile:GetCategoryHighScoreList('StepsType_Dance_Double','RankingCategory_b')
			scoresDouble["C"] = machineProfile:GetCategoryHighScoreList('StepsType_Dance_Double','RankingCategory_c')
		end;
	};

	Def.Quad{
		Name="MaskRight";
		InitCommand=cmd(x,SCREEN_CENTER_X+320;CenterY;zoomto,SCREEN_CENTER_X,SCREEN_HEIGHT;halign,0;MaskSource);
	};

	-- row 1
	MakeScore(1,"single")..{
		Name="ScoreSingle1";
		InitCommand=cmd(x,SCREEN_CENTER_X-205;y,SCREEN_CENTER_Y-53;MaskDest);
		--RankingPageSwitchMessageCommand=cmd(x,SCREEN_WIDTH;linear,0.5;x,SCREEN_CENTER_X-205);
		--RankingPageOffMessageCommand=cmd(linear,0.5;x,SCREEN_WIDTH);
	};
	MakeScore(1,"double")..{
		Name="ScoreDouble1";
		InitCommand=cmd(x,SCREEN_CENTER_X+76;y,SCREEN_CENTER_Y-53;MaskDest);
	};

	-- row 2
	MakeScore(2,"single")..{
		Name="ScoreSingle2";
		InitCommand=cmd(x,SCREEN_CENTER_X-205;y,SCREEN_CENTER_Y-5;MaskDest);
		--RankingPageSwitchMessageCommand=cmd(sleep,0.2;x,SCREEN_WIDTH;linear,0.5;x,SCREEN_CENTER_X-205);
		--RankingPageOffMessageCommand=cmd(sleep,0.2;linear,0.5;x,SCREEN_WIDTH);
	};
	MakeScore(2,"double")..{
		Name="ScoreDouble2";
		InitCommand=cmd(x,SCREEN_CENTER_X+76;y,SCREEN_CENTER_Y-5;MaskDest);
	};

	-- row 3
	MakeScore(3,"single")..{
		Name="ScoreSingle3";
		InitCommand=cmd(x,SCREEN_CENTER_X-205;y,SCREEN_CENTER_Y+43;MaskDest);
		--RankingPageSwitchMessageCommand=cmd(sleep,0.4;x,SCREEN_WIDTH;linear,0.5;x,SCREEN_CENTER_X-205);
		--RankingPageOffMessageCommand=cmd(sleep,0.4;linear,0.5;x,SCREEN_WIDTH);
	};
	MakeScore(3,"double")..{
		Name="ScoreDouble3";
		InitCommand=cmd(x,SCREEN_CENTER_X+76;y,SCREEN_CENTER_Y+43;MaskDest);
	};

	-- row 4
	MakeScore(4,"single")..{
		Name="ScoreSingle4";
		InitCommand=cmd(x,SCREEN_CENTER_X-205;y,SCREEN_CENTER_Y+91;MaskDest);
		--RankingPageSwitchMessageCommand=cmd(sleep,0.6;x,SCREEN_WIDTH;linear,0.5;x,SCREEN_CENTER_X-205);
		--RankingPageOffMessageCommand=cmd(sleep,0.6;linear,0.5;x,SCREEN_WIDTH);
	};
	MakeScore(4,"double")..{
		Name="ScoreDouble4";
		InitCommand=cmd(x,SCREEN_CENTER_X+76;y,SCREEN_CENTER_Y+91;MaskDest);
	};

	-- row 5
	MakeScore(5,"single")..{
		Name="ScoreSingle5";
		InitCommand=cmd(x,SCREEN_CENTER_X-205;y,SCREEN_CENTER_Y+139;MaskDest);
		--RankingPageSwitchMessageCommand=cmd(sleep,0.8;x,SCREEN_WIDTH;linear,0.5;x,SCREEN_CENTER_X-205);
		--RankingPageOffMessageCommand=cmd(sleep,0.8;linear,0.5;x,SCREEN_WIDTH);
	};
	MakeScore(5,"double")..{
		Name="ScoreDouble5";
		InitCommand=cmd(x,SCREEN_CENTER_X+76;y,SCREEN_CENTER_Y+139;MaskDest);
	};
};