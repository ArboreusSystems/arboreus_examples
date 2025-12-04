%%%-------------------------------------------------------------------
%%% @author Alexandr Kirilov, https://alexandr.kirilov.me
%%% @copyright (C) 2025, Arboreus, https://arboreus.systems
%%% @doc
%%%
%%% @end
%%% Created : 03. Dec 2025 08:38
%%%-------------------------------------------------------------------
-author("Alexandr Kirilov, https://alexandr.kirilov.me").

-ifndef(AS_TIMER_HANDLER).
-define(AS_TIMER_HANDLER, 1).

%% System includes

%% Application includes

%% State
-record(as_timer_handler,{

	time = 5000 :: pos_integer(),
	timer = undefined :: reference()
}).

-endif. %% AS_TIMER_HANDLER
