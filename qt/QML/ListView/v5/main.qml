/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file qtquickapplication/empty/main.qml.tmpl
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 13/06/2020 at 18:40:39
 * */// --------------------------------------------------------------

// System includes
import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

// Application includes
import "qrc:/js/Global.js" as GLOBAL;
import "qrc:/js/Colors.js" as COLORS;


// Application
ApplicationWindow {

	property bool pIsDesktop: true;
	property var pData: [
		["Field_0-01","Field_0-02","Field_0-03","Field_0-04","Field_0-05"],
		["Field_1-01","Field_1-02","Field_1-03","Field_1-04","Field_1-05"],
		["Field_2-01","Field_2-02","Field_2-03","Field_1-04","Field_2-05"],
		["Field_3-01","Field_3-02","Field_3-03","Field_1-04","Field_3-05"],
		["Field_4-01","Field_4-02","Field_4-03","Field_1-04","Field_4-05"],
		["Field_5-01","Field_5-02","Field_5-03","Field_1-04","Field_5-05"],
		["Field_6-01","Field_6-02","Field_6-03","Field_1-04","Field_6-05"],
		["Field_7-01","Field_7-02","Field_7-03","Field_1-04","Field_7-05"]
	];

	id: oApplicationWindow;
	visible: true;
	width: pIsDesktop ? GLOBAL.desktopApplicationWidth() : maximumWidth;
	height: pIsDesktop ? GLOBAL.desktopApplicationHeight() : maximumHeight;
	title: qsTr("QML ListView demo");

	Component {

		id: oListViewDelegate;

		Rectangle {

			property int pPadding: 15;

			id: oTextWrapper;
			color: oListView.currentIndex == index ? COLORS.mBlueDark() : COLORS.mWhite();
			clip: true;
			implicitHeight: oText.implicitHeight + 2 * oTextWrapper.pPadding;
			implicitWidth: oListView.width;

			Text {

				id: oText;
				text: modelData[0];
				font.pixelSize: 18;
				width: parent.width - 2 * oTextWrapper.pPadding;
				wrapMode: Text.WordWrap;
				color: oListView.currentIndex == index ? COLORS.mWhiteLight() : COLORS.mBlueDark();
				anchors.horizontalCenter: parent.horizontalCenter;
				anchors.verticalCenter: parent.verticalCenter;
				Component.onCompleted: {
					console.log(model);
					console.log("onCompleted",model.index,oApplicationWindow.pData[index][2]);
				}
				Component.onDestruction: {

					console.log("onDestruction",model.index,oApplicationWindow.pData[index][2]);
				}
			}

			MouseArea {

				id: oMouseArea;
				onClicked: oListView.currentIndex = index;
				anchors.fill: parent;
			}
		}
	}

	ListView {

		id: oListView;
		anchors.fill: parent;
		model: oApplicationWindow.pData;
		spacing: 5;
		cacheBuffer: 100;
		delegate: oListViewDelegate;
		clip: true;
		onCurrentIndexChanged: {

			console.log("Selected oListView.currentIndex =",currentIndex);
		}
	}
}
