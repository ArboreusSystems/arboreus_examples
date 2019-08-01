/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file is qt4project/mywidget.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created %DAY%/%MONTH%/%YEAR% at %DATE%
 * */// --------------------------------------------------------------

// System includes
#include "aMainWindow.h"

// Application includes

// Constants


// Widget
aMainWindow::aMainWindow(QWidget *parent): QWidget(parent) {}

aMainWindow::~aMainWindow() {}

QLabel* aMainWindow::mCreateLabel() {

	QLabel *oLabel = new QLabel();
	oLabel->setText("Hello world in QWidgets");
	return oLabel;
}
