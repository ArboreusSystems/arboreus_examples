/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file projects/qtquickapplication/main.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 14/10/2020 at 19:09:57
 * */// --------------------------------------------------------------

// System includes
#include <QGuiApplication>
#include <QQmlApplicationEngine>

// Application includes
#include "cpp/auitest.h"

// MacOS Desktop application includes
#ifdef Q_OS_MACOS
#include "../DesktopApplication/cpp/Main/adesktopapplication.h"
#endif

// iOS Mobile application includes
#ifdef Q_OS_IOS
#include "../MobileApplication/cpp/Main/amobileapplication.h"
#endif

// Android Mobile application includes
#ifdef Q_OS_ANDROID
#include "../MobileApplication/cpp/Main/amobileapplication.h"
#endif

// Namespace


int main(int inCounter, char* inArguments[]) {

	int oResult = false;
	AUITest* oTest = new AUITest();

#ifdef Q_OS_IOS
	AMobileApplication oApplication(inCounter,inArguments);
	oResult = oApplication.mExecute(inCounter,inArguments);
#elif defined(Q_OS_ANDROID)
	AMobileApplication oApplication(inCounter,inArguments);
	oResult = oApplication.mExecute(inCounter,inArguments);
#elif defined(Q_OS_MACOS)
	ADesktopApplication oApplication(inCounter,inArguments);
	oResult = oApplication.mExecute(inCounter,inArguments);
#else

#endif

	return oResult;
}
