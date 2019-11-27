/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file qtquickapplication/empty/main.qml.tmpl
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 25/11/2019 at 09:45:44
 * */// --------------------------------------------------------------

// System includes
import QtQuick 2.12
import QtQuick.Window 2.12

// Application includes
import AEnum 1.0

// Application
Window {

	visible: true
	width: 640
	height: 480
	title: qsTr("Hello World")

	Component.onCompleted: {

		ADemo.mTestEnum1(AEnum1.Value1_1);
		ADemo.mTestEnum1(AEnum1.Value1_2);
		ADemo.mTestEnum1(AEnum1.Value1_3);

		console.log("AEnum1.Value1_1:",AEnum1.Value1_1);
		console.log("AEnum1.Value1_2:",AEnum1.Value1_2);
		console.log("AEnum1.Value1_3:",AEnum1.Value1_3);
	}
}
