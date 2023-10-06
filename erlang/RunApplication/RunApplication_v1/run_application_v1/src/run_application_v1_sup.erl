%%%-------------------------------------------------------------------
%% @doc run_application_v1 top level supervisor.
%% @end
%%%-------------------------------------------------------------------
-module(run_application_v1_sup).
-behaviour(supervisor).

-export([
	start_link/0,
	init/1
]).

-define(SERVER, ?MODULE).


start_link() ->
	
	io:format("run_application_v1_sup -> Starting supervisor~n"),
	supervisor:start_link({local, ?SERVER}, ?MODULE, []).


init([]) ->
	
	io:format("run_application_v1_sup -> Initiating supervisor~n"),
	SupFlags = #{
		strategy => one_for_all,
		intensity => 0,
		period => 1
	},
	ChildSpecs = [],
	{ok, {SupFlags, ChildSpecs}}.
