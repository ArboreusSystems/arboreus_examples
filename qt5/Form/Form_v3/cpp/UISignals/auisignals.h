// ----------------------------------------------------------
/*!
	\headerfile AUISignals
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 19/02/2022 at 14:28:10
	\endlist
*/
// ----------------------------------------------------------

#ifndef AUISIGNALS_H
#define AUISIGNALS_H

// System includes
#include <QObject>

// Application includes
#include <aloggerglobal.h>

// Constants and definitions

// Namespace

// Class definitions
class AUISignals : public QObject {

	Q_OBJECT

	public:

		explicit AUISignals(QObject* parent = nullptr);
		virtual ~AUISignals(void);

	public slots:

	signals:

		void sgListViewItemShowMenuBar(void);
		void sgListViewItem(int inIndex,QVariantMap inItemData);
};

#endif // AUISIGNALS_H
