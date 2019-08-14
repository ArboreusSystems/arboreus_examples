// ----------------------------------------------------------
/*!
	\headerfile Subscription
	\title
	\brief Template file classes/cpp/file.h

	\list
		\li @notice Template file classes/file.h
		\li @copyright Arboreus (http://arboreus.systems)
		\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
		\li @created 14/08/2019 at 13:30:14
	\endlist
*/
// ----------------------------------------------------------

#ifndef SUBSCRIPTION_H
#define SUBSCRIPTION_H

// System includes
#include <QObject>

// Application includes
#include "aglobal.h"
#include "SubscriptionBackend.hpp"


class Subscription : public QObject {

	Q_OBJECT

	public:
		Subscription(void);
		virtual ~Subscription(void);
		void mGetProduct(void);
};

#endif // SUBSCRIPTION_H
