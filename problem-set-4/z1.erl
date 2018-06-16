-module(z1).
-export([pyth/1]).
pyth([]) -> [];
pyth(N) ->
	if 
	N rem 2 ==0 ->
		[ {A,B,C} ||
			A <- lists:seq(1,N div 3),
			B <- [(N * (N div 2 - A)) div (N - A)],
			C <- [N - A - B],
			A < B,
			A*A+B*B == C*C
		];
	true ->
		[]
	end.