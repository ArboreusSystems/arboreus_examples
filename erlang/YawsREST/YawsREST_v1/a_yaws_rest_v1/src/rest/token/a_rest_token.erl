%%%-------------------------------------------------------------------
%%% @author Alexandr Kirilov, https://alexandr.kirilov.me
%%% @copyright (C) 2024, Arboreus, https://arboreus.systems
%%% @doc
%%%
%%% @end
%%% Created : 15. Oct 2024 22:53
%%%-------------------------------------------------------------------
-module(a_rest_token).
-author("Alexandr Kirilov, https://alexandr.kirilov.me").

%% System includes

%% Application includes
-include("a_rest.hrl").

%% API
-export([

	test/0,

	check/1

]).


%% ----------------------------
%% @doc Module test function
-spec test() -> ok.

test() -> ok.


%% ----------------------------
%% @doc Check authorisation token in Yaws Arguments
-spec check(YAWS_ARGUMENTS) -> undefined | not_authorised | {authorized,TOKEN}
	when
		YAWS_ARGUMENTS :: #arg{},
		TOKEN :: a_utf_text_binary().

check(_YAWS_ARGUMENTS) ->

	{authorized,<<"TokenBodyOrValue"/utf8>>}.