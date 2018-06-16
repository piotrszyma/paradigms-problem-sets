-module(przedszkole).
-compile(export_all).

przedszkolanka(N) ->
	spawn(?MODULE, kindergarden, [N, []]).
	
polecenie(Pid, Msg) ->
	rpc(Pid, Msg).
	
rpc(Pid, Request) ->
	Pid ! Request,
		receive
			{Pid, Response} ->
				Response
		after 3000 ->
			error
		end.
		
kindergarden(N, ChildrenList) ->
	receive
		{Sender, pozostaw, Child} ->
			case length(ChildrenList) >= N of
				true ->
					Sender ! {self(), error},
					kindergarden(N, ChildrenList);
				false ->
					Sender ! {self(), {ok, Child}},
					kindergarden(N, [{Sender, Child}|ChildrenList])
			end;
		{Sender, odbierz, Child} ->
			case lists:member({Sender, Child}, ChildrenList) of
				true ->
					Sender ! {self(), {ok, Child}},
					kindergarden(N, lists:delete({Sender, Child}, ChildrenList));
				false ->
					Sender ! {self(), error},
					kindergarden(N, ChildrenList)
			end;
		terminate ->
			ok
	end.
