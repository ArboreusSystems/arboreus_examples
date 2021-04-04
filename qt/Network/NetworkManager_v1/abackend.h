// ----------------------------------------------------------
/*!
	\headerfile ABackend
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 02/04/2021 at 16:34:49
	\endlist
*/
// ----------------------------------------------------------

#ifndef ABACKEND_H
#define ABACKEND_H

// System includes
#include <QObject>
#include <QEventLoop>

// Application includes
#include <athreadobjectcontrollertemplate.h>
#include <aproperties.h>
#include <alogger.h>
#include <anetwork.h>

// Constants and definitions

// Namespace

// Class definitions
class ABackend : public QObject {

	Q_OBJECT

	public:

		AProperties* pProperties = nullptr;
		ALogger* pLogger = nullptr;
		ANetwork* pNetwork = nullptr;

		static ABackend& mInstance(void);
		void mInit(void);

	private:

		explicit ABackend(QObject* parent = nullptr);
		virtual ~ABackend(void);
		Q_DISABLE_COPY(ABackend)

		void mRegisterProperties(void);
		void mRegisterLogger(void);
		void mRegisterNetwork(void);
};

#endif // ABACKEND_H
