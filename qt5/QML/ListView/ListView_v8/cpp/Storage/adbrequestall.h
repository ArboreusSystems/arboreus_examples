// ----------------------------------------------------------
/*!
	\headerfile ADBRequestGetAll
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 21/08/2021 at 19:27:59
	\endlist
*/
// ----------------------------------------------------------

#ifndef ADBREQUESTALL_H
#define ADBREQUESTALL_H

// System includes
#include <QObject>

// Application includes
#include <athreadobjecttemplate.h>
#include <aloggerglobal.h>
#include <adbsqlcipher.h>

// Constants and definitions

// Namespace

// Class definitions
class ADBRequestAll : public AThreadObjectTemplate {

	Q_OBJECT

	public:

		QVariantList pResult = {};

		explicit ADBRequestAll(
			ADBSqlCipher* inDB = nullptr,
			QObject* parent = nullptr
		);
		virtual ~ADBRequestAll(void);

	public slots:

		void slRun(void);

	private:

		ADBSqlCipher* pDB = nullptr;
};

#endif // ADBREQUESTALL_H
