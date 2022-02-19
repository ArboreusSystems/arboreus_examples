import QtQuick 2.12;
import QtQuick.Window 2.12;

import "qrc:/enum.js" as ENUMQML;
import "qrc:/test.js" as TEST;

Window {

	property var eENUMVAR: ENUMQML.ENUM;

	visible: true;
	width: 640;
	height: 480;
	title: qsTr("Hello World");

	Component.onCompleted: {

		console.log("From QML:",eENUMVAR.value1);
		ENUMQML.mTestEnum();

		var oReply = null;

		oReply = Backend.mTestEnumValue();
		if (oReply.status) {
			console.log("Status mTestEnumValue: OK");
			if (oReply.datum === eENUMVAR.value1) {
				console.log("Datum mTestEnumValue: VALUE1");
			} else {
				console.log("Datum mTestEnumValue: NOT_VALUE1");
			}
		} else {
			console.log("Status mTestEnumValue: ERROR");
		}

		oReply = Backend.mTestEnumMap();
		console.log("Status mTestEnumMap:",oReply.status);
		console.log("Datum mTestEnumMap.value1:",oReply.datum.value1);
		console.log("Datum mTestEnumMap.value2:",oReply.datum.value2);
		console.log("Datum mTestEnumMap.value3:",oReply.datum.value3);

		oReply = Backend.mTestEnumList();
		console.log("Status mTestEnumList:",oReply.status);
		console.log("Datum mTestEnumList[0]:",oReply.datum[0]);
		console.log("Datum mTestEnumList[1]:",oReply.datum[1]);
		console.log("Datum mTestEnumList[2]:",oReply.datum[2]);
	}
}
