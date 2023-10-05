%%%-------------------------------------------------------------------
%%% @author alexandr
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 04. Oct 2023 23:11
%%%-------------------------------------------------------------------
-module(send_file_v1).
-author("alexandr").

%% API
-export([
	small/3,
	big_remote_function/3
]).


small(Node,FilePathSource,FilePathDestination) ->

	case file:read_file_info(FilePathSource) of
		{ok,_FileSourceInfo} ->
			case net_kernel:connect_node(Node) of
				true ->
					case net_adm:ping(Node) of
						pong ->
							{ok, FileSourceBinary} = file:read_file(FilePathSource),
							rpc:call(Node,file,write_file,[FilePathDestination,FileSourceBinary]);
						_ ->
							{error,"No ping to node"}
					end;
				_ ->
					{error,"Node not connected"}
			end;
		Error ->
			Error
	end.


big_remote_function(Node,FilePathSource,FilePathDestination) ->

	case file:read_file_info(FilePathSource) of
		{ok,_FileSourceInfo} ->
			io:fwrite("Source file is Ok~n"),
			case net_kernel:connect_node(Node) of
				true ->
					io:fwrite("Node connected~n"),
					case net_adm:ping(Node) of
						pong ->
							io:fwrite("Ping is Ok~n"),
							{ok, FileSourceBinary} = file:read_file(FilePathSource),
							Self = self(),
							RemoteFunction = fun() ->
								Self ! file:open(FilePathDestination,[write,binary,raw]),
								receive
									close -> ok
								end
							end,
							SpawnFunction = spawn_link(Node,RemoteFunction()),
							{ok,FunctionReceive} = receive Message -> Message end,
							file:write(FunctionReceive,FileSourceBinary),
							SpawnFunction ! close;
						_ ->
							{error,"No ping to node"}
					end;
				_ ->
					{error,"Node not connected"}
			end;
		Error ->
			Error
	end.
