-module(nif_v2).
-behaviour(gen_server).
-export([
	set_value/0,
	get_value/0,
	start/1,
	start_link/0,start_link/1,
	init/1,
	handle_call/3,
	handle_cast/2,
	handle_info/2,
	terminate/2,
	code_change/3
]).

-record(nif_v2_state,{
	value :: integer()
}).

-define(SERVER,?MODULE).
-define(APPNAME, nif_v2).
-define(LIBNAME, nif_v2).

start(ProcessName) ->

	gen_server:start({local, ProcessName}, ?MODULE, [], []).

start_link(ProcessName) ->

	gen_server:start_link({local,ProcessName},?MODULE,[],[]).

start_link() ->

	gen_server:start_link({local,?SERVER},?MODULE,[],[]).

init([]) ->

	SoName = case code:priv_dir(?APPNAME) of
		{error, bad_name} ->
			case filelib:is_dir(filename:join(["..", priv])) of
				true ->
					filename:join(["..", priv, ?LIBNAME]);
				_ ->
					filename:join([priv, ?LIBNAME])
			end;
		Dir ->
			filename:join(Dir, ?LIBNAME)
	end,
	case erlang:load_nif(SoName, 0) of
		ok ->
			set_value(),
			io:format("Value initiated with value ~p~n",[integer_to_list(get_value())]);
		{error,{reload,_}} ->
			io:format("NIF already loaded.~n"),
			io:format("Initiated with value ~p~n",[integer_to_list(get_value())]);
		Reply ->
			erlang:display(Reply),
			io:format("Error while loading NIF. Can't set value.~n")
	end,
	{ok,#nif_v2_state{}}.

handle_call(get_value,_From,State = #nif_v2_state{}) ->
	{reply,{value,get_value()},State};
handle_call(_Request,_From,State = #nif_v2_state{}) ->
	{reply,ok,State}.


handle_cast(_Request,State = #nif_v2_state{}) -> {noreply,State}.
handle_info(_Info,State = #nif_v2_state{}) -> {noreply,State}.
terminate(_Reason,_State = #nif_v2_state{}) -> ok.
code_change(_OldVsn,State = #nif_v2_state{},_Extra) -> {ok,State}.


set_value() -> not_loaded(?LINE).
get_value() -> not_loaded(?LINE).


not_loaded(Line) ->

	erlang:nif_error({not_loaded, [{module, ?MODULE}, {line, Line}]}).