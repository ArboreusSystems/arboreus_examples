#ifndef ALIBRARY_H
#define ALIBRARY_H

#include <QObject>
#include <QDebug>

class ALibraryPrivate;

class ALibrary : public QObject {

	Q_OBJECT

	public:

		explicit ALibrary(QObject* parent = nullptr);
		virtual ~ALibrary(void);

		int mOpenDB(QString inPath);
		bool mCloseDB(void);
		bool mExecute(QString inSQL);
		QVariant mGetResult();

	private:

		ALibraryPrivate* pPrivate = nullptr;
};

#endif // ALIBRARY_H
