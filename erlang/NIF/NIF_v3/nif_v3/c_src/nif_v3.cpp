// System includes
#include <erl_nif.h>
#include <iostream>
#include <stdio.h>

// Application includes
#include "aniftest.h"

#ifdef __cplusplus
extern "C" {
#endif

using namespace std;

ERL_NIF_TERM mk_atom(ErlNifEnv* env, const char* atom) {

    ERL_NIF_TERM ret;

    if(!enif_make_existing_atom(env, atom, &ret, ERL_NIF_LATIN1)) {
        return enif_make_atom(env, atom);
    }

    return ret;
}

ERL_NIF_TERM mk_error(ErlNifEnv* env, const char* mesg) {

    return enif_make_tuple2(env, mk_atom(env, "error"), mk_atom(env, mesg));
}

static ERL_NIF_TERM test(ErlNifEnv* inEnvironment, int inCounter, const ERL_NIF_TERM inArguments[]) {

	ANifTest oTest;

	return enif_make_string(inEnvironment,oTest.mGetString().c_str(),ERL_NIF_UTF8);
}

static ErlNifFunc nif_funcs[] = {
    {"test", 0, test}
};

ERL_NIF_INIT(nif_v3, nif_funcs, NULL, NULL, NULL, NULL);

#ifdef __cplusplus
} // closing brace for extern "C"
#endif
