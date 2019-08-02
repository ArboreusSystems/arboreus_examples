// ----------------------------------------------------------
/*!
	\headerfile aMap
	\title
	\brief Template file classes/cpp/file.h

	\list
		\li @notice Template file classes/file.h
		\li @copyright Arboreus (http://arboreus.systems)
		\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
		\li @created 02/08/2019 at 17:15:08
	\endlist
*/
// ----------------------------------------------------------

#ifndef AMAP_H
#define AMAP_H

// System includes
#include <QObject>

// Application includes

class aMap : public QObject {

	Q_OBJECT

	public:
		explicit aMap(QObject *parent = nullptr);
		virtual ~aMap(void);
		void mDoTest(void);
};

#endif // AMAP_H
