%%%-------------------------------------------------------------------
%%% @author Alexandr Kirilov, https://alexandr.kirilov.me
%%% @copyright (C) 2024, Arboreus, https://arboreus.systems
%%% @doc
%%%
%%% @end
%%% Created : 19. Sep 2024 20:15
%%%-------------------------------------------------------------------
-author("Alexandr Kirilov, https://alexandr.kirilov.me").

%% System includes

%% Application includes

-ifndef(A_REST_API_DEFINITIONS).
-define(A_REST_API_DEFINITIONS, 1).

-define(A_NAME_APPLICATION,a_rest_api_v1).

-define(A_VARIABLE_ROOT_SUPERVISOR,a_variable_root_supervisor).

-define(A_YAWS_ID,a_rest_api_yaws).
-define(A_YAWS_PORT,23432).
-define(A_YAWS_SIGNATURE,"REST API web server").

-endif. %% A_REST_API_DEFINITIONS