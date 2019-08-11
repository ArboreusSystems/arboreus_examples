#include "subscription.h"
#import <StoreKit/StoreKit.h>
#import <Foundation/Foundation.h>

Subscription::Subscription(QObject *parent):  QObject(parent) {}

Subscription::~Subscription(void) {}

void Subscription::mGetProduct(void) {

	aLOG << "test";
}





