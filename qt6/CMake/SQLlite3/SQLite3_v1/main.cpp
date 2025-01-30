#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QDebug>

#include <sqlite.conf.h>


int main(int argc, char *argv[]) {

    QGuiApplication app(argc, argv);

    // -----------------------------------
    // SQLite demo
    // -----------------------------------

    qDebug() << "SQlite version:" << sqlite3_libversion();

    sqlite3* oSQLiteDB;
    sqlite3_stmt* oStatement;
    int oResult = 0;

    oResult = sqlite3_open(":memory:",&oSQLiteDB);
    if (oResult != SQLITE_OK) {
        qDebug() << "Can't open database:" << sqlite3_errmsg(oSQLiteDB);
    } else {
        qDebug() << "Opened DB in memory";
    }

    oResult = sqlite3_prepare_v2(oSQLiteDB,"SELECT SQLITE_VERSION()",-1,&oStatement,0);
    if (oResult != SQLITE_OK) {
        qDebug() << "Failed to fetch data:" << sqlite3_errmsg(oSQLiteDB);
        sqlite3_close(oSQLiteDB);
    } else {
        qDebug() << "Fetched data";
    }

    oResult = sqlite3_step(oStatement);
    if (oResult == SQLITE_ROW) {
        qDebug() << QString::fromUtf8((char*)sqlite3_column_text(oStatement,0));
    }

    sqlite3_finalize(oStatement);
    sqlite3_close(oSQLiteDB);

    // -----------------------------------

    QQmlApplicationEngine engine;
    QObject::connect(
        &engine,&QQmlApplicationEngine::objectCreationFailed,
        &app,[]() {
            QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection
    );

    engine.loadFromModule("SQLite3_v1", "Main");

    return app.exec();
}
