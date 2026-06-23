/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file tablemodel.h
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 23/06/2026 at 10:32:05
 * */// --------------------------------------------------------------


// Precompiled includes
#include <main_pch.h>

// System includes

// Application includes
#include <alogger.h>


// Global functions
// -----------
/*!
	\fn

	Doc.
*/

bool fIsPhone(void) {

	QScreen* oScreen = QGuiApplication::primaryScreen();
	if (!oScreen) return false;

	qreal oPhysicalWidthInch = oScreen->physicalSize().width() / 25.4;
	qreal oPhysicalHeightInch = oScreen->physicalSize().height() / 25.4;
	qreal oDiagonal = qSqrt((oPhysicalWidthInch * oPhysicalWidthInch) + (oPhysicalHeightInch * oPhysicalHeightInch));

	return oDiagonal < 7.0;
}


// Qt Quick Application
int main(int inCounter, char *inArguments[]) {

	QGuiApplication oApplication(inCounter, inArguments);
	QQmlApplicationEngine oEngine;

	qInstallMessageHandler(fLoggerMessageHandler);

	const QUrl oURL = QUrl(QStringLiteral("qrc:/Main.qml"));
	QObject::connect(
		&oEngine, &QQmlApplicationEngine::objectCreationFailed,
		&oApplication, []() {
			QCoreApplication::exit(-1);
		},
		Qt::QueuedConnection
	);
	oEngine.load(oURL);

	_A_DEBUG << "Is phone:" << fIsPhone();

	return oApplication.exec();
}
