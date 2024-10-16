%%%-------------------------------------------------------------------
%%% @author Alexandr Kirilov, https://alexandr.kirilov.me
%%% @copyright (C) 2024, Arboreus, https://arboreus.systems
%%% @doc
%%%
%%% @end
%%% Created : 15. Oct 2024 20:26
%%%-------------------------------------------------------------------
-module(a_rest_method_show_request).
-author("Alexandr Kirilov, https://alexandr.kirilov.me").

%% System includes

%% Application includes
-include("a_rest.hrl").

%% API
-export([

	test/0,

	do/1

]).


%% ----------------------------
%% @doc Module test function
-spec test() -> ok.

test() -> ok.


%% ----------------------------
%% @doc Handling REST API method /show_request.
-spec do(YAWS_ARGUMENTS) -> OUTPUT
	when
		YAWS_ARGUMENTS :: #arg{},
		OUTPUT :: a_yaws_appmode_output().

do(YAWS_ARGUMENTS) ->

	PEER = YAWS_ARGUMENTS#arg.client_ip_port,
	REQUEST = YAWS_ARGUMENTS#arg.req,
	HEADER = yaws_api:reformat_header(YAWS_ARGUMENTS#arg.headers),
	[
		a_rest_reply:default(),
		{ehtml,
			[
				{h5,[],"The headers passed to us were:"},
				{hr,[],[]},
				{ol,[],lists:map(fun(S) -> {li,[],{p,[],S}} end,HEADER)},
				{h5,[], "The request"},
				{ul,[],
					[{li,[],yaws_api:f("method: ~s", [REQUEST#http_request.method])},
						{li,[],yaws_api:f("path: ~p", [REQUEST#http_request.path])},
						{li,[],yaws_api:f("version: ~p", [REQUEST#http_request.version])}
					]},
				{hr,[],[]},
				{h5,[],"Other items"},
				{ul,[],
					[{li,[],yaws_api:f("Peer: ~p", [PEER])},
						{li,[],yaws_api:f("docroot: ~s", [YAWS_ARGUMENTS#arg.docroot])},
						{li,[],yaws_api:f("fullpath: ~s", [YAWS_ARGUMENTS#arg.fullpath])}]},
				{hr,[],[]},
				{h5,[],"Parsed query data"},
				{pre,[],yaws_api:f("~p",[yaws_api:parse_query(YAWS_ARGUMENTS)])},
				{hr,[],[]},
				{h5,[],"Parsed POST data "},
				{pre,[],yaws_api:f("~p",[yaws_api:parse_post(YAWS_ARGUMENTS)])}
			]
		}
	].