%%%-------------------------------------------------------------------
%%% @author Alexandr Kirilov, https://alexandr.kirilov.me
%%% @copyright (C) 2024, Arboreus, https://arboreus.systems
%%% @doc
%%%
%%% @end
%%% Created : 15. Oct 2024 23:11
%%%-------------------------------------------------------------------
-module(a_rest_parameter).
-author("Alexandr Kirilov, https://alexandr.kirilov.me").

%% System includes

%% Application includes
-include("a_rest.hrl").

%% API
-export([

	test/0,

	email/1,
	type/2

]).


%% ----------------------------
%% @doc Module test function
-spec test() -> ok.

test() -> ok.


%% ----------------------------
%% @doc Check parametr from string that came from POST request
-spec parameter(POST_PARAMETERS,PARAMETER_NAME,TYPE,TYPE_PARAMETERS) -> any() | nomatch
	when
		POST_PARAMETERS :: proplists:proplist(),
		PARAMETER_NAME :: unicode:latin1_chardata(),
		TYPE :: atom(),
		TYPE_PARAMETERS :: list().

parameter(POST_PARAMETERS,PARAMETER_NAME,TYPE,TYPE_PARAMETERS)
	when
		is_list(POST_PARAMETERS), is_list(PARAMETER_NAME),
		is_atom(TYPE), is_list(TYPE_PARAMETERS) ->

	case proplists:get_value(PARAMETER_NAME,POST_PARAMETERS) of
		undefined -> nomatch;
		VALUE -> a_yaws_params:check(TYPE,VALUE,TYPE_PARAMETERS)
	end.


%% ----------------------------
%% @doc Check 'email' parameter with email value from login request
-spec email(POST_PARAMETERS) -> VALUE | nomatch
	when
		POST_PARAMETERS :: proplists:proplist(),
		VALUE :: a_utf_text_binary().

email(POST_PARAMETERS) ->

	case parameter(POST_PARAMETERS,?A_NAME_EMAIL,e_mail,[binary]) of
		nomatch -> nomatch;
		ID_EMAIL -> ID_EMAIL
	end.


%% ----------------------------
%% @doc Check 'type' parameter from list
-spec type(POST_PARAMETERS,LIST) -> VALUE | nomatch
	when
		POST_PARAMETERS :: proplists:proplist(),
		LIST :: [integer()],
		VALUE :: integer().

type(POST_PARAMETERS,LIST) ->

	parameter(POST_PARAMETERS,?A_NAME_TYPE,integer_from_list,[LIST]).
