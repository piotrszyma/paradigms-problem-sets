declare
fun {Append2 L1 L2}
   case L1 of nil then L2
   [] H1|T1 then H1|{Append2 T1 L2}
   end
end

{Browse {Append2 [1 2] [3 4]}}

fun {Reverse L1}
   {FoldL L1 fun {$ X Y} Y|X end nil}
end

{Browse {Append [5 6 7 8 9]}}