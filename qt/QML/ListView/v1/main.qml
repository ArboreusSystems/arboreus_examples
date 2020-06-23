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
		{color: COLORS.mBlue()},
		{color: COLORS.mFiolentDark()},
		{color: COLORS.mPurpleDark()},
		{color: COLORS.mOrangeDark()},
		{color: COLORS.mPurpleDark()},
		{color: COLORS.mBlueDark()},
		{color: COLORS.mGreen()},
		{color: COLORS.mFiolentDark()},
		{color: COLORS.mSalad()},
		{color: COLORS.mOrangeDark()},
		{color: COLORS.mRed()},
		{color: COLORS.mOrangeDark()}
	];

	id: oApplicationWindow;
	visible: true;
	width: pIsDesktop ? GLOBAL.desktopApplicationWidth() : maximumWidth;
	height: pIsDesktop ? GLOBAL.desktopApplicationHeight() : maximumHeight;
	title: qsTr("QML ListView demo");

	Component {

		id: oDelegateListView1;

		Rectangle {

			id: oDelegateBackground;
			width: oListView.width;
			height: 50;
			color: parent.color;
		}
	}

	Component {

		id: oDelegateListView2;

		Rectangle {

			id: oDelegateBackground;
			width: oListView.width;
			height: 150;
			color: parent.color;
		}
	}

	ListModel {

		id: oListModel;

		Component.onCompleted: {

			for (var i = 0; i < oApplicationWindow.pData.length; i++) {
				oListModel.append(oApplicationWindow.pData[i]);
			}
		}
	}

	ListView {

		id: oListView;
		rotation: 180;
		anchors.fill: parent;
		model: oListModel;
		spacing: 5;
		delegate: Loader {

			property var color: model.color;
			sourceComponent: {

				if (color === COLORS.mPurpleDark()) {
					return oDelegateListView2;
				}
				return oDelegateListView1;
			}

			Component.onCompleted: {

				console.log(model.color);
			}
		}

		Component.onCompleted: {

			console.log(oListModel);

			oListModel.append({color: COLORS.mBlueDark()});
			oListModel.append({color: COLORS.mBlueDark()});
			oListModel.append({color: COLORS.mPurpleDark()});
			oListModel.append({color: COLORS.mBlueDark()});

//			pData.push({color: COLORS.mBlue()});
//			pData.push({color: COLORS.mBlue()});
//			pData.push({color: COLORS.mPurpleDark()});
//			pData.push({color: COLORS.mBlue()});
//			oListView.model = pData;
//			console.log(pData);
		}

		onCountChanged: {

			console.log("This prints properly.");
			oListView.positionViewAtBeginning();
		}
	}
}
