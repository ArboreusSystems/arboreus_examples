// ----------------------------------------------------------
/*!
	\headerfile
	\title
	\brief Template file files/cppheader/file.h

	\list
		\li @notice Template file classes/file.h
		\li @copyright Arboreus (http://arboreus.systems)
		\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
		\li @created 09/08/2019 at 12:37:28
	\endlist
*/
// ----------------------------------------------------------

#ifndef SUBSCRIPTION_H
#define SUBSCRIPTION_H

#include <QObject>
#include "aglobal.h"

class Subscription : public QObject {

	Q_OBJECT

	public:
		explicit Subscription(QObject *parent);
		virtual ~Subscription(void);
		void mGetProduct(void);
};

#endif // SUBSCRIPTION_H
