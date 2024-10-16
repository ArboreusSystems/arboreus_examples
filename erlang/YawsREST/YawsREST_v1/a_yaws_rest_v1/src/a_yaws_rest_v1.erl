%%%-------------------------------------------------------------------
%%% @author Alexandr Kirilov, https://alexandr.kirilov.me
%%% @copyright (C) 2024, Arboreus, https://arboreus.systems
%%% @doc
%%%
%%% @end
%%% Created : 23. Mar 2024 19:00
%%%-------------------------------------------------------------------
-module(a_yaws_rest_v1).
-author("Alexandr Kirilov, https://alexandr.kirilov.me").
-behaviour(application).

%% Application callbacks
-export([

	start/2,
	stop/1

]).

%% ----------------------------
%% @doc
-spec start(START_TYPE,ARGUMENTS) -> {ok, PID} | ignore | {error, REASON}
	when
		START_TYPE :: term(),
		ARGUMENTS :: list(),
		PID :: pid(),
		REASON :: term().

start(_START_TYPE, _ARGUMENTS) ->

    a_yaws_rest_v1_sup:start_link().

stop(_State) ->

    ok.

%% internal functions
