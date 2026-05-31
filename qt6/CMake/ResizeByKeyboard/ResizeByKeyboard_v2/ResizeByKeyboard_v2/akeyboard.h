// ----------------------------------------------------------
/*!
	\headerfile AKeyboard
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 31/05/2026 at 16:52:14
	\endlist
*/
// ----------------------------------------------------------
#ifndef AKEYBOARD_H
#define AKEYBOARD_H

// System includes
#include <QObject>

// Application includes
#include <akeyboardeventfilter.h>

// Namesapces

// Constants and definitions

// Class definitions
class AKeyboard : public QObject {

		Q_OBJECT

	public:

		explicit AKeyboard(QObject *parent = nullptr);
		virtual ~AKeyboard(void);

		Q_INVOKABLE void disableKeyboardScroll(QQuickItem *item);

};

#endif // AKEYBOARD_H
