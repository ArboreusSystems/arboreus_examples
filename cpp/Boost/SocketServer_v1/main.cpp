/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file wizards/projects/plaincpp/main.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 28/10/2022 at 11:33:01
 * */// --------------------------------------------------------------

// System includes

// Precompiled includes
#include <mainpch.h>

// Application includes

// Namespace
using namespace boost::asio;
using ip::tcp;
using std::string;
using std::cout;
using std::endl;

// Constants
#define A_UNUSED(inVariable) (void)inVariable;

// Global functions

// -----------
/*!
	\fn

	Doc.
*/

string fRread(tcp::socket& inSocket) {

	boost::asio::streambuf oBuffer;
	boost::asio::read_until(inSocket,oBuffer,"\n");

	string oData = boost::asio::buffer_cast<const char*>(oBuffer.data());
	return oData;
}

// -----------
/*!
	\fn

	Doc.
*/

void fSend(tcp::socket& inSocket, const string& inMessage) {

	const string oMessage = inMessage + "\n";
	boost::asio::write(
		inSocket,
		boost::asio::buffer(oMessage)
	);
}


// Console Application
int main(int inCounter, char* inArguments[]) {

	A_UNUSED(inCounter);
	A_UNUSED(inArguments);

	boost::asio::io_service oIOService;
	tcp::acceptor oAcceptor(oIOService, tcp::endpoint(tcp::v4(),1234));
	tcp::socket oSocket(oIOService);
	oAcceptor.accept(oSocket);

	string message = fRread(oSocket);
	std::cout << message << std::endl;

	fSend(oSocket, "Hello From Server!");
	std::cout << "Server sent message Client!" << std::endl;

	return 0;
}
