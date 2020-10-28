/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file projects/qtquickapplication/main.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 27/10/2020 at 21:19:16
 * */// --------------------------------------------------------------

// System includes
#include <QtGlobal>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <stdio.h>
#include <stdlib.h>

// Application includes

// Namespace

void myMessageOutput(QtMsgType inType, const QMessageLogContext& inContext, const QString& inMessage) {

	QByteArray oLocalMessage = inMessage.toLocal8Bit();
	const char* oFile = inContext.file ? inContext.file : "";
	const char* oFunction = inContext.function ? inContext.function : "";
	switch (inType) {
	case QtDebugMsg:
		fprintf(stderr, "Debug: %s (%s:%u, %s)\n", oLocalMessage.constData(), oFile, inContext.line, oFunction);
		break;
	case QtInfoMsg:
		fprintf(stderr, "Info: %s (%s:%u, %s)\n", oLocalMessage.constData(), oFile, inContext.line, oFunction);
		break;
	case QtWarningMsg:
		fprintf(stderr, "Warning: %s (%s:%u, %s)\n", oLocalMessage.constData(), oFile, inContext.line, oFunction);
		break;
	case QtCriticalMsg:
		fprintf(stderr, "Critical: %s (%s:%u, %s)\n", oLocalMessage.constData(), oFile, inContext.line, oFunction);
		break;
	case QtFatalMsg:
		fprintf(stderr, "Fatal: %s (%s:%u, %s)\n", oLocalMessage.constData(), oFile, inContext.line, oFunction);
		break;
	}
}

int main(int inCounter, char *inArguments[]) {



	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

	QGuiApplication oApplication(inCounter, inArguments);
	QQmlApplicationEngine oEngine;
	QQmlContext* oContext = oEngine.rootContext();

	ObjectType* oObject = new ObjectType();
	qInstallMessageHandler(oObject->objectMethod());

	qInstallMessageHandler(myMessageOutput);

	qDebug() << "Debug";
	qInfo() << "Info";
	qWarning() << "Warning";
	qCritical() << "Critical";
//	qFatal("Fatal");
//	Q_ASSERT(0 != 0);

	const QUrl oURL(QStringLiteral("qrc:/main.qml"));
	QObject::connect(
		&oEngine, &QQmlApplicationEngine::objectCreated,
		&oApplication, [oURL](QObject *obj, const QUrl &objUrl) {
			if (!obj && oURL == objUrl) {
				QCoreApplication::exit(-1);
			}
		}, Qt::QueuedConnection
	);
	oEngine.load(oURL);

	return oApplication.exec();
}
