// ----------------------------------------------------------
/*!
	\headerfile
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 08/08/2020 at 17:18:30
	\endlist
*/
// ----------------------------------------------------------
#ifndef ASAFEAREAIOS_H
#define ASAFEAREAIOS_H

// System includes
#include <QObject>

// Application includes
#include "alogger.h"
#include "asafeareainsets.h"

// Constants and defintions

// Namespace


class ASafeAreaIOS : public QObject {

	Q_OBJECT

	public:

		explicit ASafeAreaIOS(QObject *parent = nullptr);
		virtual ~ASafeAreaIOS(void);

		static ASafeAreaInsets* mGetInsets(void);
};

#endif // ASAFEAREAIOS_H
