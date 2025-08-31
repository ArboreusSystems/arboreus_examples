#include <stdio.h>
#include </usr/local/lib/perl5/5.38/darwin-thread-multi-2level/CORE/EXTERN.h>
#include </usr/local/lib/perl5/5.38/darwin-thread-multi-2level/CORE/perl.h>

static PerlInterpreter *my_perl;

int main(int argc, char **argv, char **env) {

	printf("Using Perl v1\n");

	PERL_SYS_INIT3(&argc,&argv,&env);
		my_perl = perl_alloc();
		perl_construct(my_perl);
	PL_exit_flags |= PERL_EXIT_DESTRUCT_END;
		perl_parse(my_perl, NULL, argc, argv, (char **)NULL);
		perl_run(my_perl);
		perl_destruct(my_perl);
		perl_free(my_perl);
	PERL_SYS_TERM();

	exit(EXIT_SUCCESS);
}
