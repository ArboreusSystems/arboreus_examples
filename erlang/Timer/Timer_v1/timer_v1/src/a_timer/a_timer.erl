%%%-------------------------------------------------------------------
%%% @author Alexandr Kirilov, https://alexandr.kirilov.me
%%% @copyright (C) 2025, Arboreus, https://arboreus.systems
%%% @doc
%%%
%%% @end
%%% Created : 03. Dec 2025 08:34
%%%-------------------------------------------------------------------
-module(a_timer).
-author("Alexandr Kirilov, https://alexandr.kirilov.me").

%% System includes

%% Application includes
-include("a_timer_v1.hrl").

%% API
-export([

	test/0,

	start_process/0,
	start_timer/1,
	cancel_timer/0,

	set_timer_handler/1,get_timer_handler/0

]).


%% ----------------------------
%% @doc Module test function
-spec test() -> ok.

test() -> ok.


%% ----------------------------
%% @doc Start demo process
-spec start_process() -> {'ok',PID} | 'ignore' | {'error',REASON}
	when
		PID :: pid(),
		REASON :: term().

start_process() -> a_timer_sup:start_link().


%% ----------------------------
%% @doc Start timer in the process
-spec start_timer(TIME) ->
	{ok,PROCESS_REFERENCE} | {already_started,PROCESS_REFERENCE} | {error,REASON}
	when
		TIME :: a_time_unix_milliseconds(),
		PROCESS_REFERENCE :: reference(),
		REASON :: term().

start_timer(TIME) -> gen_server:call(get_timer_handler(),{start_timer,TIME}).


%% ----------------------------
%% @doc Cancel active process timer
-spec cancel_timer() -> ok | {error,REASON}
	when REASON :: term().

cancel_timer() -> gen_server:call(get_timer_handler(),cancel_timer).


%% ----------------------------
%% @doc Set timer handler variable
-spec set_timer_handler(SUPERVISOR_PID) -> ok
	when SUPERVISOR_PID :: pid().

set_timer_handler(SUPERVISOR_PID) ->

	{_ID,TIMER_HANDLER_PID,_TYPE,_MODULES} = a_otp_supervisor:first_child(SUPERVISOR_PID),
	application:set_env(
		?AD_APPLICATION_NAME_ATOM,
		?AD_APPLICATION_ID_TIMER_HANDLER_PID,
		TIMER_HANDLER_PID
	).


%% ----------------------------
%% @doc Get timer handler variable
-spec get_timer_handler() -> TIMER_HANDLER_PID
	when TIMER_HANDLER_PID :: pid().

get_timer_handler() ->

	{ok,TIMER_HANDLER_PID} = application:get_env(
		?AD_APPLICATION_NAME_ATOM,
		?AD_APPLICATION_ID_TIMER_HANDLER_PID
	),
	TIMER_HANDLER_PID.
