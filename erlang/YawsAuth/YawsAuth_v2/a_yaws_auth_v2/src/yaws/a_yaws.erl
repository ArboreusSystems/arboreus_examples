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

	SERVER_ID = "yaws_auth",

	{ok,SERVER_CONFIG,GLOBAL_CONFIG,CHILD_SPECIFICATION} = yaws_api:embedded_start_conf(
		?A_DIR_PUB,[
			{port, 8080},
			{listen, {0,0,0,0}},
			{yaws, "Super web server"},
			{docroot, ?A_DIR_PUB},
			{errormod_404,a_yaws_404},
			{errormod_401,a_yaws_401},
			{auth,[
				{dir,"/restricted"},
				{mod,a_yaws_auth}
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