local gc = Var("GameCommand");

local item = Def.ActorFrame{
	Def.ActorFrame{
		InitCommand=cmd(y,4);
		LoadActor("title cursor")..{
			Name="Main";
			GainFocusCommand=cmd(stoptweening;linear,0.125;diffusealpha,0.5;);
			LoseFocusCommand=cmd(stoptweening;linear,0.125;diffusealpha,0;);
		};
		LoadActor("title cursor")..{
			Name="Secondary";
			InitCommand=cmd(blend,Blend.Add;diffusealpha,0.25);
			GainFocusCommand=cmd(stoptweening;linear,0.125;diffusealpha,0.25;);
			LoseFocusCommand=cmd(stoptweening;linear,0.125;diffusealpha,0;);
		};
	};
	LoadFont("_2070polyester square 24px") .. {
		InitCommand=cmd(uppercase,true;settext,gc:GetText();strokecolor,color("0,0,0,0.9"););
		GainFocusCommand=cmd(stoptweening;linear,0.125;zoom,0.675;zoomy,1.5;diffuse,color("#00FF00FF"));
		LoseFocusCommand=cmd(stoptweening;linear,0.125;zoom,0.625;diffuse,color("#7D7D7DFF"));
	};

	Def.Actor{
		OffFocusedCommand=function(self)
			local idx = gc:GetIndex()+1
			setenv("TitleChoice",idx)
		end;
	};
};

-- only bother showing this on Information or Gallery
local name = gc:GetText()
if name == "Gallery Mode" or name == "Information" then
	item[#item+1] = LoadActor(THEME:GetPathG("_titlemenu","new"))..{
		InitCommand=cmd(x,-112;y,-13);
		BeginCommand=function(self)
			--self:visible(math.random(0,1)<0.10)
			self:visible(false)
		end;
		GainFocusCommand=cmd(pulse;diffuse,color("1,1,1,1");effectperiod,0.5;effectmagnitude,1.25,0.8,-1);
		LoseFocusCommand=cmd(stopeffect;diffuse,color("0.5,0.5,0.5,1"));
	};
end

return item