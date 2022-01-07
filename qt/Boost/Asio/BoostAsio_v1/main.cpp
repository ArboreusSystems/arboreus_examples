/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file wizards/projects/qtquickapplication/main.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 10/12/2021 at 19:06:13
 * */// --------------------------------------------------------------

// System includes
#include <QGuiApplication>
#include <QQmlApplicationEngine>

// Application includes
#include <boost/asio.hpp>
#include <chrono>
#include <iostream>
#include <ostream>
#include <string>

// Namespaces
//using namespace boost::asio;

// Constants

// Definitions
typedef boost::asio::ip::tcp _A_TCP;

boost::asio::streambuf reqBuf, respBuf;
std::ostream reqStream(&reqBuf);
_A_TCP::socket* psock;

// Global functions
void SendRequest(std::string s){
	reqStream<<s<<"\r\n";
	boost::asio::write(*psock, reqBuf);
}

void PrintResponse(){
	boost::asio::read_until(*psock, respBuf, "\r\n");
	std::cout<<&respBuf;
}

// Qt Quick Application
int main(int inCounter, char *inArguments[]) {

#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

	QGuiApplication oApplication(inCounter, inArguments);
	QQmlApplicationEngine oEngine;

//try{
		std::string server="pop3.mail.ru"; // почтовый сервер mail.ru
		boost::asio::io_service io;
		_A_TCP::resolver resolver(io);
		_A_TCP::resolver::query q(server, "pop3");
		_A_TCP::resolver::iterator it = resolver.resolve(q);
		_A_TCP::resolver::iterator endit;
		_A_TCP::socket sock(io);
		psock=&sock;
		boost::system::error_code err = boost::asio::error::host_not_found;
		while (err && it != endit){
			sock.close();
			sock.connect(*it++, err);
		}
		if (err) throw boost::system::system_error(err);
		PrintResponse();
		SendRequest("bogong");// где myname-логин
		PrintResponse();
		SendRequest("1508Fktrcfylhmail");//mypassword-пароль
		PrintResponse();
		SendRequest("stat");
		PrintResponse();
		SendRequest("quit");
		PrintResponse();
		sock.shutdown(_A_TCP::socket::shutdown_both);
		sock.close();
//	}
//	catch (std::exception& e){
//		char buf[512];
//        CharToOem(e.what(), buf);
//		std::cout << "Exception: " << buf << e.what() << "\n";
//	}

//	io_service ioservice;

//	steady_timer timer1{ioservice, std::chrono::seconds{3}};
//	timer1.async_wait([](const boost::system::error_code &ec){
//		std::cout << "3 sec\n";
//	});

//	steady_timer timer2{ioservice, std::chrono::seconds{4}};
//	timer2.async_wait([](const boost::system::error_code &ec){
//		std::cout << "4 sec\n";
//	});

//	ioservice.run();

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
