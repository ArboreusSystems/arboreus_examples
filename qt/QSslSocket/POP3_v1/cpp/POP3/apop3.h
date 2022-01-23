// ----------------------------------------------------------
/*!
	\headerfile APOP3
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 13/01/2022 at 09:14:36
	\endlist
*/
// ----------------------------------------------------------

#ifndef APOP3_H
#define APOP3_H

// System includes
#include <string>

// Application includes
#include <asslsockettemplate.h>
#include <apop3datamodels.h>

// Constants and definitions

// Namespace
using namespace std;


// Class definitions
class APOP3 : public ASSLSocketTemplate {

	Q_OBJECT

	public:

		explicit APOP3(APOP3Properties* inProperties, QObject* parent = nullptr);
		virtual ~APOP3(void);

		void mInit(void) override;
		void mLogin(void);

	signals:

	private:

		APOP3Properties* pProperties = nullptr;
};

#endif // APOP3_H
