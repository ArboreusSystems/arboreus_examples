#ifndef DISPATCHER_H
#define DISPATCHER_H

#include <QObject>
#include <QHash>
#include <QString>
#include <objectprimitive.h>
#include <object1.h>
#include <object2.h>
#include <object3.h>
#include <QVariantList>
#include <QVariant>
#include <QList>

#include "aglobal.h"

class Dispatcher : public QObject {

	Q_OBJECT

	public:

		explicit Dispatcher(QObject *parent = nullptr);
		virtual ~Dispatcher(void);

		enum class ObjectTypes {
			Object1 = 1,
			Object2 = 2,
			Object3 = 3
		}; Q_ENUM(ObjectTypes)

		bool mCreate(QString inName,ObjectTypes inType);
		QHash<bool,ObjectPrimitive*> mGetObject(QString inName);
		ObjectPrimitive* mGetSimpleObject(QString inName);
		QVariantList mGetListOfObjects(void);

	private:

		QHash<QString,ObjectPrimitive*> pObjects;
};

#endif // DISPATCHER_H
