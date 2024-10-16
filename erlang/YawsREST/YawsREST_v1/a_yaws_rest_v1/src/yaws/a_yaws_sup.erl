%%%-------------------------------------------------------------------
%%% @author Alexandr Kirilov, https://alexandr.kirilov.me
%%% @copyright (C) 2024, Arboreus, https://arboreus.systems
%%% @doc
%%%
%%% @end
%%% Created : 15. Oct 2024 20:11
%%%-------------------------------------------------------------------
-module(a_yaws_sup).
-author("Alexandr Kirilov, https://alexandr.kirilov.me").
-behaviour(supervisor).

%% System includes

%% Application includes
-include("a_rest.hrl").

%% API
-export([
	start_link/0,
	init/1
]).


%% ----------------------------
%% @doc
-spec start_link() -> {'ok',PID} | 'ignore' | {'error',REASON}
	when
	PID :: pid(),
	REASON :: term().

start_link() ->

	supervisor:start_link({local,?MODULE},?MODULE,[]).


%% ----------------------------
%% @doc
-spec init(ARGUMENTS) -> {ok,STATE} | {error,REASON}
	when
	ARGUMENTS :: list(),
	STATE :: term(),
	REASON :: term().

init([]) ->

	io:format("a_yaws_sup initiating~n"),

	YAWS_SERVER = #{
		id => 'a_yaws',
		start => {'a_yaws',start,[]},
		restart => permanent,
		shutdown => 10000,
		type => worker,
		modules => ['a_yaws']
	},

	CHILD_SPECIFICATIONS = [YAWS_SERVER],
	case supervisor:check_childspecs(CHILD_SPECIFICATIONS) of
		ok ->
			RESTART_STRATEGY = #{
				strategy => one_for_one,
				intensity => 1,
				period => 10
			},
			io:format("a_yaws_sup initiated~n"),
			{ok, {RESTART_STRATEGY,CHILD_SPECIFICATIONS}};
		{error,REASON} ->
			io:format("a_yaws_sup ERROR: Wrong childspecifications~n"),
			{error,REASON}
	end.