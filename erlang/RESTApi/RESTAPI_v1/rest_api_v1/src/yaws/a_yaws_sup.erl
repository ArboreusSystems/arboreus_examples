%%%-------------------------------------------------------------------
%%% @author Alexandr Kirilov, https://alexandr.kirilov.me
%%% @copyright (C) 2024, Arboreus, https://arboreus.systems
%%% @doc
%%%
%%% @end
%%% Created : 19. Sep 2024 20:53
%%%-------------------------------------------------------------------
-module(a_yaws_sup).
-author("Alexandr Kirilov, https://alexandr.kirilov.me").
-behaviour(supervisor).

%% System includes

%% Application includes
-include("a_rest_api_v1.hrl").

%% API
-export([

	test/0,

	start_link/0,
	init/1

]).


%% ----------------------------
%% @doc Module test function
-spec test() -> ok.

test() -> ok.


%% ----------------------------
%% @doc
-spec start_link() -> {'ok', PID} | 'ignore' | {'error', REASON}
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

	YAWS_SERVER = #{
		id => ?A_YAWS_ID,
		start => {'a_yaws',start,[]},
		restart => permanent,
		shutdown => 10000,
		type => worker,
		modules => ['a_yaws']
	},

	CHILD_SPECIFICATION = [YAWS_SERVER],
	case supervisor:check_childspecs(CHILD_SPECIFICATION) of
		ok ->
			RESTART_STRATEGY = #{
				strategy => one_for_one,
				intensity => 1,
				period => 10
			},
			{ok, {RESTART_STRATEGY,CHILD_SPECIFICATION}};
		{error,REASON} ->
			{error,REASON}
	end.