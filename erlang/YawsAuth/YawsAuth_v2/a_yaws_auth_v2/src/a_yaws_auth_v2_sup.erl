%%%-------------------------------------------------------------------
%%% @author alexandr
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 13. Oct 2023 10:33
%%%-------------------------------------------------------------------
-module(a_yaws_auth_v2_sup).
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

	io:format("a_yaws_auth_v2_sup starting link"),
	supervisor:start_link({local, ?SERVER}, ?MODULE, []).


%% ----------------------------
%% @doc
-spec init(ARGUMENTS) -> {ok,STATE} | {error,REASON}
	when
		ARGUMENTS :: list(),
		STATE :: term(),
		REASON :: term().

init([]) ->

	io:format("a_yaws_auth_v2_sup initiating~n"),

	YAWS_SUPERVISOR = #{
		id => a_yaws_sup,
		start => {a_yaws_sup, start_link, []},
		restart => permanent,
		shutdown => 5000,
		type => supervisor,
		modules => [a_yaws_sup]
	},

	CHILD_SPECIFICATION = [YAWS_SUPERVISOR],
	case supervisor:check_childspecs(CHILD_SPECIFICATION) of
		ok ->
			RESTART_STRATEGY = #{
				strategy => one_for_all,
				intensity => 1,
				period => 5
			},
			io:format("a_yaws_auth_v2_sup initiated~n"),
			{ok, {RESTART_STRATEGY,CHILD_SPECIFICATION}};
		{error,REASON} ->
			io:format("a_yaws_auth_v2_sup ERROR: Wrong childspecifications~n"),
			{error,REASON}
	end.
