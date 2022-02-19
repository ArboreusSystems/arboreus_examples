#ifndef OBJECT1_H
#define OBJECT1_H

#include <QObject>
#include "objectprimitive.h"


class Object1 : public ObjectPrimitive {

	public:
		explicit Object1(QObject *parent = nullptr);
		virtual ~Object1(void);
};

#endif // OBJECT1_H
