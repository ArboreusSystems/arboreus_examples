/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file wizards/projects/qtquickapplication/main.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 29/09/2022 at 13:14:05
 * */// --------------------------------------------------------------

// System includes
#include <QGuiApplication>
#include <QQmlApplicationEngine>

// Precompiled headers
#include <aasiopch.h>

// Application includes

// Constants
#define SCOPE_LOG() printf("%s\n",__PRETTY_FUNCTION__)

typedef std::shared_ptr<asio::io_service> io_service_ptr;
typedef std::shared_ptr<asio::ssl::context> ssl_context_ptr;


// Qt Quick Application
int main(int inCounter, char *inArguments[]) {

#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

	io_service_ptr io_service = std::make_shared<asio::io_service>() ;

	QGuiApplication oApplication(inCounter, inArguments);
	QQmlApplicationEngine oEngine;

	const QUrl oURL(QStringLiteral("qrc:/main.qml"));
	QObject::connect(
		&oEngine, &QQmlApplicationEngine::objectCreated,
		&oApplication, [oURL](QObject *obj, const QUrl &objUrl) {
			if (!obj && oURL == objUrl) {
				QCoreApplication::exit(-1);
			}
		}, Qt::QueuedConnection
	);
	oEngine.load(oURL);

	return oApplication.exec();
}
