// ----------------------------------------------------------
/*!
    \headerfile ARustWrapper
    \title
    \brief Template file wizard/classes/cpp/file.h

    \list
    \li @notice Template file classes/file.h
    \li @copyright Arboreus (http://arboreus.systems)
    \li @author Alexandr Kirilov (http://alexandr.kirilov.me)
    \li @created 07/01/2024 at 17:35:47
    \endlist
*/
// ----------------------------------------------------------

#ifndef ARUSTWRAPPER_H
#define ARUSTWRAPPER_H

// System includes
#include <QObject>
#include <QDebug>

// Application includes
#include <UsingRust_v1.h>

// Constants and definitions

// Namespace

// Class definitions
class ARustWrapper : public QObject {

	Q_OBJECT

	public:

		explicit ARustWrapper(QObject* parent = nullptr);
		virtual ~ARustWrapper(void);

	public slots:

		QString mStringFromLibrary(void);
};

#endif // ARUSTWRAPPER_H
