declare NewPortObject Rozmowca R1 R2 in
fun {NewPortObject Proc} Sin in
   thread for Msg in Sin do {Proc Msg} end end
   {NewPort Sin}
end

fun {Rozmowca F R}
   {NewPortObject
    proc {$ Msg}
       {Browse Msg}
	   {Delay 1000}
       {Send R {F Msg}}
    end}
end

R1={Rozmowca fun {$ X} X+1 end R2}
R2={Rozmowca fun {$ X} X-1 end R1}

{Send R1 0}