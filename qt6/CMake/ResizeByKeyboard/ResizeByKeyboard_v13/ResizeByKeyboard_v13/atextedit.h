// ----------------------------------------------------------
/*!
	\headerfile ATextArea
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 02/07/2026 at 08:54:49
	\endlist
*/
// ----------------------------------------------------------
#ifndef ATEXTEDIT_H
#define ATEXTEDIT_H

// Precompiled includes
#include <main_pch.h>

// System includes

// Application includes
#include <alogger.h>

// Namesapces

// Constants and definitions

// Class definitions
class ATextEdit : public QQuickTextEdit {

	Q_OBJECT
	QML_ELEMENT

	public:

		explicit ATextEdit(QQuickItem* parent = nullptr);
		virtual ~ATextEdit(void);

	protected:

		bool eventFilter(QObject* inWatched, QEvent* inEvent);
};

#endif // ATEXTEDIT_H
