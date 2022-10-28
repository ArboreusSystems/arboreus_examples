/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file wizards/projects/qtquickapplication/main.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 28/10/2022 at 06:31:46
 * */// --------------------------------------------------------------

// System includes

// Precompiled includes
#include <mainpch.h>

// Application includes
#include <aloggerglobal.h>

// Constants and definitions
#define _A_TYPE_TCP boost::asio::ip::tcp

// Namespaces


// Console application
int main(int inCounter, char* inArguments[]) {

	QCoreApplication oCore(inCounter, inArguments);

	qInstallMessageHandler(fLoggerMessageHandler);

	auto const oAddress = boost::asio::ip::make_address("127.0.0.1");
	auto const oPort = static_cast<unsigned short>(std::atoi("8083"));

	boost::asio::io_context oIOContext{1};
	_A_TYPE_TCP::acceptor oAcceptor{oIOContext, {oAddress,oPort}};

	while (1) {

		_A_TYPE_TCP::socket oSocket(oIOContext);
		oAcceptor.accept(oSocket);
		_A_DEBUG << "Socket accepted";

		std::thread{[lQueue{std::move(oSocket)}](){

			boost::beast::websocket::stream<_A_TYPE_TCP::socket> oWebSocket{
				std::move(const_cast<_A_TYPE_TCP::socket&>(lQueue))
			};
			oWebSocket.accept();

			while (1) {

				try {

					boost::beast::flat_buffer oBuffer;
					oWebSocket.read(oBuffer);
					std::string oOut = boost::beast::buffers_to_string(oBuffer.cdata());
					_A_DEBUG << oOut.c_str();

					oWebSocket.write(oBuffer.data());

				} catch (boost::beast::system_error const& inSystemError) {

					if (inSystemError.code() != boost::beast::websocket::error::closed) {
						_A_CRITICAL << inSystemError.code().message().c_str();
						break;
					}
				}
			}
		}}.detach();
	}

	return oCore.exec();
}
