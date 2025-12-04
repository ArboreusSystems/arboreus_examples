%%%-------------------------------------------------------------------
%%% @author Alexandr Kirilov, https://alexandr.kirilov.me
%%% @copyright (C) 2025, Arboreus, https://arboreus.systems
%%% @doc
%%%
%%% @end
%%% Created : 03. Dec 2025 08:35
%%%-------------------------------------------------------------------
-module(a_timer_handler_gs).
-author("Alexandr Kirilov, https://alexandr.kirilov.me").
-behaviour(gen_server).

%% Definitions
-define(SERVER,?MODULE).

%% System includes

%% Application includes
-include("a_timer_v1.hrl").

%% API
-export([

	test/0,

	start_link/1,
	init/1,
	handle_call/3, handle_cast/2, handle_info/2,
	terminate/2,
	code_change/3

]).


%% ----------------------------
%% @doc Module test function
-spec test() -> ok.

test() -> ok.


%%%===================================================================
%%% API
%%%===================================================================
%% ----------------------------
%% @doc Spawns the server and registers the local name (unique)
-spec start_link(STATE) -> {ok,PID} | ignore | {error,REASON}
	when
		STATE :: #as_timer_handler{},
		PID :: pid(),
		REASON :: term().

start_link(STATE) ->

	gen_server:start_link(?MODULE,[STATE],[]).


%%%===================================================================
%%% gen_server callbacks
%%%===================================================================
%% ----------------------------
%% @private
%% @doc Initializes the server
-spec init(ARGUMENTS) ->
	{ok,STATE} | {ok,STATE,TIMEOUT} | {stop,REASON} | {error,REASON} | ignore
	when
		ARGUMENTS :: term(),
		STATE :: #as_timer_handler{},
		TIMEOUT :: timeout() | hibernate,
		REASON :: term().

init([STATE]) ->

	process_flag(trap_exit,true),
	{ok,STATE#as_timer_handler{}}.


%% ----------------------------
%% @private
%% @doc Handling call messages
-spec handle_call(REQUEST,FROM,STATE) ->
	{reply,REPLY,NEW_STATE} | {reply,REPLY,NEW_STATE,TIMEOUT} |
	{noreply,NEW_STATE} | {noreply,NEW_STATE,TIMEOUT} |
	{stop,REASON,REPLY,NEW_STATE} | {stop,REASON,NEW_STATE}
	when
		REQUEST :: term(),
		FROM :: {PID, TAG},
		PID :: pid(),
		TAG :: term(),
		REPLY :: term(),
		STATE :: #as_timer_handler{},
		NEW_STATE :: #as_timer_handler{},
		TIMEOUT :: timeout() | hibernate,
		REASON :: term().

handle_call(cancel_timer,_FROM,STATE) ->

	case STATE#as_timer_handler.timer of
		undefined ->
			{reply,undefined,STATE};
		{interval,TIMER_REFERENCE} ->
			case timer:cancel({interval,TIMER_REFERENCE}) of
				{ok,cancel} ->
					?AD_DEBUG_DISPLAY_TERM({timer,canceled}),
					{reply,ok,STATE#as_timer_handler{timer = undefined}};
				{error,REASON} ->
					?AD_DEBUG_DISPLAY_TERM({timer,{error,REASON}}),
					{reply,{error,REASON},STATE}
			end
	end;

handle_call({start_timer,TIME},_FROM,STATE) ->

	case STATE#as_timer_handler.timer of
		undefined ->
			{ok,TIMER} = timer:send_interval(TIME,interval),
			{reply,{ok,TIMER},STATE#as_timer_handler{
				timer = TIMER,
				time = TIME
			}};
		{interval,TIMER_REFERENCE} ->
			?AD_DEBUG_DISPLAY_TERM({timer,{already_started,TIMER_REFERENCE}}),
			{reply,{already_started,TIMER_REFERENCE},STATE}
	end;

handle_call(_REQUEST,_FROM,STATE) ->

	{reply,ok,STATE}.


%% ----------------------------
%% @private
%% @doc Handling cast messages
-spec handle_cast(REQUEST,STATE) ->
	{noreply,NEW_STATE} | {noreply,NEW_STATE,TIMEOUT} | {stop,REASON,NEW_STATE}
	when
		REQUEST :: term(),
		STATE :: #as_timer_handler{},
		NEW_STATE :: #as_timer_handler{},
		TIMEOUT :: timeout() | hibernate,
		REASON :: term().

handle_cast(_REQUEST,STATE) -> {noreply,STATE}.


%% ----------------------------
%% @private
%% @doc Handling all non call/cast messages
-spec handle_info(INFO,STATE) ->
	{noreply,NEW_STATE} | {noreply,NEW_STATE,TIMEOUT} | {stop,REASON,NEW_STATE}
	when
		INFO :: timeout() | term(),
		STATE :: #as_timer_handler{},
		NEW_STATE :: #as_timer_handler{},
		TIMEOUT :: timeout() | hibernate,
		REASON :: term().

handle_info(interval,STATE) ->

	?AD_DEBUG_DISPLAY_TERM({interval,a_time_now:microseconds()}),
	{noreply,STATE};

handle_info({'EXIT',_FROM,REASON},STATE) ->

	{stop,REASON,STATE};

handle_info(_INFO,STATE) ->

	{noreply,STATE}.


%% ----------------------------
%% @private
%% @doc This function is called by a gen_server when it is about to
%% terminate. It should be the opposite of Module:init/1 and do any
%% necessary cleaning up. When it returns, the gen_server terminates
%% with Reason. The return value is ignored.
-spec terminate(REASON, STATE) -> term()
	when
	REASON :: normal | shutdown | {shutdown, term()} | term(),
	STATE :: #as_timer_handler{}.

terminate(_REASON,_STATE) -> ok.


%% ----------------------------
%% @private
%% @doc Convert process state when code is changed
-spec code_change(OLD_VERSION,STATE,EXTRA) -> {ok,NEW_STATE} | {error,REASON}
	when
		OLD_VERSION :: term() | {down,term()},
		STATE :: #as_timer_handler{},
		NEW_STATE :: #as_timer_handler{},
		EXTRA :: term(),
		REASON :: term().

code_change(_OLD_VERSION,STATE,_EXTRA) -> {ok, STATE}.


%%%===================================================================
%%% Internal functions
%%%===================================================================

