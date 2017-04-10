%Procedures

local Max X Y Z in
   proc {Max X Y Z}
      if X>= Y then Z = X else Z = Y end
   end
   X = 5
   Y = 10
   {Max X Y Z}
   {Browse Z}
end

%anonymous procedures
local
   Max = proc {$ X Y Z}
	    if X >= Y then Z = X
	    else Z = Y end
	 end
   X = 5
   Y = 10
   Z
in {Max X Y Z} {Browse Z}
end

