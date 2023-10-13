%%%-------------------------------------------------------------------
%%% @author alexandr
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 13. Oct 2023 14:06
%%%-------------------------------------------------------------------
-module(a_yaws_appmode1).
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
				{'title',[],"Appmod1 test page"},
				["\n"]
			]},
			{'body',[],[
				[{'div',[],"Appmod1 dynamic content from Yaws appmod"}]
			]}
		]}
	]}.

