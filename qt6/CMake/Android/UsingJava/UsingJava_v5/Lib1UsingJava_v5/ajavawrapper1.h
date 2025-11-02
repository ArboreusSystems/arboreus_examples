// ----------------------------------------------------------
/*!
	\headerfile AJavaWrapper
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 31/08/2025 at 23:01:15
	\endlist
*/
// ----------------------------------------------------------
#ifndef AJAVAWRAPPER1_H
#define AJAVAWRAPPER1_H

// Precompiled includes
#include <alib1usingjava_v5_pch.h>

// System includes

// Application includes
#include <aloggerglobal.h>

// Namesapces

// Constants and definitions


// Class definitions
class AJavaWrapper1 : public QObject {

	Q_OBJECT

	public:

		explicit AJavaWrapper1(QObject* parent = nullptr);
		virtual ~AJavaWrapper1(void);

	public slots:

		int mTest(int inInteger);

	private:

		const char* pNameJavaClass = "systems/arboreus/AJavaPackage1/AJavaClass1";
		QJniEnvironment* pJNIEnvironment = nullptr;
};

#endif // AJAVAWRAPPER1_H
