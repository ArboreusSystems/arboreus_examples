// ----------------------------------------------------------
/*!
    \headerfile ANifTest
    \title
    \brief Template file wizard/classes/cpp/file.h

    \list
    \li @notice Template file classes/file.h
    \li @copyright Arboreus (http://arboreus.systems)
    \li @author Alexandr Kirilov (http://alexandr.kirilov.me)
    \li @created 09/10/2023 at 16:06:14
    \endlist
*/
// ----------------------------------------------------------

#ifndef ANIFTEST_H
#define ANIFTEST_H

// System includes
#include <string>

// Application includes

// Constants and definitions

// Namespace
using namespace std;

// Class definitions
class ANifTest {


	public:

		ANifTest(void);
		virtual ~ANifTest(void);

		string mGetString();

	private:

		string pTestString = "Test string from CPP";
};

#endif // ANIFTEST_H
