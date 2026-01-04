/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file tablemodel.h
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 04/01/2026 at 11:17:08
 * */// --------------------------------------------------------------


// Precompiled includes
#include <main_pch.h>

// System includes

// Application includes
#include <alogger.h>
#include <aenumtype1.h>


// Qt Quick Application
int main(int inCounter, char *inArguments[]) {

	QGuiApplication oApplication(inCounter, inArguments);
	QQmlApplicationEngine oEngine;

	qmlRegisterUncreatableMetaObject(
		AEnumType1::staticMetaObject,
		"AEnums", 1, 0,
		"AEnumType1",
		"Can't create AEnumType1"
	);

	_A_DEBUG << "C++ enum AEnumType1::Type1::Zero:" << AEnumType1::Type1::Zero;
	_A_DEBUG << "C++ enum AEnumType1::Type1::One:" << AEnumType1::Type1::One;
	_A_DEBUG << "C++ enum AEnumType1::Type1::Two:" << AEnumType1::Type1::Two;
	_A_DEBUG << "C++ enum AEnumType1::Type1::Three:" << AEnumType1::Type1::Three;

	const QUrl oURL = QUrl(QStringLiteral("qrc:/Main.qml"));
	QObject::connect(
		&oEngine, &QQmlApplicationEngine::objectCreationFailed,
		&oApplication, []() {
			QCoreApplication::exit(-1);
		},
		Qt::QueuedConnection
	);
	oEngine.load(oURL);

	return oApplication.exec();
}
