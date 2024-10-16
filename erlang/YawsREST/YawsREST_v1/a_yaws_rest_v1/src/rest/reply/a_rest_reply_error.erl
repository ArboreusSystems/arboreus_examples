%%%-------------------------------------------------------------------
%%% @author Alexandr Kirilov, https://alexandr.kirilov.me
%%% @copyright (C) 2024, Arboreus, https://arboreus.systems
%%% @doc
%%%
%%% @end
%%% Created : 15. Oct 2024 23:02
%%%-------------------------------------------------------------------
-module(a_rest_reply_error).
-author("Alexandr Kirilov, https://alexandr.kirilov.me").

%% System includes

%% Application includes
-include("a_rest.hrl").

%% API
-export([

	test/0,

	wrong_path/0,
	not_authorised/0,
	application_error/0,
	wrong_method/0,
	not_validated/1

]).


%% ----------------------------
%% @doc Module test function
-spec test() -> ok.

test() -> ok.


%% ----------------------------
%% @doc Return Yaws output for "Bad request URL"
-spec wrong_path() -> OUTPUT
	when OUTPUT :: a_yaws_appmode_output().

wrong_path() ->

	[
		a_rest_reply:default(),
		{ehtml,[<<"wrong_path"/utf8>>]}
	].


%% ----------------------------
%% @doc Return Yaws output for "Not authorised"
-spec not_authorised() -> OUTPUT
	when OUTPUT :: a_yaws_appmode_output().

not_authorised() ->

	[
		a_rest_reply:default(),
		{ehtml,[<<"not_authorised"/utf8>>]}
	].


%% ----------------------------
%% @doc Return Yaws output for "Application error"
-spec application_error() -> OUTPUT
	when OUTPUT :: a_yaws_appmode_output().

application_error() ->

	[
		a_rest_reply:default(),
		{ehtml,[<<"application_error"/utf8>>]}
	].


%% ----------------------------
%% @doc Return Yaws output for "Application error"
-spec wrong_method() -> OUTPUT
	when OUTPUT :: a_yaws_appmode_output().

wrong_method() ->

	[
		a_rest_reply:default(),
		{ehtml,[<<"wrong_method"/utf8>>]}
	].


%% ----------------------------
%% @doc Return Yaws output for "Application error"
-spec not_validated(NAME) -> OUTPUT
	when
		OUTPUT :: a_yaws_appmode_output(),
		NAME :: unicode:latin1_chardata().

not_validated(NAME) ->

	[
		a_rest_reply:default(),
		{'ehtml',[
			["<!DOCTYPE html> "],
			{'html',[],[
				{'head',[],[
					{'title',[],"Not validated"},
					["\n"]
				]},
				{'body',[],[
					[{'div',[],"Not validated"}],
					[{'div',[],lists:concat(["Parameter: ",NAME])}]
				]}
			]}
		]}
	].