// ----------------------------------------------------------
/*!
	\headerfile ATranslator
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 24/05/2020 at 18:11:15
	\endlist
*/
// ----------------------------------------------------------
#ifndef ATRANSLATOR_H
#define ATRANSLATOR_H

// System includes
#include <QObject>
#include <QGuiApplication>
#include <QTranslator>

// Application includes
#include "aglobal.h"

// Constants and definitions

// Class definitions
class ATranslator : public QObject {

	Q_OBJECT

	public:

		explicit ATranslator(QObject *parent = nullptr);
		virtual ~ATranslator(void);

	signals:

		void sgLanguageChanged();

	public slots:

		void mSetLanguage(QString inLanguageCode);

	private:

		QTranslator* pTranslator;
};

#endif // ATRANSLATOR_H
