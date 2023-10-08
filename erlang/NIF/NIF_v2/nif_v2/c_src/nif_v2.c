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

static ERL_NIF_TERM set_value(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) {

	srand(time(NULL));   // Initialization, should only be called once.
	gVariable = rand();

	return mk_atom(env, "ok");
}

static ERL_NIF_TERM get_value(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) {

	return enif_make_uint(env,gVariable);
}


static ErlNifFunc nif_funcs[] = {
	{"set_value", 0, set_value},
	{"get_value", 0, get_value},
};

ERL_NIF_INIT(nif_v2, nif_funcs, NULL, NULL, NULL, NULL);
