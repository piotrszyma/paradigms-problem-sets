% sorting

local A B C SMerge Xs Ys Zs Xr Yr Zr X Y Z in
   proc {SMerge Xs Ys Zs}
   case Xs#Ys
   of nil#Ys then Zs=Ys
   [] Xs#nil then Zs=Xs
   [] (X|Xr) # (Y|Yr) then
      if X=<Y then Zr in
	 Zs = X|Zr
	 {SMerge Xr Ys Zr}
      else Zr in
	 Zs = Y|Zr
	 {SMerge Xs Yr Zr}
      end
   end
   A = 1|2|3|nil
   B = 4|8|10|nil
   {SMerge A B C}
   {Browse C}
end
