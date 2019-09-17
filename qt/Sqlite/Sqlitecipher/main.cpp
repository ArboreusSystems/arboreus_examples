#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "database.h"
#include "listmodel.h"

int main(int argc, char *argv[])
{
	QApplication app(argc, argv);
	QQmlApplicationEngine engine;

	DataBase database;
	database.connectToDataBase();

	ListModel *model = new ListModel();

	engine.rootContext()->setContextProperty("myModel", model);
	engine.rootContext()->setContextProperty("database", &database);

	engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

	return app.exec();
}
