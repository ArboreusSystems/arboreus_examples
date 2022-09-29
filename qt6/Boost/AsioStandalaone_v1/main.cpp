/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file wizards/projects/qtquickapplication/main.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 29/09/2022 at 07:42:21
 * */// --------------------------------------------------------------

// System includes
#include <QGuiApplication>
#include <QQmlApplicationEngine>

// Precompiled headers
#include <aasiopch.h>

// Application includes

// Constants


// Qt Quick Application
int main(int inCounter, char *inArguments[]) {

#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

	QGuiApplication oApplication(inCounter, inArguments);
	QQmlApplicationEngine oEngine;

	asio::error_code oErrorCode;
	asio::io_context oIOContext;
	asio::ip::tcp::endpoint oEndpoint(
		asio::ip::make_address("93.184.216.34",oErrorCode),
		80
	);

	asio::ip::tcp::socket oSocket(oIOContext);
	oSocket.connect(oEndpoint,oErrorCode);

	if (!oErrorCode) {
		std::cout << "Connected" << std::endl;
	} else {
		std::cout << "Failed\n" << oErrorCode.message() << std::endl;
	}

	if (oSocket.is_open()) {

		std::string oRequest = \
			"GET /index.html HTTP/1.1\r\n" \
			"Host: example.com\r\n" \
			"Connection: close\r\n\r\n";

		oSocket.write_some(
			asio::buffer(oRequest.data(),oRequest.size()),
			oErrorCode
		);

		using namespace std::chrono_literals;
		std::this_thread::sleep_for(2000ms);

		size_t oBytes = oSocket.available();
		std::cout << "Bytes available: " << oBytes << std::endl;

		if (oBytes > 0) {
			std::vector<char> oBuffer(oBytes);
			oSocket.read_some(asio::buffer(oBuffer.data(),oBuffer.size()),oErrorCode);
			for (auto iChar : oBuffer) {
				std::cout << iChar;
			}
		} else {
			std::cout << "Bytes equal 0" << std::endl;
		}

	} else {
		std::cout << "Socked not opened\n" << std::endl;
	}

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
