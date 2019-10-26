#ifndef OBJECT3_H
#define OBJECT3_H

#include <QObject>
#include "objectprimitive.h"

class Object3 : public ObjectPrimitive {

	public:
		explicit Object3(QObject *parent = nullptr);
		virtual ~Object3(void);
};

#endif // OBJECT3_H
