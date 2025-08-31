%%%-------------------------------------------------------------------
%%% @author Alexandr Kirilov, https://alexandr.kirilov.me
%%% @copyright (C) 2024, Arboreus, https://arboreus.systems
%%% @doc
%%%
%%% @end
%%% Created : 19. Sep 2024 20:37
%%%-------------------------------------------------------------------
-module(a_rest_api_v1_sup).
-author("Alexandr Kirilov, https://alexandr.kirilov.me").
-behaviour(supervisor).

%% System includes

%% Application includes
-include("a_rest_api_v1.hrl").

%% API
-export([

    test/0,

    init/1,
    start_link/0

]).

%% Definitions
-define(SERVER, ?MODULE).


%% ----------------------------
%% @doc Module test function
-spec test() -> ok.

test() -> ok.


%% ----------------------------
%% @doc
-spec start_link() -> {'ok', PID} | 'ignore' | {'error', REASON}
    when
        PID :: pid(),
        REASON :: term().

start_link() ->

    supervisor:start_link({local, ?SERVER}, ?MODULE, []).


%% ----------------------------
%% @doc
-spec init(ARGUMENTS) -> {ok, STATE} | {error, REASON}
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
    {ok, {SUPERVISOR_FLAGS, CHILD_SPECIFICATIONS}}.