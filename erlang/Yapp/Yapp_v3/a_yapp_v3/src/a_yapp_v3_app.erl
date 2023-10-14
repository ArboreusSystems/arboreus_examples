%%%-------------------------------------------------------------------
%% @doc a_yapp_v3 public API
%% @end
%%%-------------------------------------------------------------------

-module(a_yapp_v3_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    a_yapp_v3_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
