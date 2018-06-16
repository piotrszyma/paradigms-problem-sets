declare
S1 S2 S3
proc {Game P1 P2}
   S2 = thread {Player P1 S1} end
   S3 = thread {Player P2 S2} end
   S1 = ping | T3
end
fun {Player Id L}
   case L of
      X|Y then
      {Delay 2000}
      {Browse Id#X}
      if X==ping then pong|{Player Id Y} else ping|{Player Id Y} end
   end
end

{Game 'p1' 'p2'}