%%%-------------------------------------------------------------------
%%% @author alexandr
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 31. Jan 2024 08:12
%%%-------------------------------------------------------------------
-module(a_timer_v1_sup).
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
%% @doc Start supervisor
-spec start_link() -> {'ok',PID} | 'ignore' | {'error',REASON}
    when
        PID :: pid(),
        REASON :: term().

start_link() ->

    supervisor:start_link({local,?SERVER},?MODULE,[]).


%% ----------------------------
%% @doc
-spec init(ARGUMENTS) -> {ok,STATE} | {error,REASON}
    when
        ARGUMENTS :: list(),
        STATE :: term(),
        REASON :: term().

init([]) ->

    CHILD_SPECIFICATIONS = [],
    MAX_RESTART = 1000,
    MAX_TIME_BETWEEN_RESTARTS = 3600,
    SUPERVISOR_FLAGS = #{
        strategy => one_for_one,
        intensity => MAX_RESTART,
        period => MAX_TIME_BETWEEN_RESTARTS
    },
    {ok,{SUPERVISOR_FLAGS,CHILD_SPECIFICATIONS}}.
