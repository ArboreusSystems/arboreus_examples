#include <iostream>
#include <mpi.h>

using namespace std;


int main(int inCounter, char* inArguments[]) {

	int oRank = 0;
	int oSize = 0;
	int oNext = 0;
	int oPrevious = 0;
	int oMessage = 0;
	int oTag = 201;

	MPI_Init(&inCounter, &inArguments);

	MPI_Comm_rank(MPI_COMM_WORLD,&oRank);
	MPI_Comm_size(MPI_COMM_WORLD,&oSize);

	oNext = (oRank + 1) % oSize;
	oPrevious = (oRank + oSize - 1) % oSize;

	if (0 == oRank) {

		oMessage = 10;
		printf("Sending %d from 0 to %d, with tag %d (%d processes in ring)\n",oMessage,oNext,oTag,oSize);
		MPI_Send(&oMessage,1,MPI_INT,oNext,oTag,MPI_COMM_WORLD);
		printf("Sent from 0 to %d\n",oNext);
	}

	while (1) {

		MPI_Recv(&oMessage,1,MPI_INT,oPrevious,oTag,MPI_COMM_WORLD,MPI_STATUS_IGNORE);
		if (0 == oRank) {
			--oMessage;
			printf("Decremented in 0 value: %d\n", oMessage);
		}

		MPI_Send(&oMessage,1,MPI_INT,oNext,oTag,MPI_COMM_WORLD);
		if (0 == oMessage) {
			printf("In %d exiting\n", oRank);
			break;
		}
	}

	if (0 == oRank) {
		MPI_Recv(&oMessage,1,MPI_INT,oPrevious,oTag,MPI_COMM_WORLD,MPI_STATUS_IGNORE);
	}

	MPI_Finalize();

	return 0;
}
