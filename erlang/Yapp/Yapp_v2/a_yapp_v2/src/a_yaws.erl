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
-define(A_DIR_LOG,"log").
-define(A_DIR_PUB,"src/pub").


%% ----------------------------
%% @doc

start() ->

	{ok, spawn(?MODULE, start_server, [])}.


%% ----------------------------
%% @doc

start_server() ->

	ServerID = "yaws",

	{ok,ServerConfig,GlobalConfig,ChildSpecs} = yaws_api:embedded_start_conf(
		?A_DIR_PUB,[
			{port, 8080},
			{listen, {0,0,0,0}},
			{yaws, "Super-pooper web server"},
			{docroot, ?A_DIR_PUB},
			{appmods, [
				{"a_yaws_host1", a_yaws_host1},
				{"a_yaws_host2", a_yaws_host2}
			]}
		],[
			{id,ServerID},
			{logdir, ?A_DIR_LOG}
		],
		ServerID
	),
	[supervisor:start_child(a_yaws_sup,Child) || Child <- ChildSpecs],
	yaws_api:setconf(GlobalConfig,ServerConfig),

	{ok, self()}.