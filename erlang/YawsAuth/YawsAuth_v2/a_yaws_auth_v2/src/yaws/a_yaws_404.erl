%%%-------------------------------------------------------------------
%%% @author alexandr
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. Nov 2023 18:24
%%%-------------------------------------------------------------------
-module(a_yaws_404).
-author("alexandr").

%% API
-export([
	out404/3
]).


%% ----------------------------
%% @doc

out404(ARGUMENTS,GC,SC) ->

	erlang:display(ARGUMENTS),
	io:format("~n"),
	erlang:display(GC),
	io:format("~n"),
	erlang:display(SC),
	[].