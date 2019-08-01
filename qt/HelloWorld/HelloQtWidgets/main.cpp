/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file is qt4project/main.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created %DAY%/%MONTH%/%YEAR% at %DATE%
 * */// --------------------------------------------------------------

// System includes
#include "aMainWindow.h"
#include <QApplication>

// Application includes

// Constants


// Application
int main(int Counter, char *Arguments[]) {

	QApplication oApplication(Counter, Arguments);
	aMainWindow oWindow;
	oWindow.setWindowFlag(Qt::MaximizeUsingFullscreenGeometryHint, true);

	QLabel *oLabel = oWindow.mCreateLabel();
	oLabel->show();
	return oApplication.exec();
}
