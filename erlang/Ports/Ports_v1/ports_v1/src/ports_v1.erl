%%%-------------------------------------------------------------------
%%% @author alexandr
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 10. Oct 2023 09:51
%%%-------------------------------------------------------------------
-module(ports_v1).
-author("alexandr").

%% API
-export([
	run/1
]).

run(Command) ->

	Port = erlang:open_port(
		{spawn, Command},[
			stderr_to_stdout, in, exit_status,binary,stream
	]),
	loop(Port).

loop(Port) ->

	receive{Port, Data} ->
		io:format("Data ~p~n",[Data]),
		loop(Port)
	end.
