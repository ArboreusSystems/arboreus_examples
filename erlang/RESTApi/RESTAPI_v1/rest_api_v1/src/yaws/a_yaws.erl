%%%-------------------------------------------------------------------
%%% @author Alexandr Kirilov, https://alexandr.kirilov.me
%%% @copyright (C) 2024, Arboreus, https://arboreus.systems
%%% @doc
%%%
%%% @end
%%% Created : 19. Sep 2024 20:51
%%%-------------------------------------------------------------------
-module(a_yaws).
-author("Alexandr Kirilov, https://alexandr.kirilov.me").

%% System includes

%% Application includes
-include("a_rest_api_v1.hrl").

%% API
-export([

	test/0,

	start/0,
	start_yaws/0

]).


%% ----------------------------
%% @doc Module test function
-spec test() -> ok.

test() -> ok.


%% ----------------------------
%% @doc
-spec start() -> {ok,pid()}.

start() ->

	{ok,spawn(?MODULE,start_yaws,[])}.


%% ----------------------------
%% @doc
-spec start_yaws() -> {ok,pid()}.

start_yaws() ->

	{ok,CURRENT_DIRECTORY} = file:get_cwd(),
	PUB_DIRECTORY = CURRENT_DIRECTORY ++ "/pub",
	LOG_DIRECTORY = CURRENT_DIRECTORY ++ "/log",

	SERVER_ID = ?A_YAWS_ID,

	{ok,SERVER_CONFIG,GLOBAL_CONFIG,CHILD_SPECIFICATION} = yaws_api:embedded_start_conf(
		PUB_DIRECTORY,[
			{port,?A_YAWS_PORT},
			{listen,{0,0,0,0}},
			{yaws,?A_YAWS_SIGNATURE},
			{docroot,PUB_DIRECTORY}
		],[
			{id,SERVER_ID},
			{logdir, LOG_DIRECTORY}
		],
		SERVER_ID
	),
	[supervisor:start_child(a_yaws_sup,CHILD) || CHILD <- CHILD_SPECIFICATION],
	yaws_api:setconf(GLOBAL_CONFIG,SERVER_CONFIG),

	{ok, self()}.