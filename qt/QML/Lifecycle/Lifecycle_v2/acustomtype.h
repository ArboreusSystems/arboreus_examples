// ----------------------------------------------------------
/*!
	\headerfile ACustomType
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 19/09/2020 at 12:47:07
	\endlist
*/
// ----------------------------------------------------------

#ifndef ACUSTOMTYPE_H
#define ACUSTOMTYPE_H

// System includes
#include <QObject>

// Application includes
#include "alogger.h"

// Constants and definitions

// Namespace

// Class definitions
class ACustomType : public QObject {

	Q_OBJECT

	public:

		explicit ACustomType(QObject *parent = nullptr);
		virtual ~ACustomType(void);

	public slots:

		void mAction(void);

	signals:

		void sgStep1(void);
		void sgStep2(void);
		void sgStep3(void);

	private:

		void mStep1(void);
		void mStep2(void);
		void mStep3(void);
};

#endif // ACUSTOMTYPE_H
