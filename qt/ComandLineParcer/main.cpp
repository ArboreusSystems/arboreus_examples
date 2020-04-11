/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file wizards/projects/consoleapp/main.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 04/12/2019 at 10:30:32
 * */// --------------------------------------------------------------

// System includes
#include <QCoreApplication>

// Application includes

// Constants

// Console Application
int main(int inCounter, char *inArguments[])
{
	QCoreApplication oApplication(inCounter,inArguments);

	return oApplication.exec();
}
