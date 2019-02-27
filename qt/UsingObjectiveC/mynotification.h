/* -------------------------------------------------------------------
 *  @doc Objective-C++ class headers
 *  @notice Template file cppheader/file.h
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 26/02/2019 at 20:52:09
 * */// --------------------------------------------------------------

#ifndef MYNOTIFICATION_H
#define MYNOTIFICATION_H

#include <QString>

class MyNotification {

	public:
		static void Display(const QString& title, const QString& text);
		static std::string Text(void);
};


#endif // MYNOTIFICATION_H
