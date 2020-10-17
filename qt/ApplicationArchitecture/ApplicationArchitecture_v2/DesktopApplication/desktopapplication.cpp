/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file projects/qtquickapplication/main.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 14/10/2020 at 19:19:34
 * */// --------------------------------------------------------------

// System includes

// Application includes
#include "cpp/Main/adesktopapplication.h"

// Namespace


int main(int inCounter, char* inArguments[]) {

	ADesktopApplication oApplication(inCounter,inArguments);
	return oApplication.mExecute(inCounter,inArguments);
}
