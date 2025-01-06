#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QDebug>

#include <AWrapper.hpp>

int main(int argc, char *argv[]) {

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/UsingCPPSwiftInterop_v2/Main.qml"));
    QObject::connect(
        &engine,&QQmlApplicationEngine::objectCreated,
        &app,[url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl) {
                QCoreApplication::exit(-1);
            }
        },
        Qt::QueuedConnection
    );

    qDebug() << "Integer from Swift:" << fIntegerFromSwift();

    engine.load(url);

    return app.exec();
}
