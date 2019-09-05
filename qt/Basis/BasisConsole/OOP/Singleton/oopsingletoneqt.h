// ----------------------------------------------------------
/*!
	\headerfile OOPSingletoneQt
	\title
	\brief Template file classes/cpp/file.h

	\list
		\li @notice Template file classes/file.h
		\li @copyright Arboreus (http://arboreus.systems)
		\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
		\li @created 05/09/2019 at 13:07:55
	\endlist
*/
// ----------------------------------------------------------

#ifndef OOPSINGLETONEQT_H
#define OOPSINGLETONEQT_H


// System includes
#include <QObject>
#include <QString>

// Application includes
#include "aglobal.h"


class OOPSingletoneQt : public QObject {

	Q_OBJECT

	public:
		static OOPSingletoneQt& Instance(void) {
			static OOPSingletoneQt oSingletone;
			return oSingletone;
		}
		QString *pTestString;

	private:
		explicit OOPSingletoneQt(QObject *parent = nullptr);
		virtual ~OOPSingletoneQt(void);
		Q_DISABLE_COPY(OOPSingletoneQt)
};

#endif // OOPSINGLETONEQT_H
