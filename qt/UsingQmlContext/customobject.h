/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file classes/file.h
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 07/03/2019 at 21:10:17
 * */// --------------------------------------------------------------

#ifndef CUSTOMOBJECT_H
#define CUSTOMOBJECT_H

#include <QObject>
#include <QString>
#include <QDebug>

class CustomObject : public QObject {

	Q_OBJECT

	public:
		CustomObject(QObject *parent = nullptr);
		virtual ~CustomObject();

	public slots:
		QString text(void);
		QString composedText(QString incomeText);
};

#endif // CUSTOMOBJECT_H
