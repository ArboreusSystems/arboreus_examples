// ----------------------------------------------------------
/*!
	\headerfile AKeyboard
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 09/07/2026 at 18:51:15
	\endlist
*/
// ----------------------------------------------------------
#ifndef AKEYBOARD_H
#define AKEYBOARD_H

// Precompiled includes
#include <main_pch.h>

// System includes

// Application includes
#include <alogger.h>

// Namesapces

// Constants and definitions

// Class definitions
class AKeyboard : public QObject {

	Q_OBJECT

	public:

		explicit AKeyboard(QObject *parent = nullptr);
		virtual ~AKeyboard(void);

	public slots:

		double mHeight(void);
};

#endif // AKEYBOARD_H
