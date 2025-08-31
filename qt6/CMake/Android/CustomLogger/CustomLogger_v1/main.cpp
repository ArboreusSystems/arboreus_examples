/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file tablemodel.h
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 31/08/2025 at 19:44:27
 * */// --------------------------------------------------------------


// Precompiled includes
#include <main_pch.h>

// System includes
#include <android/log.h>

// Application includes


// Qt Quick Application
int main(int inCounter, char *inArguments[]) {

	QGuiApplication oApplication(inCounter, inArguments);
	QQmlApplicationEngine oEngine;

	__android_log_write(ANDROID_LOG_DEFAULT,"A_CUSTOM_WRITE_DEFAULT","Some __android_log_write default message");
	__android_log_write(ANDROID_LOG_VERBOSE,"A_CUSTOM_WRITE_VERBOSE","Some __android_log_write verbose message");
	__android_log_write(ANDROID_LOG_DEBUG,"A_CUSTOM_WRITE_DEBUG","Some __android_log_write debug message");
	__android_log_write(ANDROID_LOG_INFO,"A_CUSTOM_WRITE_INFO","Some __android_log_write info message");
	__android_log_write(ANDROID_LOG_WARN,"A_CUSTOM_WRITE_WARNING","Some __android_log_write warning message");
	__android_log_write(ANDROID_LOG_ERROR,"A_CUSTOM_WRITE_ERROR","Some __android_log_write error message");
	__android_log_write(ANDROID_LOG_FATAL,"A_CUSTOM_WRITE_FATAL","Some __android_log_write fatal message");
	__android_log_write(ANDROID_LOG_SILENT,"A_CUSTOM_WRITE_SILENT","Some __android_log_write silent message");

	__android_log_print(ANDROID_LOG_DEFAULT,"A_CUSTOM_PRINT_DEFAULT","Some %s default message","__android_log_print");
	__android_log_print(ANDROID_LOG_VERBOSE,"A_CUSTOM_PRINT_VERBOSE","Some %s verbose message","__android_log_print");
	__android_log_print(ANDROID_LOG_DEBUG,"A_CUSTOM_PRINT_DEBUG","Some %s debug message","__android_log_print");
	__android_log_print(ANDROID_LOG_INFO,"A_CUSTOM_PRINT_INFO","Some %s info message","__android_log_print");
	__android_log_print(ANDROID_LOG_WARN,"A_CUSTOM_PRINT_WARNING","Some %s warning message","__android_log_print");
	__android_log_print(ANDROID_LOG_ERROR,"A_CUSTOM_PRINT_ERROR","Some %s error message","__android_log_print");
	__android_log_print(ANDROID_LOG_FATAL,"A_CUSTOM_PRINT_FATAL","Some %s fatal message","__android_log_print");
	__android_log_print(ANDROID_LOG_SILENT,"A_CUSTOM_PRINT_SILENT","Some %s silent message","__android_log_print");

	const QUrl oURL = QUrl(QStringLiteral("qrc:/Main.qml"));
	QObject::connect(
		&oEngine, &QQmlApplicationEngine::objectCreationFailed,
		&oApplication, []() {
			QCoreApplication::exit(-1);
		},
		Qt::QueuedConnection
	);
	oEngine.load(oURL);

	return oApplication.exec();
}
