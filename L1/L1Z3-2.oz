declare
fun {NewPortObject2 Proc}
   Sin in
   thread for Msg in Sin do {Proc Msg} end end
   {NewPort Sin}
end
fun {NewPortObject Init Fun}
   proc {MsgLoop S1 State}
      case S1 of Msg|S2 then
	 {MsgLoop S2 {Fun Msg State}}
      [] nil then skip end
   end
   Sin
in
   thread {MsgLoop Sin Init} end
   {NewPort Sin}
end
%Timer implementation
fun {Timer}
   {NewPortObject2
    proc {$ Msg}
       case Msg of starttimer(T Pid) then
	  thread {Delay T} {Send Pid stoptimer} end
       end
    end}
end

%Controller implementation
fun {Controller Init}
   Tid={Timer}
   Cid={NewPortObject Init
	fun {$ Msg state(Motor F Lid)}
	   case Motor
	   of running then
	      case Msg
	      of stoptimer then
		 {Send Lid 'at'(F)}
		 state(stopped F Lid)
	      end
	   [] stopped then
	      case Msg
	      of step(Dest) then
		 if F==dest then
		    state(stopped F Lid)
		 elseif F<Dest then
		    {Send Tid starttimer(5000 Cid)}
		    state(running F+1 Lid)
		 else %F>Dest
		    {Send Tid starttimer(5000 Cid)}
		    state(running F-1 Lid)
		 end
	      end
	   end
	end}
in Cid end

fun {ScheduleLast L N}
   if L\=nil andthen {List.last L}==N then L
   else {Append L [N]} end
end


fun {Floor Num Init Lifts}
   Tid={Timer}
   Fid={NewPortObject Init
	fun {$ Msg state(Called)}
	   case Called
	   of notcalled then Lran in
	      case Msg
	      of arrive(Ack) then
		 {Browse 'Lift at floor '#Num#': open doors'}
		 {Send Tid starttimer(5000 Fid)}
		 state(doorsopen(Ack))
	      [] call then
		 {Browse 'Floor '#Num#' calls a lift!'}
		 Lran=Lifts.(1+{OS.rand} mod {Width Lifts})
		 {Send Lran call(Num)}
		 state(called)
	      end
	   [] called then
	      case Msg
	      of arrive(Ack) then
		 {Browse 'Lift at floor'#Num#': open doors'}
		 {Send Tid starttimer(5000 Fid)}
		 state(doorsopen(Ack))
	      [] call then
		 state(called)
	      end
	   [] doorsopen(Ack) then
	      case Msg
	      of stoptimer then
		 {Browse 'Lift at floor'#Num#': close doors'}
		 Ack=unit
		 state(notcalled)
	      [] arrive(A) then
		 A=Ack
		 state(doorsopen(Ack))
	      [] call then
		 state(doorsopen(Ack))
	      end
	   end
	end}
in Fid end

fun {Lift Num Init Cid Floors}
   {NewPortObject Init
    fun {$ Msg state(Pos Sched Moving)}
       case Msg
       of call(N) then
	  {Browse 'Lift '#Num#'needed at floor '#N}
	  if N==Pos andthen {Not Moving} then
	     {Wait {Send Floors.Pos arrive($)}}
	     state(Pos Sched false)
	  else Sched2 in
	     Sched2={ScheduleLast Sched N}
	     if{Not Moving} then
		{Send Cid step(N)} end
	     state(Pos Sched2 true)
	  end
       [] 'at'(NewPos) then
	  {Browse 'Lift '#Num#' at floor '#NewPos}
	  case Sched
	  of S|Sched2 then
	     if NewPos==S then
		{Wait {Send Floors.S arrive($)}}
		if Sched2==nil then
		   state(NewPos nil false)
		else
		   {Send Cid step(Sched2.1)}
		   state(NewPos Sched2 true)
		end
	     else
		{Send Cid step(S)}
		state(NewPos Sched Moving)
	     end
	  end
       end
    end}
end
proc {Building FN LN ?Floors ?Lifts}
   Lifts={MakeTuple lifts LN}
   for I in 1..LN do Cid in
      Cid={Controller state(stopped 1 Lifts.I)}
      Lifts.I={Lift I state(1 nil false) Cid Floors}
   end
   Floors={MakeTuple floors FN}
   for I in 1..FN do
      Floors.I={Floor I state(notcalled) Lifts}
   end
end
F L in
{Building 20 2 F L}
{Send F.20 call}