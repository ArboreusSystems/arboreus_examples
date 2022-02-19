// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 12/11/2021 at 17:12:33
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import Arboreus 1.0

// Application includes
import "qrc:/js/AColors.js" as COLORS;

// Application paths
import "qrc:/qml"


// Component
Rectangle {

	required property AListViewModel pListViewModel;
	required property ListView pListView;
	property var pOrderIndex: oRoot.pListViewModel.mOrderIndex();

	id: oRoot;
	color: COLORS.mPurpleDark();
	width: 30;

	ScrollView {

		id: oOrderarapper;
		anchors.verticalCenter: parent.verticalCenter;
		clip: true;
		width: parent.width;
		height: oRoot.height > oOrderLayout.height ? oOrderLayout.height : oRoot.height;
		contentHeight: oOrderLayout.height;

		Column {

			id: oOrderLayout;
			spacing: 3;

			Component.onCompleted: {

				if (oRoot.height < oOrderLayout.height) {
					console.log("oRoot.height:",oRoot.height,"oOrderLayout.height:",oOrderLayout.height,"less");
				} else {
					console.log("oRoot.height:",oRoot.height,"oOrderLayout.height:",oOrderLayout.height,"bigger");
				}

				for (var i = 0; i < oRoot.pOrderIndex.length; i++) {

					var oButtonQML = '' +
						'import QtQuick 2.15;' +
						'import "qrc:/qml";' +
						"AAlphabetOrderButton {" +
							'pListView: '+ oRoot.pListView.objectName +';' +
							'pText: "' + oRoot.pOrderIndex[i].Text + '";' +
							'pIndex: ' + oRoot.pOrderIndex[i].Index + ';' +
						'}';

					var newObject = Qt.createQmlObject(oButtonQML,oOrderLayout,"oOrderLayoutButton" + i);
					console.log("Object created:",oRoot.pOrderIndex[i].Text);
				}
			}
		}
	}
}
