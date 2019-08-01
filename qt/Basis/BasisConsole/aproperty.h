// ----------------------------------------------------------
/*!
	\headerfile aProperty
	\title
	\brief Template file classes/cpp/file.h

	\list
		\li @notice Template file classes/file.h
		\li @copyright Arboreus (http://arboreus.systems)
		\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
		\li @created 01/08/2019 at 14:57:05
	\endlist
*/
// ----------------------------------------------------------

#ifndef APROPERTY_H
#define APROPERTY_H

// System includes
#include <QObject>

// Application includes
#include "aglobal.h"


class aProperty : public QObject {

	Q_OBJECT

	Q_PROPERTY(QString pStringRO READ mGetStringRO)
	Q_PROPERTY(QString pStringRW READ mGetStringRW WRITE mSetStringRW)

	private:
		QString *pTestStringRO;
		QString *pTestStringRW;
		QString mGetStringRO(void);
		QString mGetStringRW(void);
		void mSetStringRW(QString inString);

	public:
		explicit aProperty(QObject *parent = nullptr);
		virtual ~aProperty(void);


	signals:

	public slots:

};

#endif // APROPERTY_H
