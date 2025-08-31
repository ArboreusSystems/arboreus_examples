%%%-------------------------------------------------------------------
%%% @author Alexandr Kirilov, https://alexandr.kirilov.me
%%% @copyright (C) 2024, Arboreus, https://arboreus.systems
%%% @doc
%%%
%%% @end
%%% Created : 19. Sep 2024 20:37
%%%-------------------------------------------------------------------
-module(a_rest_api_v1).
-author("Alexandr Kirilov, https://alexandr.kirilov.me").
-behaviour(application).

%% System includes

%% Application includes
-include("a_rest_api_v1.hrl").

%% API
-export([

    test/0,

    start/0,start/2,
    stop/0,stop/1,

    get_supervisor/0

]).


%% ----------------------------
%% @doc Module test function
-spec test() -> ok.

test() -> ok.


%% ----------------------------
%% @doc Starting application
-spec start() -> ok | {error, REASON}
    when REASON :: term().

start() ->

    case application:ensure_started(?MODULE) of
        ok ->
            io:write("Application started"),
            a_yaws:start(),
            %% Do something when application started
            ok;
        {error,REASON} ->
            io:write("Error when application starting"),
            %% Do something when error something goes wrong
            {error,REASON}
    end.


%% ----------------------------
%% @doc Starting application with arguments
-spec start(START_TYPE,ARGUMENTS) -> {ok, PID} | ignore | {error, REASON}
    when
        START_TYPE :: term(),
        ARGUMENTS :: list(),
        PID :: pid(),
        REASON :: term().

start(_START_TYPE, _ARGUMENTS) ->

    case an_player_sup:start_link() of
        {ok,SUPERVISOR_PID} ->
            ok = application:set_env(
                ?A_NAME_APPLICATION,
                ?A_VARIABLE_ROOT_SUPERVISOR,
                SUPERVISOR_PID
            ),
            {ok,SUPERVISOR_PID};
        REPLY ->
            REPLY
    end.


%% ----------------------------
%% @doc Stopping application and node
-spec stop() -> ok | {error, REASON}
    when REASON :: term().

stop() ->

    case application:stop(?MODULE) of
        ok -> init:stop();
        ERROR -> ERROR
    end.


%% ----------------------------
%% @doc
-spec stop(STATE) -> ok | {error, REASON}
    when
        STATE :: term(),
        REASON :: term().

stop(_STATE) ->

    ok.


%% ----------------------------
%% @doc Return application supervisor pid
-spec get_supervisor() -> undefined | {ok, PID}
    when PID :: pid().

get_supervisor() ->

    application:get_env(
        ?A_NAME_APPLICATION,
        ?A_VARIABLE_ROOT_SUPERVISOR
    ).