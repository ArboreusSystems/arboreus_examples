// ----------------------------------------------------------
/*!
	\headerfile %{CN}
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 02/09/2025 at 11:43:52
	\endlist
*/
// ----------------------------------------------------------

#ifndef AOBJECTIVECWRAPPER_H
#define AOBJECTIVECWRAPPER_H

// Precompiled includes

// System includes

// Application includes

// Constants and defintions

// Classes
class QObject;
class QString;


// Class definitions
class AObjectiveCWrapper: public QObject {

	Q_OBJECT

	public:

		explicit AObjectiveCWrapper(QObject* parent = nullptr);
		virtual ~AObjectiveCWrapper(void);

		QString mGetText(void);
};

#endif // AOBJECTIVECWRAPPER_H
