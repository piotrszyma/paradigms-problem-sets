-module(l4z11).
-export([pythag/1]).
pythag(D) ->
	if
	D rem 2 == 0 ->
		[{A,B,C} ||
			A <- lists:seq(1, (D div 3) - 1),
			B <- [(D*((D div 2) - A)) div (D - A)],
			C <- [D-A-B],
			A < B,
			A*A + B*B == C*C];
	true -> 
		[]
	end.
