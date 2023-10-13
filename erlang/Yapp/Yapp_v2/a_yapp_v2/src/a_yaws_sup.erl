%%%-------------------------------------------------------------------
%%% @author alexandr
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 13. Oct 2023 10:33
%%%-------------------------------------------------------------------
-module(a_yaws_sup).
-behaviour(supervisor).

%% Includes

%% API
-export([
	start_link/0,
	init/1]
).


%% ----------------------------
%% @doc
-spec start_link() -> {'ok', Pid} | 'ignore' | {'error', Reason}
	when
	Pid :: pid(),
	Reason :: term().

start_link() ->

	supervisor:start_link({local,?MODULE},?MODULE,[]).


%% ----------------------------
%% @doc
-spec init(Arguments) -> {ok,State} | {error,Reason}
	when
	Arguments :: list(),
	State :: term(),
	Reason :: term().

init([]) ->

	io:format("a_yaws_sup initiating~n"),

	YawsServer = #{
		id => 'a_yaws',
		start => {'a_yaws',start,[]},
		restart => permanent,
		shutdown => 10000,
		type => worker,
		modules => ['a_yaws']
	},

	ChildSpecifications = [YawsServer],
	case supervisor:check_childspecs(ChildSpecifications) of
		ok ->
			RestartStrategy = #{
				strategy => one_for_one,
				intensity => 1,
				period => 10
			},
			io:format("a_yaws_sup initiated~n"),
			{ok, {RestartStrategy,ChildSpecifications}};
		{error, Reason} ->
			io:format("a_yaws_sup ERROR: Wrong childspecifications~n"),
			{error,Reason}
	end.