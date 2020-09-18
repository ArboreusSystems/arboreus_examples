// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file projects/qtquickapplication/empty/main.qml.tpl
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 16/09/2020 at 17:10:28
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15
import QtQuick.Controls 2.15
import Custom 1.0

// Application includes


// Application window component
ApplicationWindow {

	id: oMainWindow;
	visible: true;
	width: 640;
	height: 480;
	title: qsTr("Hello World");

	ACustomType1 {

		id: oCustomType1_1;
		objectName: "oCustomType1_1";

		Component.onCompleted: {

			console.log("oCustomType1_1 onCompleted");
		}

		function mTestJSFunction() {

			console.log("mTestJSFunction");
		}
	}

	ACustomType1 {

		id: oCustomType1_2;
		objectName: "oCustomType1_2";

		onSgTest: {

			console.log("Catched signal from QML in oCustomType1_2")
		}

		Component.onCompleted: {

			console.log("oCustomType1_2 onCompleted");
		}

		function mReturnValue() {

			return 1234;
		}
	}

	Component.onCompleted: {

		console.log("oMainWindow onCompleted");
		oCustomType1_2.mEmitSignal();
		oCustomType1_1.mEmitSignalWithParameter(12345);
		oCustomType1_1.mEmitSignalWithParameter("String parameter");
	}
}
