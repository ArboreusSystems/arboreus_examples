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
#ifndef AJAVAWRAPPER_H
#define AJAVAWRAPPER_H

// Precompiled includes
#include <alibusingjava_v2_pch.h>

// System includes

// Application includes
#include <aloggerglobal.h>

// Namesapces

// Constants and definitions


// Class definitions
class AJavaWrapper : public QObject {

	Q_OBJECT

	public:

		explicit AJavaWrapper(QObject* parent = nullptr);
		virtual ~AJavaWrapper(void);

	public slots:

		int mTest(int inInteger);

	private:

		const char* pNameJavaClass = "systems/arboreus/AJavaPackage/AJavaClass";
		QJniEnvironment* pJNIEnvironment = nullptr;
};

#endif // AJAVAWRAPPER_H
