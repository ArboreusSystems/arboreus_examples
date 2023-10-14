%%%-------------------------------------------------------------------
%%% @author alexandr
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. Oct 2023 11:41
%%%-------------------------------------------------------------------
-module(a_appmod2).
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

out(_YawsArguments) ->

	{'ehtml',[
		["<!DOCTYPE html> "],
		{'html',[],[
			{'head',[],[
				{'title',[],"Appmod2 test page"},
				["\n"]
			]},
			{'body',[],[
				[{'div',[],"Appmod2 dynamic content from Yaws appmod"}]
			]}
		]}
	]}.


