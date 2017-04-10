% page 233 (not only)
declare
fun {FoldR L F U}
   case L
   of nil then U
   [] X|L1 then {F X {FoldR L1 F U}}
   end
end

fun {FoldL L F U}
   case L
   of nil then U
   [] X|L1 then {FoldL L1 F {F U X}}
   end
end

% SOLUTION FOR REVERSE:
fun {Reverse L1}
   {FoldL L1 fun {$ X Y} Y|X end nil}
end

% SOLUTION FOR APPEND:
fun {Append L1 L2}
   {FoldR L1 fun {$ X Y} X|Y end L2}
end