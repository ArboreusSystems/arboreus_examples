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

	if (inCounter != 4) {
		_A_DEBUG << "Wrong parameter\n" << "Example usage ./client 127.0.0.1 1234 hello";
		return -1;
	}

	auto const oAddress = boost::asio::ip::make_address(inArguments[1]);
	auto const oPort = std::atoi(inArguments[2]);
	std::string oMessage = inArguments[3];

	oMessage = oMessage + '\n';

	boost::asio::io_service oIOService;
	boost::asio::ip::tcp::socket oSocket(oIOService);
	boost::system::error_code oErrorCode;

	oSocket.connect(
		boost::asio::ip::tcp::endpoint(oAddress,oPort),
		oErrorCode
	);

	if (oErrorCode) {
		_A_DEBUG << oErrorCode.message().c_str();
		return 1;
	}

	boost::system::error_code oError;
	boost::asio::write(oSocket,boost::asio::buffer(oMessage),oError);

	if(oError) {
		_A_DEBUG << "send failed: " << oError.message().c_str();
	}

	boost::asio::streambuf oReceiveBuffer;
	boost::asio::read(oSocket, oReceiveBuffer,boost::asio::transfer_all(),oError);
	if (oError && oError != boost::asio::error::eof) {
		_A_DEBUG << "receive failed: " << oError.message().c_str();
	} else {
		const char* oData = boost::asio::buffer_cast<const char*>(oReceiveBuffer.data());
		_A_DEBUG << oData;
	}

	return 0;
}
