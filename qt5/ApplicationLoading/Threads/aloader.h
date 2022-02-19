#ifndef ALOADER_H
#define ALOADER_H

#include <QObject>
#include <QMap>
#include <QPointer>
#include <QString>
#include <QPointer>

#include "aglobal.h"
#include "aobject1.h"
#include "aobject2.h"
#include "aobject3.h"


class aLoader : public QObject {

	Q_OBJECT

	public:

		explicit aLoader(
			aObject1* inObject1,
			aObject2* inObject2,
			aObject3* inObject3,
			QObject* inParent = nullptr
		);
		virtual ~aLoader(void);

	signals:

		void sAllPrepeared(void);
		void sAllCreated(void);

	private slots:

		void mCreatedObject1(void);
		void mCreatedObject2(void);
		void mCreatedObject3(void);
		void mAllPrepeared(void);
		void mAllCreated(void);

	private:

		aObject1* pObject1;
		aObject2* pObject2;
		aObject3* pObject3;
};

#endif // ALOADER_H
