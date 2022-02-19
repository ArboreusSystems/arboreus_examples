/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file projects/qtquickapplication/main.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 07/09/2020 at 14:19:20
 * */// --------------------------------------------------------------

// System includes
#include <QGuiApplication>
#include <QQmlApplicationEngine>

// Application includes
#include "aunittest.h"

// Namespace


int main(int inCounter, char *inArguments[]) {

	QGuiApplication oApplication(inCounter,inArguments);
	return mUnitTests(inCounter,inArguments);
}
