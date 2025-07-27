#include <iostream>
#include <mpi.h>

using namespace std;


int main(int inCounter, char* inArguments[]) {

	MPI_Init(NULL, NULL);

	int oWorldSize = 0;
	MPI_Comm_size(MPI_COMM_WORLD,&oWorldSize);

	int oWorldRank = 0;
	MPI_Comm_rank(MPI_COMM_WORLD,&oWorldRank);

	char oProcessorName[MPI_MAX_PROCESSOR_NAME]; int oNameLength = 0;
	MPI_Get_processor_name(oProcessorName,&oNameLength);

	printf("oName: %s\noRank: %d\noSize: %d\n",oProcessorName,oWorldRank,oWorldSize);

	MPI_Finalize();

	return 0;
}
