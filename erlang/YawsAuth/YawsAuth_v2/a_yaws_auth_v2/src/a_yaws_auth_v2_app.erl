%%%-------------------------------------------------------------------
%%% @author alexandr
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 13. Oct 2023 10:33
%%%-------------------------------------------------------------------
-module(a_yaws_auth_v2_app).
-behaviour(application).

%% Includes

%% API
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

start(_START_TYPE,_ARGUMENTS) ->

	io:format("a_yaws_auth_v1_app starting~n"),
	a_yaws_auth_v2_sup:start_link().


%% ----------------------------
%% @doc
-spec stop(STATE) -> ok | {error,REASON}
	when
		STATE :: term(),
		REASON :: term().

stop(_State) ->

	io:format("a_yaws_auth_v1_app stopping~n"),
	ok.

