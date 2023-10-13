%%%-------------------------------------------------------------------
%%% @author alexandr
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 13. Oct 2023 10:33
%%%-------------------------------------------------------------------
-module(a_yapp_v1_app).
-behaviour(application).

%% Includes
-include("../../../yaws_conf.hrl").

%% API
-export([
	start/2,
	stop/1
]).


%% ----------------------------
%% @doc
-spec start(StartType,StartArgs) -> {ok, Pid} | ignore | {error, Reason}
	when
		StartType :: term(),
		StartArgs :: list(),
		Pid :: pid(),
		Reason :: term().

start(_StartType, _StartArgs) ->

	io:format("a_yapp_v1_app addint Yaws ebin path~n"),
	code:add_path(?A_DIR_EBIN_YAWS),

	io:format("a_yapp_v1_app starting~n"),
    a_yapp_v1_sup:start_link().


%% ----------------------------
%% @doc
-spec stop(State) -> ok | {error, Reason}
	when
		State :: term(),
		Reason :: term().

stop(_State) ->

	io:format("a_yapp_v1_app stopping~n"),
    ok.
