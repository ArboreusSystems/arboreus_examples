// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 18/11/2021 at 19:46:22
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15
import QtQuick.Controls 2.15

// Application includes
import "qrc:/js/AColors.js" as COLORS;


// Component
ScrollView {

	property var pData: [];
	signal sgClicked(int inID);

	id: oRoot;

	ScrollBar.horizontal.policy: ScrollBar.AlwaysOff;
	ScrollBar.vertical.policy: ScrollBar.AlwaysOff;

	Row {

		id: oMenu;
		spacing: 3;
		height: oRoot.height;

		Component.onCompleted: {

			for (var i = 0; i < oRoot.pData.length; i++) {

				var oQMLObjectString = 'import QtQuick 2.15; import "qrc:/qml/Menu"; AFormMenuItem {' +
					'objectName: "MenuItem_' + oRoot.pData[i].id + '";' +
					'pCarousel: oRoot;' +
					'pID: ' + oRoot.pData[i].id + ';' +
					'text: "' + oRoot.pData[i].text + '";' +
				'}';
				var oMenuItem = Qt.createQmlObject(oQMLObjectString,oMenu,"MenuItem_" + i);
			}
		}
	}
}
