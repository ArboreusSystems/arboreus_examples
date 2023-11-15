%%%-------------------------------------------------------------------
%%% @author alexandr
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. Nov 2023 11:05
%%%-------------------------------------------------------------------
-module(a_yaws_host1).
-author("alexandr").

%% System includes
-include_lib("yaws/include/yaws.hrl").
-include_lib("yaws/include/yaws_api.hrl").

%% Application includes

%% API
-export([
	test/0,
	out/1
]).


%% ----------------------------
%% @doc Module test function
-spec test() -> ok.

test() -> ok.


%% ----------------------------
%% @doc

out(_YAWS_ARGUMENTS) ->

	{'ehtml',[
		["<!DOCTYPE html> "],
		{'html',[],[
			{'head',[],[
				{'title',[],"Yaws Host 1 test page"},
				["\n"]
			]},
			{'body',[],[
				[{'div',[],"Host 1 dynamic content from Yaws appmod"}]
			]}
		]}
	]}.


