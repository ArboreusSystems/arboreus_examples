#include <iostream>
#include <mpi.h>

using namespace std;


int main(int inCounter, char* inArguments[]) {

	int oRank = 0;;
	int oSize = 0;
	int oLength = 0;
	char oVersion[MPI_MAX_LIBRARY_VERSION_STRING];

	MPI_Init(&inCounter, &inArguments);

	MPI_Comm_rank(MPI_COMM_WORLD,&oRank);
	MPI_Comm_size(MPI_COMM_WORLD,&oSize);
	MPI_Get_library_version(oVersion,&oLength);

	printf("OpenMPI, oRank %d of oSize %d\noVersion: %s\noLength: %d\n",oRank,oSize,oVersion,oLength);

	MPI_Finalize();

	return 0;
}
