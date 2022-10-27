/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file wizards/projects/qtquickapplication/main.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 27/10/2022 at 20:37:16
 * */// --------------------------------------------------------------

// System includes

// Precompiled includes
#include <mainpch.h>

// Application includes
#include <aloggerglobal.h>

// Constants

// Qt Quick Application
int main(int inCounter, char* inArguments[]) {

	if (inCounter != 3) {
		_A_DEBUG << "Wrong parameters\n" << "Example usage 127.0.0.1 1234";
		return -1;
	}

	auto const oAddress = boost::asio::ip::make_address(inArguments[1]);
	auto const oPort = std::atoi(inArguments[2]);

	boost::asio::io_service oIOService;

	boost::system::error_code oErrorCode;
	boost::asio::ip::tcp::acceptor oAcceptor(
		oIOService,
		boost::asio::ip::tcp::endpoint(oAddress, oPort )
	);
	boost::asio::ip::tcp::socket oSsocket(oIOService);
	oAcceptor.accept(oSsocket);

	boost::asio::streambuf oBuffer;

	boost::asio::read_until(oSsocket,oBuffer,"\n",oErrorCode);

	if (oErrorCode) {
		_A_DEBUG << oErrorCode.message().c_str();
		return 1;
	}

	std::string oData = boost::asio::buffer_cast<const char*>(oBuffer.data());
	_A_DEBUG << oData.c_str();

	boost::asio::write(oSsocket,boost::asio::buffer(oData),oErrorCode);

	if (oErrorCode) {
		_A_DEBUG << oErrorCode.message().c_str();
		return 1;
	}

	return 0;
}
