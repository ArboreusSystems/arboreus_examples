// ----------------------------------------------------------
/*!
	\headerfile %{CN}
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 24/12/2019 at 22:01:41
	\endlist
*/
// ----------------------------------------------------------
#ifndef AGLOBAL_H
#define AGLOBAL_H

// System includes

// Application includes

// Constants and defintions
#define A_MESSAGE_CONSOLE qDebug()
#define A_MESSAGE_DEBUG A_MESSAGE_CONSOLE << QDateTime::currentMSecsSinceEpoch()

#endif // AGLOBAL_H
