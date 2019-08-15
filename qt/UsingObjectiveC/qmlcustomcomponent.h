/* -------------------------------------------------------------------
 *  @doc Qml Custom component
 *  @notice Template file classes/file.h
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 26/02/2019 at 18:29:33
 * */// --------------------------------------------------------------

#ifndef QMLCUSTOMCOMPONENT_H
#define QMLCUSTOMCOMPONENT_H

#include <QObject>
#include <QString>
#include "aglobal.h"
#include "objectivecppproxyclass.hpp"


class QMLCustomComponent : public QObject {

	Q_OBJECT
	Q_PROPERTY(QString text READ text CONSTANT)

	public:
		explicit QMLCustomComponent(QObject *parent = nullptr);
		virtual ~QMLCustomComponent();
		QString text(void);

	private:
		ObjectiveCPPProxyClass *pObjectiveCPP;

	signals:

	public slots:
};

#endif // QMLCUSTOMCOMPONENT_H
