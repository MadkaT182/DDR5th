local aspect = "N";

if IsUsingWideScreen() then
aspect = "W";
end

local t = Def.ActorFrame {};
t[#t+1] = LoadActor("headbgclear"..aspect);
return t