// ----------------------------------------------------------
/*!
	\headerfile AKeyboardEventFilter
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 31/05/2026 at 15:02:12
	\endlist
*/
// ----------------------------------------------------------
#ifndef AKEYBOARDEVENTFILTER_H
#define AKEYBOARDEVENTFILTER_H

// Precompiled includes
#include <main_pch.h>

// System includes

// Application includes

// Namesapces

// Constants and definitions

// Class definitions
class AKeyboardEventFilter : public QObject {

	Q_OBJECT

	public:

		explicit AKeyboardEventFilter(QObject* parent = nullptr);
		virtual ~AKeyboardEventFilter(void);

	protected:

		bool eventFilter(QObject* inObject,QEvent* inEvent) override;
};

#endif // AKEYBOARDEVENTFILTER_H
