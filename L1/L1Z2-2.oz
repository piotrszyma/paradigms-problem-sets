declare
fun {Filter Accumulator Input Output}
   case Input
   of nil
   then
      Output = nil Accumulator
   [] H|T then
      Smaller Greater NewOut
   in
      Smaller#Greater = if Accumulator > H then H#Accumulator else Accumulator#H end
      Output = Greater|NewOut
      {Filter Smaller T NewOut}
   end
end
proc {NSort Input Output}
   case Input
   of nil
   then Output=nil
   [] H|T then
      NOut in
      Output = thread {Filter H T NOut} end|{NSort NOut}
   end
end
Out
local
   {NSort [6 4 5 2 8 1] Out}
   {Browse Out}
end