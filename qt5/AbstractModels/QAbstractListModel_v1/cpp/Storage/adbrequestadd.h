// ----------------------------------------------------------
/*!
	\headerfile ADBRequestAdd
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 21/08/2021 at 20:38:04
	\endlist
*/
// ----------------------------------------------------------

#ifndef ADBREQUESTADD_H
#define ADBREQUESTADD_H

// System includes
#include <QObject>

// Application includes
#include <athreadobjecttemplate.h>
#include <aloggerglobal.h>
#include <adbsqlcipher.h>
#include <astoragedatamodels.h>

// Constants and definitions

// Namespace

// Class definitions
class ADBRequestAdd : public AThreadObjectTemplate {

	Q_OBJECT

	public:

		QVariantList pResult = {};
		ADBRequestAddModel pModel = ADBRequestAddModel();

		explicit ADBRequestAdd(
			ADBSqlCipher* inDB = nullptr,
			QObject* parent = nullptr
		);
		virtual ~ADBRequestAdd(void);

	public slots:

		void slRun(void);

	private:

		ADBSqlCipher* pDB = nullptr;
};

#endif // ADBREQUESTADD_H
