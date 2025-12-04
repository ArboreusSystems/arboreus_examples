%%%-------------------------------------------------------------------
%%% @author Alexandr Kirilov, https://alexandr.kirilov.me
%%% @copyright (C) 2025, Arboreus, https://arboreus.systems
%%% @doc
%%%
%%% @end
%%% Created : 03. Dec 2025 08:34
%%%-------------------------------------------------------------------
-module(a_timer_sup).
-author("Alexandr Kirilov, https://alexandr.kirilov.me").
-behaviour(supervisor).

%% System includes

%% Application includes
-include("a_timer_v1.hrl").

%% API
-export([

	test/0,

	init/1,
	start_link/0

]).

%% Definitions
-define(SERVER,?MODULE).


%% ----------------------------
%% @doc Module test function
-spec test() -> ok.

test() -> ok.


%% ----------------------------
%% @doc
-spec start_link() -> {'ok',PID} | 'ignore' | {'error',REASON}
	when
		PID :: pid(),
		REASON :: term().

start_link() ->

	case supervisor:start_link({local,?SERVER},?MODULE,[]) of
		{ok,TIMER_SUPERVISOR} ->
			{_ID,TIMER_HANDLER_PID,_TYPE,_MODULES} = a_otp_supervisor:first_child(TIMER_SUPERVISOR),
			application:set_env(
				?AD_APPLICATION_NAME_ATOM,
				?AD_APPLICATION_ID_TIMER_HANDLER_PID,
				TIMER_HANDLER_PID
			),
			{ok,TIMER_SUPERVISOR};
		ERROR_RESULT ->
			ERROR_RESULT
	end.


%% ----------------------------
%% @doc
-spec init(ARGUMENTS) -> {ok,STATE} | {error,REASON}
	when
		ARGUMENTS :: list(),
		STATE :: term(),
		REASON :: term().

init([]) ->

	HANDLER = #{
		id => ?AD_APPLICATION_ID_TIMER_HANDLER_PID,
		start => {'a_timer_handler_gs','start_link',[
			#as_timer_handler{
				time = 3000
			}
		]},
		restart => transient,
		shutdown => 5000,
		type => worker,
		modules => ['a_timer_handler_gs']
	},

	CHILD_SPECIFICATIONS = [HANDLER],
	case supervisor:check_childspecs(CHILD_SPECIFICATIONS) of
		ok ->
			SUPERVISOR_FLAGS = #{
				strategy => one_for_one,
				intensity => 1000,
				period => 3600
			},
			{ok,{SUPERVISOR_FLAGS,CHILD_SPECIFICATIONS}};
		{error,_REASON} ->
			ignore
	end.
