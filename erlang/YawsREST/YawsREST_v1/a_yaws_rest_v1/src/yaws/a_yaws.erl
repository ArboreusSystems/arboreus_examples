%%%-------------------------------------------------------------------
%%% @author Alexandr Kirilov, https://alexandr.kirilov.me
%%% @copyright (C) 2024, Arboreus, https://arboreus.systems
%%% @doc
%%%
%%% @end
%%% Created : 15. Oct 2024 20:11
%%%-------------------------------------------------------------------
-module(a_yaws).
-author("Alexandr Kirilov, https://alexandr.kirilov.me").

%% System includes

%% Application includes
-include("a_rest.hrl").

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

	SERVER_ID = "yaws_rest",

	{ok,SERVER_CONFIG,GLOBAL_CONFIG,CHILD_SPECIFICATION} = yaws_api:embedded_start_conf(
		?A_DIR_PUB,[
			{port, 8080},
			{listen, {0,0,0,0}},
			{yaws, "Super web server"},
			{docroot, ?A_DIR_PUB},
			{appmods, [
				{"/", a_rest}
			]}
		],[
			{id,SERVER_ID},
			{logdir, ?A_DIR_LOG}
		],
		SERVER_ID
	),
	[supervisor:start_child(a_yaws_sup,CHILD) || CHILD <- CHILD_SPECIFICATION],
	yaws_api:setconf(GLOBAL_CONFIG,SERVER_CONFIG),

	{ok, self()}.