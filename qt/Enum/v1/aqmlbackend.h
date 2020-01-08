#ifndef AQMLBACKEND_H
#define AQMLBACKEND_H

#include <QObject>
#include <QVariantMap>
#include <QVariantList>

#include <aglobal.h>
#include <atestenum.h>


class AQMLBackend : public QObject {

	Q_OBJECT

	public:

		explicit AQMLBackend(QObject *parent = nullptr);
		virtual ~AQMLBackend(void);

	public slots:

		QVariantMap mTestEnumValue(void);
		QVariantMap mTestEnumMap(void);
		QVariantMap mTestEnumList(void);
};

#endif // AQMLBACKEND_H
