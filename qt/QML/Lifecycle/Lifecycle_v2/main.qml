// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file projects/qtquickapplication/empty/main.qml.tpl
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 19/09/2020 at 12:43:30
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15
import QtQuick.Window 2.15
import Custom 1.0

// Application includes


// Application window component
Window {

	id: oMainWindow;
	visible: true;
	width: 640;
	height: 480;
	title: qsTr("Hello World");

	ACustomType {

		id: oCustomType1;
		objectName: "oCustomType1";

		Component.onCompleted: {

			oCustomType1.mAction();
			ALogger.mWriteToLog("oCustomType1 onCompleted");
		}

		Component.onDestruction: {

			ALogger.mWriteToLog("oCustomType1 onDestruction");
		}

		onSgStep1: {

			ALogger.mWriteToLog("oCustomType1 onSgStep1");
		}

		onSgStep2: {

			ALogger.mWriteToLog("oCustomType1 onSgStep2");
		}


	}

	ACustomType {

		id: oCustomType2;
		objectName: "oCustomType2";

		Component.onCompleted: {

			oCustomType2.mAction();
			ALogger.mWriteToLog("oCustomType2 onCompleted");
		}

		Component.onDestruction: {

			ALogger.mWriteToLog("oCustomType2 onDestruction");
		}

		onSgStep3: {

			ALogger.mWriteToLog("oCustomType2 onSgStep3");
		}
	}

	ACustomType {

		id: oCustomType3;
		objectName: "oCustomType3";

		Component.onCompleted: {

			oCustomType3.mAction();
			ALogger.mWriteToLog("oCustomType3 onCompleted");
		}

		Component.onDestruction: {

			ALogger.mWriteToLog("oCustomType3 onDestruction");
		}

		onSgStep2: {

			ALogger.mWriteToLog("oCustomType3 onSgStep2");
		}
	}
}
