// ----------------------------------------------------------
/*!
	\headerfile ADBRequestAllOrdered
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 31/10/2021 at 13:17:26
	\endlist
*/
// ----------------------------------------------------------

#ifndef ADBREQUESTALLORDERED_H
#define ADBREQUESTALLORDERED_H

// System includes
#include <QObject>

// Application includes
#include <athreadobjecttemplate.h>
#include <aloggerglobal.h>
#include <adbsqlcipher.h>

// Constants and definitions

// Namespace

// Class definitions
class ADBRequestAllOrdered : public AThreadObjectTemplate {

	Q_OBJECT

	public:

		QVariantList pResult = {};

		explicit ADBRequestAllOrdered(
			QString inFiledName,
			_A_ENUM_DB_SORTING_DIRECTION inDirection,
			ADBSqlCipher* inDB = nullptr,
			QObject* parent = nullptr
		);
		virtual ~ADBRequestAllOrdered(void);

	public slots:

		void slRun(void);

	private:

		ADBSqlCipher* pDB = nullptr;
		QString pFieldName = "NoFieldName";
		_A_ENUM_DB_SORTING_DIRECTION pDirection;
};

#endif // ADBREQUESTALLORDERED_H
