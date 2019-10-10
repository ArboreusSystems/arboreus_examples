import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

ApplicationWindow {

	id: oApplicationWindow;
	visible: true;
	width: 640;
	height: 480;
	title: qsTr("Hello World");

	Component.onCompleted: {console.log("oApplicationWindow created")}

	footer: Rectangle {

		id: oFooter;
		width: oApplicationWindow.width;
		height: oApplicationWindow.height * 0.1;
		color: "#e1e1e1";

		ButtonExit {

			id: obuttonExit;
			width: parent.width * 0.6
			height: parent.height * 0.6
			anchors.verticalCenter: parent.verticalCenter;
			anchors.horizontalCenter: parent.horizontalCenter;
		}
	}

	header: Rectangle {

		id: oHeader;
		width: oApplicationWindow.width;
		height: oApplicationWindow.height * 0.15;
		color: "#e1e1e1";

		Column {

			id: oHeaderContent;
			width: parent.width * 0.8;
			anchors.verticalCenter: parent.verticalCenter;
			anchors.horizontalCenter: parent.horizontalCenter;
			spacing: 2

			Text {

				id: oCompanyNotice;
				text: qsTr("Arboreus Examples");
				width: parent.width;
				horizontalAlignment: Text.AlignHCenter;
				anchors.horizontalCenter: parent.horizontalCenter;
				font.pixelSize: 12;
			}

			Text {

				id: oApplicationNotice;
				text: qsTr("StackView Navigation");
				width: parent.width;
				horizontalAlignment: Text.AlignHCenter;
				anchors.horizontalCenter: parent.horizontalCenter;
				font.pixelSize: 14;
			}

			Row {

				property int pSpacing: 3;

				id: oScreenMenu;
				spacing: pSpacing;
				anchors.horizontalCenter: parent.horizontalCenter;
				width: {
					return oButtonScreen1.width + oButtonScreen2.width + oButtonScreen3.width + pSpacing * 2;
				}

				ButtonScreen {

					function mOnClicked() {

						console.log("Clicked",oButtonScreen1.pText);

//						oStackView.replace(oScreen1);

						oStackView.pop();
						oStackView.push(oScreen1);

//						var oComponent = ' \
//							import QtQuick 2.12;
//							Screen1 {}
//						';
//						var oScreen = Qt.createQmlObject(oComponent,oStackView,"oScreen1");
//						oStackView.replace(oScreen);
					}

					id: oButtonScreen1;
					pText: "Screen 1";
				}

				ButtonScreen {

					function mOnClicked() {

						console.log("Clicked",oButtonScreen2.pText);

//						oStackView.replace(oScreen2);

						oStackView.pop();
						oStackView.push(oScreen2);

//						var oComponent = ' \
//							import QtQuick 2.12;
//							Screen2 {}
//						';
//						var oScreen = Qt.createQmlObject(oComponent,oStackView,"oScreen2");
//						oStackView.replace(oScreen);

					}

					id: oButtonScreen2;
					pText: "Screen 2";
				}

				ButtonScreen {

					function mOnClicked() {

						console.log("Clicked",oButtonScreen3.pText);

//						oStackView.replace(oScreen3);

						oStackView.pop();
						oStackView.push(oScreen3);

//						var oComponent = ' \
//							import QtQuick 2.12;
//							Screen3 {}
//						';
//						var oScreen = Qt.createQmlObject(oComponent,oStackView,"oScreen3");
//						oStackView.replace(oScreen);
					}

					id: oButtonScreen3;
					pText: "Screen 3";
				}
			}
		}


	}

	StackView {

		id: oStackView;
		width: parent.width;
		height: parent.height;

//		Component.onCompleted: {

//			console.log("oStackView created");
//			var oComponent = ' \
//				import QtQuick 2.12;
//				Screen1 {}
//			';
//			var oInitialItem = Qt.createQmlObject(oComponent, oStackView, "oScreen1");
//			oStackView.initialItem = oInitialItem;
//		}

		initialItem: oScreen1;

		Component {id: oScreen1; Screen1 {}}
		Component {id: oScreen2; Screen2 {}}
		Component {id: oScreen3; Screen3 {}}
	}
}
