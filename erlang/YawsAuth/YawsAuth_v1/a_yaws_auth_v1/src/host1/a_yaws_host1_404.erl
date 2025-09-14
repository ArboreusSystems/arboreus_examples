%%%-------------------------------------------------------------------
%%% @author alexandr
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. Nov 2023 15:42
%%%-------------------------------------------------------------------
-module(a_yaws_host1_404).
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
	[
		{status,404}
	].