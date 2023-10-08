#include <erl_nif.h>

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int gVariable = 0;

static ERL_NIF_TERM mk_atom(ErlNifEnv* env, const char* atom) {

	ERL_NIF_TERM ret;

	if(!enif_make_existing_atom(env, atom, &ret, ERL_NIF_LATIN1)) {
		return enif_make_atom(env, atom);
	}

	return ret;
}


static ERL_NIF_TERM mk_error(ErlNifEnv* env, const char* mesg) {

	return enif_make_tuple2(env, mk_atom(env, "error"), mk_atom(env, mesg));
}


static ERL_NIF_TERM repeat(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) {

	ErlNifEnv* msg_env;
	ErlNifPid pid;
	ERL_NIF_TERM copy;

	if(argc != 2) {
		return enif_make_badarg(env);
	}

	if(!enif_is_pid(env, argv[0])) {
		return mk_error(env, "not_a_pid");
	}

	if(!enif_get_local_pid(env, argv[0], &pid)) {
		return mk_error(env, "not_a_local_pid");
	}

	msg_env = enif_alloc_env();
	if(msg_env == NULL) {
		return mk_error(env, "environ_alloc_error");
	}

	copy = enif_make_copy(msg_env, argv[1]);

	if(!enif_send(env, &pid, msg_env, copy)) {
		enif_free(msg_env);
		return mk_error(env, "error_sending_term");
	}

	enif_free_env(msg_env);
	return mk_atom(env, "ok");
}

static ERL_NIF_TERM set_value(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) {

	srand(time(NULL));   // Initialization, should only be called once.
	gVariable = rand();

	return mk_atom(env, "ok");
}

static ERL_NIF_TERM get_value(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) {

	return enif_make_uint(env,gVariable);
}


static ErlNifFunc nif_funcs[] = {
	{"repeat", 2, repeat},
	{"set_value", 0, set_value},
	{"get_value", 0, get_value},
};

ERL_NIF_INIT(nif_v1, nif_funcs, NULL, NULL, NULL, NULL);
