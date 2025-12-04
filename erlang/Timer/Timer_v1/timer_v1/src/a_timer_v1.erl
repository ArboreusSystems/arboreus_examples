%%%-------------------------------------------------------------------
%%% @author alexandr
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 31. Jan 2024 08:12
%%%-------------------------------------------------------------------
-module(a_timer_v1).
-author("Alexandr Kirilov, https://alexandr.kirilov.me").
-behaviour(application).

%% System includes

%% Application includes
-include("a_timer_v1.hrl").

%% API
-export([

    test/0,

    start/2,stop/1,
    set_supervisor/1,get_supervisor/0

]).


%% ----------------------------
%% @doc Module test function
-spec test() -> ok.

test() -> ok.


%% ----------------------------
%% @doc Start demo application process
-spec start(START_TYPE,ARGUMENTS) -> {ok,PID} | ignore | {error,REASON}
    when
        START_TYPE :: term(),
        ARGUMENTS :: list(),
        PID :: pid(),
        REASON :: term().

start(_START_TYPE,_ARGUMENTS) ->

    case a_timer_v1_sup:start_link() of
        {ok,SUPERVISOR_PID} ->
            ok = set_supervisor(SUPERVISOR_PID),
            {ok,SUPERVISOR_PID};
        REPLY ->
            REPLY
    end.


%% ----------------------------
%% @doc Stop demo application
-spec stop(STATE) -> ok
    when STATE :: term().

stop(_STATE) ->

    ok.


%% ----------------------------
%% @doc Set supervisor PID variable into application environment
-spec set_supervisor(SUPERVISOR_PID) -> ok
    when SUPERVISOR_PID :: pid().

set_supervisor(SUPERVISOR_PID) ->

    application:set_env(
        ?AD_APPLICATION_NAME_ATOM,
        ?AD_APPLICATION_ID_SUPERVISOR_PID,
        SUPERVISOR_PID
    ).


%% ----------------------------
%% @doc Return application supervisor pid
-spec get_supervisor() -> undefined | {ok,PID}
    when PID :: pid().

get_supervisor() ->

    application:get_env(
        ?AD_APPLICATION_NAME_ATOM,
        ?AD_APPLICATION_ID_SUPERVISOR_PID
    ).
