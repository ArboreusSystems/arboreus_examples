%%%-------------------------------------------------------------------
%%% @author alexandr
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 13. Oct 2023 10:18
%%%-------------------------------------------------------------------
-module(a_yaws).
-author("alexandr").

%% Includes
-include_lib("yaws/include/yaws.hrl").

%% API
-export([
	start/0,
	start_server/0
]).

%% Definitions
-define(DIR_LOG, "log").
-define(DIR_PUB, "src/pub").


%% ----------------------------
%% @doc

start() ->

	{ok, spawn(?MODULE, start_server, [])}.


%% ----------------------------
%% @doc

start_server() ->

	ServerID = "yaws",

	{ok, SCList, GC, ChildSpecs} = yaws_api:embedded_start_conf(
		?DIR_PUB,[
			{port, 8080},
			{listen, {0,0,0,0}},
			{docroot, ?DIR_PUB},
			{appmods, [{"api", api}]}
		],[
			{id,ServerID},
			{logdir, ?DIR_LOG}
		],
		ServerID
	),
	[supervisor:start_child(a_yaws_sup, Ch) || Ch <- ChildSpecs],
	yaws_api:setconf(GC, SCList),

	{ok, self()}.