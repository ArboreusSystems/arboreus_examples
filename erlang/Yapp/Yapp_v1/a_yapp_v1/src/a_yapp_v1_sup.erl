%%%-------------------------------------------------------------------
%%% @author alexandr
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 13. Oct 2023 10:33
%%%-------------------------------------------------------------------
-module(a_yapp_v1_sup).
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
-spec start_link() -> {'ok', Pid} | 'ignore' | {'error', Reason}
	when
		Pid :: pid(),
		Reason :: term().

start_link() ->

	io:format("a_yapp_v1_sup starting link"),
    supervisor:start_link({local, ?SERVER}, ?MODULE, []).


%% ----------------------------
%% @doc
-spec init(Arguments) -> {ok,State} | {error,Reason}
	when
		Arguments :: list(),
		State :: term(),
		Reason :: term().

init([]) ->

	io:format("a_yapp_v1_sup initiating~n"),

	YawsSupervisor = #{
		id => a_yaws_sup,
		start => {a_yaws_sup, start_link, []},
		restart => permanent,
		shutdown => 5000,
		type => supervisor,
		modules => [a_yaws_sup]
	},

	ChildSpecifications = [YawsSupervisor],
	case supervisor:check_childspecs(ChildSpecifications) of
		ok ->
			RestartStrategy = #{
				strategy => one_for_all,
				intensity => 1,
				period => 5
			},
			io:format("a_yapp_v1_sup initiated~n"),
			{ok, {RestartStrategy,ChildSpecifications}};
		{error, Reason} ->
			io:format("a_yapp_v1_sup ERROR: Wrong childspecifications~n"),
			{error,Reason}
	end.
