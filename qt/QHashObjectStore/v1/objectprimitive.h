#ifndef OBJECTPRIMITIVE_H
#define OBJECTPRIMITIVE_H

#include <QObject>
#include <QString>


class ObjectPrimitive : public QObject {

	Q_OBJECT

	public:

		explicit ObjectPrimitive(QObject *parent = nullptr);
		virtual ~ObjectPrimitive(void);
		QString mTestString(void);

	protected:

		QString pTestString;
};

#endif // OBJECTPRIMITIVE_H
