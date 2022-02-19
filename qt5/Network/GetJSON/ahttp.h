// ----------------------------------------------------------
/*!
	\headerfile AHttp
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 23/12/2019 at 22:59:16
	\endlist
*/
// ----------------------------------------------------------
#ifndef AHTTP_H
#define AHTTP_H

// System includes
#include <QObject>
#include <QNetworkAccessManager>
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QJsonDocument>
#include <QUrl>
#include <QString>
#include <QByteArray>
#include <QDebug>

// Application includes
#include "aglobal.h"

// Constants and definitions


// Class definitions
class AHttp : public QObject {

	Q_OBJECT

	public:

		explicit AHttp(QObject *parent = nullptr);
		virtual ~AHttp(void);

		void mGetJson(QString inURL);

	private slots:

		void mReply(QNetworkReply* inReply);

	private:

		QNetworkAccessManager* pManager;
};

#endif // AHTTP_H
