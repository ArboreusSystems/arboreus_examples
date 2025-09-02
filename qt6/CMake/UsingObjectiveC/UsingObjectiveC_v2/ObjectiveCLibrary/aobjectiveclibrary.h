// ----------------------------------------------------------
/*!
	\headerfile AObjectiveCLibrary
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 02/09/2025 at 10:30:57
	\endlist
*/
// ----------------------------------------------------------

#ifndef AOBJECTIVECLIBRARY_H
#define AOBJECTIVECLIBRARY_H

// Precompiled includes

// System includes

// Application includes

// Classes
class QObect;
class AObjectiveCWrapper;


// Class definition
class AObjectiveCLibrary: public QObject {

	Q_OBJECT

	public:

		explicit AObjectiveCLibrary(QObject* parent = nullptr);
		virtual ~AObjectiveCLibrary(void);

		QString mGetText(void);

	private:

		AObjectiveCWrapper* pWrapper = nullptr;
};

#endif // AOBJECTIVECLIBRARY_H
