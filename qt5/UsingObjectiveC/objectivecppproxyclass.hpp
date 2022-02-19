#include <QObject>
#include <QString>
#include <QVariant>
#include <QtCore/qglobal.h>


class ObjectiveCPPProxyClass: public QObject {

	Q_OBJECT

	public:
		ObjectiveCPPProxyClass(void);
		virtual ~ObjectiveCPPProxyClass(void);
		QString mGetNSString(void);
};
