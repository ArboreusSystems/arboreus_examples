%%%-------------------------------------------------------------------
%%% @author Alexandr Kirilov, https://alexandr.kirilov.me
%%% @copyright (C) 2024, Arboreus, https://arboreus.systems
%%% @doc
%%%
%%% @end
%%% Created : 15. Oct 2024 20:30
%%%-------------------------------------------------------------------
-module(a_rest_reply).
-author("Alexandr Kirilov, https://alexandr.kirilov.me").

%% System includes

%% Application includes
-include("a_rest.hrl").

%% API
-export([

	test/0,

	default/0,
	ok/1

]).


%% ----------------------------
%% @doc Module test function
-spec test() -> ok.

test() -> ok.


%% ----------------------------
%% @doc Return REST API default Yaws headers
-spec default() -> OUTPUT when OUTPUT :: a_yaws_http_headers().

default() ->

	[
		a_yaws_http_headers:cors(),
		a_yaws_http_headers:cache(no)
	].


%% ----------------------------
%% @doc Return REST API default Yaws headers with data
-spec ok(DATA) -> OUTPUT
	when
		OUTPUT :: a_yaws_appmode_output(),
		DATA :: a_utf_text_binary() | a_utf_text_string().

ok(DATA) ->

	[
		default(),
		{ehtml,[DATA]}
	].