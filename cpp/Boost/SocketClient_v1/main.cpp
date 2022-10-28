/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file wizards/projects/plaincpp/main.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 28/10/2022 at 12:06:50
 * */// --------------------------------------------------------------

// System includes
#include <iostream>

// Precompiled includes
#include <mainpch.h>

// Application includes

// Namespace
using namespace std;
using namespace boost::asio;
using ip::tcp;
using std::string;
using std::cout;
using std::endl;

// Constants
#define A_UNUSED(inVariable) (void)inVariable;


// Console Application
int main(int inCounter, char* inArguments[]) {

	A_UNUSED(inCounter);
	A_UNUSED(inArguments);

	boost::asio::io_service oIOService;

	tcp::socket oSocket(oIOService);
	oSocket.connect(
		tcp::endpoint(
			boost::asio::ip::address::from_string("127.0.0.1"),
			1234
		)
	);

	const string oMessage = "Hello from Client!\n";
	boost::system::error_code oSystemError;

	boost::asio::write(oSocket,boost::asio::buffer(oMessage),oSystemError);

	if (!oSystemError) {
		cout << "Client sent hello message!" << endl;
	} else {
		cout << "send failed: " << oSystemError.message() << endl;
	}

	boost::asio::streambuf receive_buffer;
	boost::asio::read(oSocket,receive_buffer,boost::asio::transfer_all(),oSystemError);

	if (oSystemError && oSystemError != boost::asio::error::eof) {
		cout << "receive failed: " << oSystemError.message() << endl;
	} else {
		const char* data = boost::asio::buffer_cast<const char*>(receive_buffer.data());
		cout << data << endl;
	}

	return 0;
}
