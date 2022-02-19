#ifndef OBJECT2_H
#define OBJECT2_H

#include <QObject>
#include "objectprimitive.h"

class Object2 : public ObjectPrimitive {

	public:
		explicit Object2(QObject *parent = nullptr);
		virtual ~Object2(void);
};

#endif // OBJECT2_H
