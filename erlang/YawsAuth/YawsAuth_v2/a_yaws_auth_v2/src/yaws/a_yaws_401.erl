%%%-------------------------------------------------------------------
%%% @author alexandr
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. Nov 2023 18:24
%%%-------------------------------------------------------------------
-module(a_yaws_401).
-author("alexandr").

%% API
-export([
	out/1
]).


%% ----------------------------
%% @doc

out(ARGUMENTS) ->

	erlang:display(ARGUMENTS),
	[
		{status,401}
	].
