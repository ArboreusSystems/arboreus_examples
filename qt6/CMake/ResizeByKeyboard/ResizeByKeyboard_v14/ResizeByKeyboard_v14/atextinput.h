// ----------------------------------------------------------
/*!
	\headerfile ATextInput
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 01/07/2026 at 21:29:33
	\endlist
*/
// ----------------------------------------------------------
#ifndef ATEXTINPUT_H
#define ATEXTINPUT_H

// Precompiled includes
#include <main_pch.h>

// System includes

// Application includes
#include <alogger.h>

// Namesapces

// Constants and definitions

// Class definitions
class ATextInput : public QQuickTextInput {

	Q_OBJECT
	QML_ELEMENT

	public:

		explicit ATextInput(QQuickItem* parent = nullptr);
		virtual ~ATextInput(void);

	protected:

		bool eventFilter(QObject* inWatched,QEvent* inEvent) override;
};

#endif // ATEXTINPUT_H
