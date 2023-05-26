// ----------------------------------------------------------
/*!
	\class ABackend
	\title
	\brief

	\list
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 24/05/2023 at 18:38:45
	\endlist
*/
// ----------------------------------------------------------

#ifndef ABACKEND_H
#define ABACKEND_H

// System includes

// Precompiled includes
#include <abackendpch.h>

// Application includes
#include <aloggerglobal.h>

// Constants and definitions

// Namespace

// Class definitions
class ABackend : public QObject {

	Q_OBJECT

	public:

		explicit ABackend(QObject* parent = nullptr);
		virtual ~ABackend(void);
};

#endif // ABACKEND_H
