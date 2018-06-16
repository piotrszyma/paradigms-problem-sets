fun {Reverse L1}
   {FoldL L1 fun {$ X Y} Y|X end nil}
end

fun {Append L1 L2}
   {FoldR L1 fun {$ X Y} X|Y end L2}
end