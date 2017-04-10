% sorting

local A B C SMerge Xs Ys Zs in
   proc {SMerge Xs Ys Zs}
      case Xs#Ys
      of nil#Ys then Zs=Ys
      [] Xs#nil then Zs=Xs
      [] (X|Xr) # (Y|Yr) then
	 if X<Y then
	    Zs = X|{SMerge Xr Ys}
	 else
	    Zs = Y|{SMerge Xs Yr}
	 end
      end
   end
   A = [1 2 3]
   B = [1 3 123]
   {SMerge A B C}
   {Browse C}
end

% list
local L1 L2 L3 Head Tail in
   L1 = Head | Tail
   Head = 1
   Tail = 2|nil

   L2 = [1 2]
   {Browse L1==L2}

   L3 = '|'(1:1 2:'|'(2 nil))
   {Browse L1==L3}
end

