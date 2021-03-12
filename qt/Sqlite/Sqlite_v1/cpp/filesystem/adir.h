// ----------------------------------------------------------
/*!
	\headerfile
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 17/09/2019 at 12:38:40
	\endlist
*/
// ----------------------------------------------------------
#ifndef ADIR_H
#define ADIR_H

// System includes
#include <QObject>
#include <QDir>

// Application includes
#include "cpp/global/aglobal.h"


class aDir : public QObject {

	Q_OBJECT

	public:
		explicit aDir(QObject *parent = nullptr);
		virtual ~aDir(void);

		static bool mEnsure(QString inPath);
};

#endif // ADIR_H
