%%%-------------------------------------------------------------------
%%% @author Alexandr Kirilov, https://alexandr.kirilov.me
%%% @copyright (C) 2025, Arboreus, https://arboreus.systems
%%% @doc
%%%
%%% @end
%%% Created : 03. Dec 2025 16:52
%%%-------------------------------------------------------------------
-author("Alexandr Kirilov, https://alexandr.kirilov.me").

-ifndef(AD_DEBUG).
-define(AD_DEBUG, 1).

%% System includes

%% Application includes

%% Definitions
-define(AD_DEBUG_WHERE,{?MODULE,?FUNCTION_NAME,?LINE}).
-define(AD_DEBUG_DISPLAY,erlang:display(?AD_DEBUG_WHERE)).
-define(AD_DEBUG_DISPLAY_TERM(IN_TERM),erlang:display({?AD_DEBUG_WHERE,IN_TERM})).

-endif. %% AD_DEBUG
