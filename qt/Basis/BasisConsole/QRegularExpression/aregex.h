// ----------------------------------------------------------
/*!
	\headerfile
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 09/09/2019 at 19:01:43
	\endlist
*/
// ----------------------------------------------------------
#ifndef AREGEX_H
#define AREGEX_H

// System includes
#include <QObject>
#include <QRegularExpression>
#include <QRegularExpressionMatch>

// Application includes
#include "aglobal.h"


class aRegex : public QObject {

	Q_OBJECT

	public:
		explicit aRegex(QObject *parent = nullptr);
		virtual ~aRegex(void);
		void mDoTest(void);
};

#endif // AREGEX_H
