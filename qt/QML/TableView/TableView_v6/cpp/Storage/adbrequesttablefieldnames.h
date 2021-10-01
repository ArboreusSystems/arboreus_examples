// ----------------------------------------------------------
/*!
	\headerfile ARequestTableFieldNames
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 30/09/2021 at 09:11:33
	\endlist
*/
// ----------------------------------------------------------

#ifndef ADBREQUESTTABLEFIELDNAMES_H
#define ADBREQUESTTABLEFIELDNAMES_H

// System includes
#include <QObject>

// Application includes
#include <athreadobjecttemplate.h>
#include <aloggerglobal.h>
#include <adbsqlcipher.h>

// Constants and definitions

// Namespace

// Class definitions
class ADBRequestTableFieldNames : public AThreadObjectTemplate {

	Q_OBJECT

	public:

		QVariantList pResult = {};

		explicit ADBRequestTableFieldNames(
			ADBSqlCipher* inDB,
			QObject* parent = nullptr
		);
		virtual ~ADBRequestTableFieldNames(void);

	public slots:

		void slRun(void);

	private:

		ADBSqlCipher* pDB = nullptr;
};

#endif // ADBREQUESTTABLEFIELDNAMES_H
