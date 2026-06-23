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

bool mIsPhone(void) {

	QJniObject oContext = qApp->nativeInterface<QNativeInterface::QAndroidApplication>()->context();
	if (!oContext.isValid()) return false;

	QJniObject oResources = oContext.callObjectMethod("getResources","()Landroid/content/res/Resources;");
	QJniObject oConfiguration = oResources.callObjectMethod("getConfiguration","()Landroid/content/res/Configuration;");
	jint oLayout = oConfiguration.getField<jint>("screenLayout");
	int oLayoutSizeMask = 0x0F;
	int oLayoutSizeLarge = 0x03;

	int oSizeClass = oLayout & oLayoutSizeMask;
	bool oResult = (oSizeClass < oLayoutSizeLarge);

	return oResult;
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

	_A_DEBUG << "Is phone:" << mIsPhone();

	return oApplication.exec();
}
