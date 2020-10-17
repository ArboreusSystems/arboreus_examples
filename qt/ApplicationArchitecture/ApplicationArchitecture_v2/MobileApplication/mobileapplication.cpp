/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file projects/qtquickapplication/main.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 14/10/2020 at 19:13:30
 * */// --------------------------------------------------------------

// System includes


// Application includes
#include "cpp/Main/amobileapplication.h"

// Namespace


int main(int inCounter, char *inArguments[]) {

	AMobileApplication oApplication(inCounter,inArguments);
	return oApplication.mExecute(inCounter,inArguments);
}
