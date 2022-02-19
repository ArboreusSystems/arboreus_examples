// ----------------------------------------------------------
/*!
	\headerfile Backend
	\title
	\brief Template file classes/cpp/file.h

	\list
		\li @notice Template file classes/file.h
		\li @copyright Arboreus (http://arboreus.systems)
		\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
		\li @created 21/08/2019 at 08:33:50
	\endlist
*/
// ----------------------------------------------------------

#ifndef BACKEND_H
#define BACKEND_H


// System includes
#include <QObject>

// Application includes



class Backend : public QObject {

	Q_OBJECT

	public:
		explicit Backend(QObject *parent = nullptr);
		virtual ~Backend(void);
		void mTestMethod(void);
		uint mTestUint(void);
};

#endif // BACKEND_H
