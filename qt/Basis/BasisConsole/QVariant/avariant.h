// ----------------------------------------------------------
/*!
	\headerfile aVariant
	\title
	\brief Template file classes/cpp/file.h

	\list
		\li @notice Template file classes/file.h
		\li @copyright Arboreus (http://arboreus.systems)
		\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
		\li @created 09/08/2019 at 14:03:39
	\endlist
*/
// ----------------------------------------------------------

#ifndef AVARIANT_H
#define AVARIANT_H

// System includes
#include <QObject>
#include <QVariant>
#include <QVector>

// Application includes
#include <aglobal.h>


class aVariant : public QObject {

	Q_OBJECT

	public:
		explicit aVariant(QObject *parent = nullptr);
		virtual ~aVariant(void);
		void mDoTest(void);
};

#endif // AVARIANT_H
