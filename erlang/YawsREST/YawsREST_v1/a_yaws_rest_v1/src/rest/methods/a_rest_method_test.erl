%%%-------------------------------------------------------------------
%%% @author Alexandr Kirilov, https://alexandr.kirilov.me
%%% @copyright (C) 2024, Arboreus, https://arboreus.systems
%%% @doc
%%%
%%% @end
%%% Created : 15. Oct 2024 23:12
%%%-------------------------------------------------------------------
-module(a_rest_method_test).
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
%% @doc Handling REST API method /test.
-spec do(YAWS_ARGUMENTS) -> OUTPUT
	when
		YAWS_ARGUMENTS :: #arg{},
		OUTPUT :: a_yaws_appmode_output().

do(YAWS_ARGUMENTS) ->

	POST_PARAMETERS = yaws_api:parse_post(YAWS_ARGUMENTS),
	[
		a_rest_reply:default(),
		{'ehtml',[
			["<!DOCTYPE html> "],
			{'html',[],[
				{'head',[],[
					{'title',[],"Yaws REST API data test page"},
					["\n"]
				]},
				{'body',[],[
					[{'div',[],lists:concat(["Key: ",KEY," Value: ",VALUE])} || {KEY,VALUE} <- POST_PARAMETERS]
				]}
			]}
		]}
	].
