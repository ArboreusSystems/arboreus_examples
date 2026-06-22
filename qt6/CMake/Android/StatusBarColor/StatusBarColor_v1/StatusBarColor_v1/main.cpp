/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file tablemodel.h
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 22/06/2026 at 11:52:00
 * */// --------------------------------------------------------------


// Precompiled includes
#include <main_pch.h>

// System includes

// Application includes

// Namesapces
using namespace QNativeInterface;


// Global functions
void gStatusBarDarkIcons(bool inVisibility) {

#if defined(Q_OS_ANDROID)

	QAndroidApplication::runOnAndroidMainThread([inVisibility]() {

		QJniObject oActivity = QNativeInterface::QAndroidApplication::context();
		if (!oActivity.isValid()) return;

		QJniObject oWindow = oActivity.callObjectMethod("getWindow","()Landroid/view/Window;");
		QJniObject oDecorView = oWindow.callObjectMethod("getDecorView","()Landroid/view/View;");

		QJniObject oInsetsController = QJniObject::callStaticObjectMethod(
			"androidx/core/view/WindowCompat",
			"getInsetsController",
			"(Landroid/view/Window;Landroid/view/View;)Landroidx/core/view/WindowInsetsControllerCompat;",
			oWindow.object(),
			oDecorView.object()
		);
		oInsetsController.callMethod<void>("setAppearanceLightStatusBars","(Z)V",inVisibility);
	});

#endif
}

// Qt Quick Application
int main(int inCounter, char *inArguments[]) {

	QGuiApplication oApplication(inCounter, inArguments);
	QQmlApplicationEngine oEngine;

	const QUrl oURL = QUrl(QStringLiteral("qrc:/Main.qml"));
	QObject::connect(
		&oEngine, &QQmlApplicationEngine::objectCreationFailed,
		&oApplication, []() {
			QCoreApplication::exit(-1);
		},
		Qt::QueuedConnection
	);
	oEngine.load(oURL);

	gStatusBarDarkIcons(true);

	return oApplication.exec();
}
