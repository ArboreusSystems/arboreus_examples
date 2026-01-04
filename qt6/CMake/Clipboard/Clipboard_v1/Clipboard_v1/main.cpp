/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file tablemodel.h
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 04/01/2026 at 17:03:01
 * */// --------------------------------------------------------------


// Precompiled includes
#include <main_pch.h>

// System includes

// Application includes
#include <alogger.h>

// Qt Quick Application
int main(int inCounter, char *inArguments[]) {

	QGuiApplication oApplication(inCounter, inArguments);
	QQmlApplicationEngine oEngine;

	QClipboard* oClipboard = QGuiApplication::clipboard();

	QObject::connect(
		oClipboard,&QClipboard::changed,
		oClipboard,[](){
			_A_DEBUG << "Signal QClipboard::changed appeared";
		}
	);
	QObject::connect(
		oClipboard,&QClipboard::dataChanged,
		oClipboard,[](){
			_A_DEBUG << "Signal QClipboard::dataChanged appeared";
		}
	);
	QObject::connect(
		oClipboard,&QClipboard::findBufferChanged,
		oClipboard,[](){
			_A_DEBUG << "Signal QClipboard::findBufferChanged appeared";
		}
	);
	QObject::connect(
		oClipboard,&QClipboard::selectionChanged,
		oClipboard,[](){
			_A_DEBUG << "Signal QClipboard::findBufferChanged appeared";
		}
	);

	_A_DEBUG << "ownsClipboard:" << oClipboard->ownsClipboard();
	_A_DEBUG << "ownsFindBuffer:" << oClipboard->ownsFindBuffer();
	_A_DEBUG << "supportsFindBuffer:" << oClipboard->supportsFindBuffer();
	_A_DEBUG << "ownsSelection:" << oClipboard->ownsSelection();
	_A_DEBUG << "supportsSelection:" << oClipboard->supportsSelection();

	_A_DEBUG << "Current clipboard:" << oClipboard->text();
	oClipboard->setText("New text from Qt");
	_A_DEBUG << "Current clipboard:" << oClipboard->text();

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
