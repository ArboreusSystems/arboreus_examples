%%%-------------------------------------------------------------------
%%% @author Alexandr Kirilov, https://alexandr.kirilov.me
%%% @copyright (C) 2025, Arboreus, https://arboreus.systems
%%% @doc
%%%
%%% @end
%%% Created : 07. Feb 2025 10:01
%%%-------------------------------------------------------------------
-module(a_erlexec_handler_02_gs).
-author("Alexandr Kirilov, https://alexandr.kirilov.me").
-behaviour(gen_server).

%% Definitions
-define(SERVER, ?MODULE).

%% State
-record(a_erlexec_handler_02_gs_state, {}).

%% System includes

%% Application includes

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

test() ->

	{ok,EXEC_PID} = exec:start(),
	erlang:display({started,EXEC_PID}),

	timer:sleep(2000),

	{ok,HANDLER_PID} = start_link(#a_erlexec_handler_02_gs_state{}),
	erlang:display({handler,HANDLER_PID}),

	erlang:display({calling_start,gen_server:call(HANDLER_PID,start_process)}),

	timer:sleep(2000),

	erlang:display(finished).


%%%===================================================================
%%% API
%%%===================================================================
%% ----------------------------
%% @doc Spawns the server and registers the local name (unique)
-spec start_link(STATE) -> {ok, PID} | ignore | {error, REASON}
	when
		STATE :: #a_erlexec_handler_02_gs_state{},
		PID :: pid(),
		REASON :: term().

start_link(STATE) ->

	gen_server:start_link(?MODULE, [STATE], []).


%%%===================================================================
%%% gen_server callbacks
%%%===================================================================
%% ----------------------------
%% @private
%% @doc Initializes the server
-spec init(ARGUMENTS) ->
	{ok, STATE} | {ok, STATE, TIMEOUT} | {stop, REASON} | {error, REASON} | ignore
	when
		ARGUMENTS :: term(),
		STATE :: #a_erlexec_handler_02_gs_state{},
		TIMEOUT :: timeout() | hibernate,
		REASON :: term().

init([STATE]) ->

	process_flag(trap_exit,true),
	{ok, STATE}.


%% ----------------------------
%% @private
%% @doc Handling call messages
-spec handle_call(REQUEST, FROM, STATE) ->
	{reply, REPLY, NEW_STATE} | {reply, REPLY, NEW_STATE, TIMEOUT} |
	{noreply, NEW_STATE} | {noreply, NEW_STATE, TIMEOUT} |
	{stop, REASON, REPLY, NEW_STATE} | {stop, REASON, NEW_STATE}
	when
		REQUEST :: term(),
		FROM :: {PID, TAG}, PID :: pid(), TAG :: term(),
		REPLY :: term(),
		STATE :: #a_erlexec_handler_02_gs_state{},
		NEW_STATE :: #a_erlexec_handler_02_gs_state{},
		TIMEOUT :: timeout() | hibernate,
		REASON :: term().

handle_call(start_process,_FROM,STATE) ->

	erlang:display({handle_call,start_process}),
	{reply,exec:run(
		"echo ok",[
			{stderr,self()},
			{stdout,self()},
			monitor
		]
	), STATE};

handle_call(REQUEST, _FROM, STATE) ->

	erlang:display({handle_call,REQUEST}),
	{reply, ok, STATE}.


%% ----------------------------
%% @private
%% @doc Handling cast messages
-spec handle_cast(REQUEST, STATE) ->
	{noreply, NEW_STATE} | {noreply, NEW_STATE, TIMEOUT} | {stop, REASON, NEW_STATE}
	when
		REQUEST :: term(),
		STATE :: #a_erlexec_handler_02_gs_state{},
		NEW_STATE :: #a_erlexec_handler_02_gs_state{},
		TIMEOUT :: timeout() | hibernate,
		REASON :: term().

handle_cast(REQUEST, STATE) ->

	erlang:display({handle_cast,REQUEST}),
	{noreply, STATE}.


%% ----------------------------
%% @private
%% @doc Handling all non call/cast messages
-spec handle_info(INFO, STATE) ->
	{noreply, NEW_STATE} | {noreply, NEW_STATE, TIMEOUT} | {stop, REASON, NEW_STATE}
	when
		INFO :: timeout() | term(),
		STATE :: #a_erlexec_handler_02_gs_state{},
		NEW_STATE :: #a_erlexec_handler_02_gs_state{},
		TIMEOUT :: timeout() | hibernate,
		REASON :: term().

handle_info({'EXIT', _FROM, REASON}, STATE) ->

	{stop, REASON, STATE};

handle_info(INFO, STATE) ->

	erlang:display({handle_info,INFO}),
	{noreply, STATE}.


%% ----------------------------
%% @private
%% @doc This function is called by a gen_server when it is about to
%% terminate. It should be the opposite of Module:init/1 and do any
%% necessary cleaning up. When it returns, the gen_server terminates
%% with Reason. The return value is ignored.
-spec terminate(REASON, STATE) -> term()
	when
		REASON :: normal | shutdown | {shutdown, term()} | term(),
		STATE :: #a_erlexec_handler_02_gs_state{}.

terminate(_REASON, _STATE) -> ok.


%% ----------------------------
%% @private
%% @doc Convert process state when code is changed
-spec code_change(OLD_VERSION, STATE, EXTRA) -> {ok, NEW_STATE} | {error, REASON}
	when
		OLD_VERSION :: term() | {down, term()},
		STATE :: #a_erlexec_handler_02_gs_state{},
		NEW_STATE :: #a_erlexec_handler_02_gs_state{},
		EXTRA :: term(),
		REASON :: term().

code_change(_OLD_VERSION, STATE, _EXTRA) -> {ok, STATE}.


%%%===================================================================
%%% Internal functions
%%%===================================================================

