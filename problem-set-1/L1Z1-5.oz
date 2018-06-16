declare X
%V - value, U - used, L - remaining list, S - solutions
fun {GenerateAllListsWithValueHelp V U L S}
   local So in
      So = {Append U V|L}|S 
      if L == nil then So
      else
	 local H T in
	    H|T = L
	    {GenerateAllListsWithValueHelp V {Append U H|nil} T So}
	 end
      end
   end
end

%L - list V - value to add on every possible place
fun {GenerateAllListsWithValue L V}
   {GenerateAllListsWithValueHelp V nil L nil}
end

fun {GenerateAllPermutations L V}
   if V == nil then L
   else
      case L of H|T then
	 {Append {GenerateAllListsWithValue H V} {GenerateAllPermutations T V}}
      else
	 nil
      end
   end
end

fun {Permutations L}
   {FoldL L fun {$ X Y} {GenerateAllPermutations X Y} end [nil]}
end

{Browse {Permutations [1 2 4 3 5]}}