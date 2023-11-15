%%%-------------------------------------------------------------------
%%% @author alexandr
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 13. Oct 2023 10:33
%%%-------------------------------------------------------------------
-module(a_yaws_auth_v1_sup).
-behaviour(supervisor).

%% Includes

%% API
-export([
	init/1,
	start_link/0
]).

%% Definitions
-define(SERVER, ?MODULE).


%% ----------------------------
%% @doc
-spec start_link() -> {'ok',PID} | 'ignore' | {'error',REASON}
	when
		PID :: pid(),
		REASON :: term().

start_link() ->

	io:format("a_yaws_auth_v1_sup starting link"),
	supervisor:start_link({local, ?SERVER}, ?MODULE, []).


%% ----------------------------
%% @doc
-spec init(ARGUMENTS) -> {ok,STATE} | {error,REASON}
	when
		ARGUMENTS :: list(),
		STATE :: term(),
		REASON :: term().

init([]) ->

	io:format("a_yaws_auth_v1_sup initiating~n"),
	SUPERVISOR_FLAGS = #{
		strategy => one_for_all,
		intensity => 0,
		period => 1
	},
	CHILD_SPECIFICATION = [],
	{ok, {SUPERVISOR_FLAGS,CHILD_SPECIFICATION}}.
