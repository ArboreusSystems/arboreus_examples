%%%-------------------------------------------------------------------
%%% @author Alexandr Kirilov, https://alexandr.kirilov.me
%%% @copyright (C) 2024, Arboreus, https://arboreus.systems
%%% @doc
%%%
%%% @end
%%% Created : 15. Oct 2024 20:14
%%%-------------------------------------------------------------------
-module(a_rest).
-author("Alexandr Kirilov, https://alexandr.kirilov.me").

%% System includes

%% Application includes
-include("a_rest.hrl").

%% API
-export([

	test/0,

	out/1

]).

%% Constants and definitions
-define(A_APPLICATION_MODE_DEBUG,debug).
-define(A_APPLICATION_MODE_RELEASE,release).
-define(A_APPLICATION_MODE,?A_APPLICATION_MODE_DEBUG).


%% ----------------------------
%% @doc Module test function
-spec test() -> ok.

test() -> ok.


%% ----------------------------
%% @doc Yaws app_mode function
-spec out(YAWS_ARGUMENTS) -> OUTPUT
	when
		YAWS_ARGUMENTS :: #arg{},
		OUTPUT :: a_yaws_appmode_output().

out(YAWS_ARGUMENTS) ->

	case (YAWS_ARGUMENTS#arg.req)#http_request.method of
		'POST' ->
			URI = yaws_api:request_url(YAWS_ARGUMENTS),
			PATH = URI#url.path,
			case ?A_APPLICATION_MODE of
				?A_APPLICATION_MODE_DEBUG ->
					case PATH of
						"/test" -> a_rest_method_test:do(YAWS_ARGUMENTS);
						"/show_request" -> a_rest_method_show_request:do(YAWS_ARGUMENTS);
						_ -> out(PATH,YAWS_ARGUMENTS)
					end;
				_ ->
					try	out(PATH,YAWS_ARGUMENTS)
					catch _:_ -> a_rest_reply_error:application_error() end
			end;
		_ -> a_rest_reply_error:wrong_method()
	end.


%% ----------------------------
%% @doc Handling the path with arguments
-spec out(PATH,YAWS_ARGUMENTS) -> OUTPUT
	when
		PATH :: unicode:latin1_chardata(),
		YAWS_ARGUMENTS :: #arg{},
		OUTPUT :: a_yaws_appmode_output().

out(PATH,YAWS_ARGUMENTS) ->

	case a_rest_token:check(YAWS_ARGUMENTS) of
		{authorized,_TOKEN} ->
			case PATH of
				"/validated" -> a_rest_method_validated:do(YAWS_ARGUMENTS);
				_ -> a_rest_reply_error:wrong_path()
			end;
		_ ->
			a_rest_reply_error:not_authorised()
	end.