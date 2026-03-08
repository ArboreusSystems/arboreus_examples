/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file tablemodel.h
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 08/03/2026 at 18:13:22
 * */// --------------------------------------------------------------


// Precompiled includes
#include <main_pch.h>

// System includes

// Application includes


// Qt Quick Application
int main(int inCounter, char *inArguments[]) {

	QGuiApplication oApplication(inCounter, inArguments);
	QQmlApplicationEngine oEngine;

	QString oLocale = QLocale::system().name().split("_").first();
	QString oLocaleFile = QString(":/Translations/UsingMultilanguage_v1_%1.qm").arg(oLocale);
	qDebug() << "LocaleFile:" << oLocaleFile;

	QTranslator oTranslator;
	if (oTranslator.load(oLocaleFile)) {
		oApplication.installTranslator(&oTranslator);
		qDebug() << "Translation for" << oLocale << "loaded";
	} else {
		qDebug() << "Translation for" << oLocale << "not loaded";
	}

	const QUrl oURL = QUrl(QStringLiteral("qrc:/Main.qml"));
	QObject::connect(
		&oEngine,&QQmlApplicationEngine::objectCreationFailed,
		&oApplication, []() {
			QCoreApplication::exit(-1);
		},
		Qt::QueuedConnection
	);
	oEngine.load(oURL);

	return oApplication.exec();
}
