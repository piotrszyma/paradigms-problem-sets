local ForAll in
   proc {ForAll Xs P}
      case Xs of nil then skip
      [] X|Xr then
	 {ForAll Xr P}
	 {P X}
      else skip
      end
   end
   {ForAll [1 2 3] Browse}
end