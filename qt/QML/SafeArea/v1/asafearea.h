// ----------------------------------------------------------
/*!
	\headerfile ASafeArea
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 08/08/2020 at 16:00:33
	\endlist
*/
// ----------------------------------------------------------

#ifndef ASAFEAREA_H
#define ASAFEAREA_H

// System includes
#include <QObject>

// Application includes
#include "asafeareainsets.h"
#include "asafeareaios.h"

// Constants and definitions

// Namespace


// Class definitions
class ASafeArea : public QObject {

	Q_OBJECT

	public:

		explicit ASafeArea(QObject *parent = nullptr);
		virtual ~ASafeArea(void);

		ASafeAreaInsets* mGetInsets(void);

	public slots:

		QVariantMap mInsets(void);
};

#endif // ASAFEAREA_H
