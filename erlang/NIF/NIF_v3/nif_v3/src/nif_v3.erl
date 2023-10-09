%%%-------------------------------------------------------------------
%%% @author alexandr
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 09. Oct 2023 12:22
%%%-------------------------------------------------------------------
-module(nif_v3).
-author("alexandr").

-behaviour(gen_server).

%% API
-export([
	start_link/0
]).

%% gen_server callbacks
-export([
	test/0,
	init/1,
	handle_call/3,
	handle_cast/2,
	handle_info/2,
	terminate/2,
	code_change/3
]).

%% Definitions
-define(APPNAME,?MODULE).
-define(LIBNAME,?MODULE).
-define(SERVER,?MODULE).


%% Records
-record(nif_v3_state,{}).


%%%===================================================================
%%% API
%%%===================================================================


%% -----------------------------
%% @doc

test() -> not_loaded(?LINE).


%% -----------------------------
%% @doc Spawns the server and registers the local name (unique)
-spec start_link() -> {ok,Pid} | ignore | {error,Reason}
	when
		Pid :: pid(),
		Reason :: term().

start_link() ->

	gen_server:start_link({local,?SERVER},?MODULE,[],[]).

%%%===================================================================
%%% gen_server callbacks
%%%===================================================================

%% -----------------------------
%% @private
%% @doc Initializes the server
-spec init(Args) -> {ok,State} | {ok,State,Timeout} | {stop,Reason} | ignore
	when
		Args :: term(),
		State :: #nif_v3_state{},
		Timeout :: timeout() | hibernate,
		Reason :: term().

init([]) ->

	erlang:load_nif("/path/to/NIF_v3/nif_v3/c_src/nif_v3.so/file",0),
	{ok,#nif_v3_state{}}.


%% -----------------------------
%% @private
%% @doc Handling call messages
-spec handle_call(Request,From,State) ->
	{reply,Reply,NewState} | {reply,Reply,NewState,Timeout} | {noreply,NewState} |
	{noreply,NewState,Timeout} | {stop,Reason,Reply,NewState} | {stop,Reason,NewState}
	when
		Request :: term(),
		Reply :: term(),
		From :: {pid(),Tag},
		Tag :: term(),
		State :: #nif_v3_state{},
		NewState :: #nif_v3_state{},
		Reason :: term(),
		Timeout :: timeout() | hibernate.

handle_call(_Request,_From,State = #nif_v3_state{}) ->

	{reply,ok,State}.


%% -----------------------------
%% @private
%% @doc Handling cast messages
-spec handle_cast(Request,State) ->
	{noreply,NewState} | {noreply,NewState,Timeout} | {stop,Reason,NewState}
	when
		Request :: term(),
		State :: #nif_v3_state{},
		NewState :: #nif_v3_state{},
		Timeout :: timeout() | hibernate,
		Reason :: term().

handle_cast(_Request,State = #nif_v3_state{}) ->

	{noreply,State}.


%% -----------------------------
%% @private
%% @doc Handling all non call/cast messages
-spec handle_info(Info,State) -> {noreply,NewState} | {noreply,NewState,Timeout} |
	{stop,Reason,NewState :: #nif_v3_state{}}
	when
		Info :: timeout() |  term(),
		State :: #nif_v3_state{},
		NewState :: #nif_v3_state{},
		Reason :: term(),
		Timeout :: timeout() | hibernate.

handle_info(_Info,State = #nif_v3_state{}) ->
	{noreply,State}.


%% -----------------------------
%% @private
%% @doc This function is called by a gen_server when it is about to
%% terminate. It should be the opposite of Module:init/1 and do any
%% necessary cleaning up. When it returns, the gen_server terminates
%% with Reason. The return value is ignored.
-spec terminate(Reason,State) -> term()
	when
		Reason :: normal | shutdown | {shutdown,term()} | term(),
		State :: #nif_v3_state{}.

terminate(_Reason,_State = #nif_v3_state{}) ->

	ok.


%% -----------------------------
%% @private
%% @doc Convert process state when code is changed
-spec code_change(OldVsn,State,Extra) -> {ok,NewState} | {error,Reason}
	when
		OldVsn :: term() | {down,term()},
		State :: #nif_v3_state{},
		Extra :: term(),
		NewState :: #nif_v3_state{},
		Reason :: term().

code_change(_OldVsn,State = #nif_v3_state{},_Extra) ->

	{ok,State}.

%%%===================================================================
%%% Internal functions
%%%===================================================================


%%-----------------------------------
%% @doc
not_loaded(Line) ->

	erlang:nif_error({not_loaded, [{module, ?MODULE}, {line, Line}]}).