declare
fun {TwoMerge L1 L2}
   case L1#L2
   of nil#L2 then L2
   [] L1#nil then L1
   [] (H1|T1)#(H2|T2) then
      if H1 =< H2 then
	 H1|{TwoMerge T1 L2}
      else 
	 H2|{TwoMerge L1 T2}
      end
   end
end

fun {Merge L1 L2 L3}
   {TwoMerge L1 {TwoMerge L2 L3}}
end

{Browse {Merge [1 2] [3 4] [1 8]}}
