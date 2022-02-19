/* -------------------------------------------------------------------
 *  @doc Objective-C++ class
 *  @notice
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 26/02/2019 at 20:52:09
 * */// --------------------------------------------------------------

#include "mynotification.h"
#import <Foundation/NSString.h>

void MyNotification::Display(const QString& title, const QString& text)
{
	NSString*  titleStr = [[NSString alloc] initWithUTF8String:title.toUtf8().data()];
	NSString*  textStr = [[NSString alloc] initWithUTF8String:text.toUtf8().data()];

	NSLog(@"titleStr: %@, textStr: %@",titleStr,textStr);
}

std::string MyNotification::Text(void) {

	std::string String = "String from *.mm";
	return String;
}
