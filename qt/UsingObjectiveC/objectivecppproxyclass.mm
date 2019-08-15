#include <QtCore/qglobal.h>
#include "aglobal.h"
#include "objectivecppproxyclass.hpp"

#import <Foundation/Foundation.h>


@interface ObjectiveCPPClass: NSObject

@property (strong,nonatomic) NSString *pNSString;

-(NSString *) mGetNSString;

@end

@implementation ObjectiveCPPClass

-(instancetype) init {

	self = [super init];
	if (self) {
		_pNSString = @"Initial value";
	}
	aLOG << "ObjectiveCPPClass created";
	return self;
}

-(NSString *) mGetNSString {
	return _pNSString;
}

@end


QT_BEGIN_NAMESPACE

ObjectiveCPPProxyClass::ObjectiveCPPProxyClass(void) {

	aLOG << "ObjectiveCPPProxyClass::ObjectiveCPPProxyClass(void) created";

}

ObjectiveCPPProxyClass::~ObjectiveCPPProxyClass(void) {

	aLOG << "ObjectiveCPPProxyClass::ObjectiveCPPProxyClass(QObject *parent) deleted";
}

QString ObjectiveCPPProxyClass::mGetNSString(void) {

	ObjectiveCPPClass *oObjectiveCPPClass = [[ObjectiveCPPClass alloc] init];;
	QString oNSString = QString::fromNSString([oObjectiveCPPClass mGetNSString]);
	return oNSString;
}


QT_END_NAMESPACE
