// ----------------------------------------------------------
/*!
	\headerfile ASafeAreaInsets
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 08/08/2020 at 16:04:22
	\endlist
*/
// ----------------------------------------------------------

#ifndef ASAFEAREAINSETS_H
#define ASAFEAREAINSETS_H

// System includes
#include <QObject>
#include <QVariantMap>

// Application includes
#include "alogger.h"

// Constants and definitions

// Namespace


// Class definitions
class ASafeAreaInsets : public QObject {

	Q_OBJECT

	public:

		int pTop = 0;
		int pBottom = 0;
		int pLeft = 0;
		int pRight = 0;

		explicit ASafeAreaInsets(QObject *parent = nullptr);
		virtual ~ASafeAreaInsets(void);

	public slots:

		QVariantMap mToVariantMap(void);

};

#endif // ASAFEAREAINSETS_H
