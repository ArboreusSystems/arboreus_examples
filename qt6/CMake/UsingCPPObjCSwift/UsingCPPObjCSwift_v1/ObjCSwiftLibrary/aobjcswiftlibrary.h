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

#ifndef AOBJCSWIFTLIBRARY_H
#define AOBJCSWIFTLIBRARY_H

// Precompiled includes

// System includes

// Application includes

// Classes
class QObect;
class AObjectiveCWrapper;


// Class definition
class AObjCSwiftLibrary: public QObject {

	Q_OBJECT

	public:

		explicit AObjCSwiftLibrary(QObject* parent = nullptr);
		virtual ~AObjCSwiftLibrary(void);

		QString mGetText(void);
		QString mGetSwiftText(void);

	private:

		AObjectiveCWrapper* pWrapper = nullptr;
};

#endif // AOBJCSWIFTLIBRARY_H
