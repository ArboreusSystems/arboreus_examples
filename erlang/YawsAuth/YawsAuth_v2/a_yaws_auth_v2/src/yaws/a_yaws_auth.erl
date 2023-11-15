%%%-------------------------------------------------------------------
%%% @author alexandr
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. Nov 2023 18:27
%%%-------------------------------------------------------------------
-module(a_yaws_auth).
-author("alexandr").

%% API
-export([
	auth/2
]).


%% ----------------------------
%% @doc

auth(ARGUMENTS,AUTHORISATION) ->

	io:format("a_yaws_host1_auth:auth/2 called~n"),
	io:format("ARGUMENTS:~n"),
	erlang:display(ARGUMENTS),
	io:format("AUTHORISATION:~n--"),
	erlang:display(AUTHORISATION),
	true.
