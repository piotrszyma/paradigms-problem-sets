-module (test2).
-export ([loop/1]).

loop(N) ->
io:format('Hello Number:~w\n', [N]),
loop(N+1).