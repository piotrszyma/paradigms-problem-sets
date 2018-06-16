declare
fun lazy {Times N H}
   case H of X|H2 then N * X | {Times N H2} end
end
fun lazy {Merge Xs Ys}
   case Xs#Ys of (X|Xr)#(Y|Yr) then
      if X<Y then X|{Merge Xr Ys}
      elseif X>Y then Y|{Merge Xs Yr}
      else X|{Merge Xr Yr}
      end
   end
end
fun lazy {Generate P H}
   case P.2 of Ph|Pt then
      if Pt == nil then
	 {Merge {Times P.1 H} {Times Ph H}}
      else {Merge {Times P.1 H} {Generate P.2 H}}
      end
   end
end
fun lazy {NumGenerate N Limit}
   if N<Limit then
      N|{NumGenerate N+1 Limit}
   else nil end
end
fun lazy {Sieve Xs M}
   case Xs
   of nil then nil
   [] X|Xr then Ys in
      if X=<M then
	 thread Ys={Filter Xr fun {$ Y} Y mod X \= 0 end} end
      else Ys=Xr end
      X|{Sieve Ys M}
   end
end
proc {Touch N H}
   if N>0 then {Touch N-1 H.2} else skip end
end
fun {GetPrimesList2 N L}
   if N > 0 then
      L.1|{GetPrimesList2 N-1 L.2}
   else
      nil
   end
end
fun {GetPrimesList N}
   PRIMES = {Sieve {NumGenerate 2 100000} 316}
   {Touch N PRIMES}
   {GetPrimesList2 N PRIMES}
end
L P
proc {Hamming N K}
   P = {GetPrimesList K}
   L = 1|{Generate P L}
   {Touch N L}
   {Browse L}
end


{Hamming 20 3}