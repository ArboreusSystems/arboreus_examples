// ----------------------------------------------------------
/*!
	\headerfile ADBRequestTableInfo
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 27/09/2021 at 18:00:18
	\endlist
*/
// ----------------------------------------------------------

#ifndef ADBREQUESTTABLEINFO_H
#define ADBREQUESTTABLEINFO_H

// System includes
#include <QObject>

// Application includes
#include <athreadobjecttemplate.h>
#include <aloggerglobal.h>
#include <adbsqlcipher.h>

// Constants and definitions

// Namespace

// Class definitions
class ADBRequestTableInfo : public AThreadObjectTemplate {

	Q_OBJECT

	public:

		QVariantList pResult = {};

		explicit ADBRequestTableInfo(
			ADBSqlCipher* inDB,
			QObject* parent = nullptr
		);
		virtual ~ADBRequestTableInfo(void);

	public slots:

		void slRun(void);

	private:

		ADBSqlCipher* pDB = nullptr;
};

#endif // ADBREQUESTTABLEINFO_H
