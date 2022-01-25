// ----------------------------------------------------------
/*!
	\headerfile
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 23/01/2022 at 20:58:34
	\endlist
*/
// ----------------------------------------------------------
#ifndef ASMTPDATAMODELS_H
#define ASMTPDATAMODELS_H

// System includes
#include <QString>
#include <QVariantMap>

// Application includes

// Constants and defintions

// Namespace

class ASMTPProperties {

public:

	QString User = "NoDefinedUser";
	QString Password = "NoDefinedPassword";
	QString ServerName = "NoDefinedServerName";
	int	Port = 0;

	explicit ASMTPProperties(void) {}
	virtual ~ASMTPProperties(void) {}


	QVariantMap mToVariantMap(void) {

		QVariantMap oOutput;
		oOutput.insert("User",User);
		oOutput.insert("Password",Password);
		oOutput.insert("ServerName",ServerName);
		oOutput.insert("Port",Port);
		return oOutput;
	}

	void mFromVariantMap(QVariantMap inMap) {

		QString oErrorValue = "ErrorNoValue";

		QString oUser = qvariant_cast<QString>(inMap.value("User",oErrorValue));
		if (QString::compare(oUser,oErrorValue) != 0) this->User = oUser;

		QString oPassword = qvariant_cast<QString>(inMap.value("Password",oErrorValue));
		if (QString::compare(oPassword,oErrorValue) != 0) this->Password = oPassword;

		QString oServerName = qvariant_cast<QString>(inMap.value("ServerName",oErrorValue));
		if (QString::compare(oServerName,oErrorValue) != 0) this->ServerName = oServerName;

		QString oPort = qvariant_cast<QString>(inMap.value("Port",oErrorValue));
		if (QString::compare(oUser,oErrorValue) != 0) this->Port = oPort.toInt();
	}
};

Q_DECLARE_METATYPE(ASMTPProperties)


#endif // ASMTPDATAMODELS_H
