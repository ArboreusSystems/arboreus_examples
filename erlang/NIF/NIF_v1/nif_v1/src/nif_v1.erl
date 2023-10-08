-module(nif_v1).
-export([
    repeat/2,
	set_value/0,
	get_value/0
]).
-on_load(init/0).

-define(APPNAME, nif_v1).
-define(LIBNAME, nif_v1).


init() ->

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
			io:format("Value initiated~n");
		_ ->
			io:format("Error while loading NIF. Can't set value.~n")
	end.


repeat(_, _) -> not_loaded(?LINE).
set_value() -> not_loaded(?LINE).
get_value() -> not_loaded(?LINE).


not_loaded(Line) ->

	erlang:nif_error({not_loaded, [{module, ?MODULE}, {line, Line}]}).