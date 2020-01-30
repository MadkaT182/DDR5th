local DifficultyToState = {
	Difficulty_Beginner = 0,
	Difficulty_Easy = 1,
	Difficulty_Medium = 2,
	Difficulty_Hard = 3,
	Difficulty_Challenge = 4,
	Difficulty_Edit = 5,
}

return Def.StepsDisplayList{
	Name="StepsDisplayList";
	BeginCommand=cmd(setfromgamestate);
	CurrentSongChangedMessageCommand=cmd(setfromgamestate);
	CursorP1 = Def.ActorFrame {
		InitCommand=cmd(x,-100;player,PLAYER_1;bounce;effectmagnitude,-18,0,0;effectperiod,0.5);
		LoadActor("_cursor p1")..{
			InitCommand=cmd(animate,false;);
			OnCommand=cmd(glowshift;effectcolor1,color("1,1,1,0");effectcolor2,color("1,1,1,0.5");effectperiod,1);
			SetGraphicCommand=function(self)
				local steps = GAMESTATE:GetCurrentSteps(PLAYER_1)
				if steps then
					local curdiff = steps:GetDifficulty();
					if not curdiff then
						self:diffuse(color("#888888"))
						self:stopeffect()
						return;
					else
						self:diffuse(color("#FFFFFF"))
						local state = DifficultyToState[curdiff] or DifficultyToState["Edit"];
						self:visible(true);
						self:setstate(state);
					end;
				else
					self:diffuse(color("#888888"))
					self:stopeffect()
					return;
				end;
			end;

			CurrentSongChangedMessageCommand=cmd(playcommand,"SetGraphic");
			CurrentStepsP1ChangedMessageCommand=cmd(playcommand,"SetGraphic");
		};
	};
	CursorP2 = Def.ActorFrame {
		InitCommand=cmd(x,100;player,PLAYER_2;bounce;effectmagnitude,18,0,0;effectperiod,0.5);
		LoadActor("_cursor p2")..{
			InitCommand=cmd(animate,false;);
			OnCommand=cmd(glowshift;effectcolor1,color("1,1,1,0");effectcolor2,color("1,1,1,0.5");effectperiod,1);
			SetGraphicCommand=function(self)
				local steps = GAMESTATE:GetCurrentSteps(PLAYER_2)
				if steps then
					local curdiff = steps:GetDifficulty();
					if not curdiff then
						self:diffuse(color("#888888"))
						self:stopeffect();
						return;
					else
						self:diffuse(color("#FFFFFF"))
						local state = DifficultyToState[curdiff] or DifficultyToState["Edit"];
						self:visible(true);
						self:setstate(state);
					end;
				else
					self:diffuse(color("#888888"))
					self:stopeffect();
					return;
				end
			end;

			CurrentSongChangedMessageCommand=cmd(playcommand,"SetGraphic");
			CurrentStepsP2ChangedMessageCommand=cmd(playcommand,"SetGraphic");
		};
	};
	CursorP1Frame = Def.Actor{
		ChangeCommand=cmd(stoptweening;decelerate,0.125);
	};
	CursorP2Frame = Def.Actor{
		ChangeCommand=cmd(stoptweening;decelerate,0.125);
	};
};