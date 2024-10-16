%%%-------------------------------------------------------------------
%%% @author Alexandr Kirilov, https://alexandr.kirilov.me
%%% @copyright (C) 2024, Arboreus, https://arboreus.systems
%%% @doc
%%%
%%% @end
%%% Created : 15. Oct 2024 23:07
%%%-------------------------------------------------------------------
-module(a_rest_method_validated).
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

	POST_PARAMETERS = yaws_api:parse_post(YAWS_ARGUMENTS),

	TYPE = a_rest_parameter:type(POST_PARAMETERS,[1,2,3,4]),
	EMAIL = a_rest_parameter:email(POST_PARAMETERS),

	if
		TYPE == nomatch -> catch a_rest_reply_error:not_validated(?A_NAME_TYPE);
		EMAIL == nomatch -> catch a_rest_reply_error:not_validated(?A_NAME_EMAIL);
		true ->
			[
				an_ra_http_reply:ok(),
				{'ehtml',[
					["<!DOCTYPE html> "],
					{'html',[],[
						{'head',[],[
							{'title',[],"Not validated"},
							["\n"]
						]},
						{'body',[],[
							[{'div',[],"Validated"}],
							[{'div',[],lists:concat(["Type: ",TYPE," Email: ",EMAIL])}]
						]}
					]}
				]}
			]
	end.
