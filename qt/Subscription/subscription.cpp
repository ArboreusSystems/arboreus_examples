// ----------------------------------------------------------
/*!
	\class Subscription
	\title
	\brief Template file classes/cpp/file.cpp

	\list
		\li @notice Template file classes/file.h
		\li @copyright Arboreus (http://arboreus.systems)
		\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
		\li @created 14/08/2019 at 13:30:14
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "subscription.h"


// -----------
/*!
	\fn

	Doc.
*/

Subscription::Subscription(void) {}


// -----------
/*!
	\fn

	Doc.
*/

Subscription::~Subscription(void) {}


// -----------
/*!
	\fn

	Doc.
*/

void Subscription::mGetProduct() {

	aLOG << "Subscription::mGetProduct()";

	SubscriptionBackend *oSubscription = new SubscriptionBackend();
	oSubscription->mGetProduct();

	aLOG << "test";
}
