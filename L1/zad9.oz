declare
H = 5
T = [6 7 8]
%{Browse T.2}
%T.1 gives head of list
%T.2 gives back of list
L=[5 6 7 8]
%case L of H|T then {Browse L.1} {Browse L.2} end

declare Pascal AddList ShiftLeft ShiftRight
fun {Pascal N}
   if N==1 then [1]
   else
      {AddList {ShiftLeft {Pascal N-1}}
       {ShiftRight {Pascal N-1}}}
   end
end

fun {ShiftLeft L}
   case L of H|T then
      H|{ShiftLeft T}
   else [0] end
end

fun {ShiftRight L} 0|L end

fun {AddList L1 L2}
   case L1 of H1|T1 then
      case L2 of H2|T2 then
	 H1+H2|{AddList T1 T2}
      end
   else nil end
end

{Browse {Pascal 20}}

fun {Reverse L}
   case L of H|T then
      case T of nil then
	 H
      else
	 {Reverse T}|H
      end
   else nil end
end
