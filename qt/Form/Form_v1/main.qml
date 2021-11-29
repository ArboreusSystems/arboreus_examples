// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 16/11/2021 at 18:26:16
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15
import QtQuick.Controls 2.15
//import QtQuick.Layouts 1.15

// Application includes
import "qrc:/js/AGlobal.js" as GLOBAL;
import "qrc:/js/AColors.js" as COLORS;

// Application paths
//import "qrc:/qml/Inputs";
import "qrc:/qml/Content";
import "qrc:/qml/Views";


// Application
ApplicationWindow {

	property string pText: qsTr("Form v1");
	property bool pIsDesktop: GLOBAL.mIsDesktop();

	id: oApplicationWindow;
	width: pIsDesktop ? GLOBAL.desktopApplicationWidth() : maximumWidth;
	height: pIsDesktop ? GLOBAL.desktopApplicationHeight() : maximumHeight;
	visible: true;
	title: oApplicationWindow.pText;

	AContentWrapper {

		id: oContentWrapper;
		anchors.fill: parent;

		StackView {

			id: oApplicationStackView;
			anchors.fill: parent;

			Component.onCompleted: {

				oApplicationStackView.push(oDataView);
			}

			Component {id: oDataView; ADataView {}}
			Component {id: oFormView; AFormView {}}
		}

		Component.onCompleted: {

			var oCollectionName = "TestCollection";

			ACache.mPutInCollection(oCollectionName,"Key1","Value1");
			ACache.mPutInCollection(oCollectionName,"Key2","Value2");
			ACache.mPutInCollection(oCollectionName,"Key2","Value3");

			var oValueTest = ACache.mGetFromCollection(oCollectionName,"Key2");
			console.log("For Key:","Key2","Status",oValueTest.Status,"Value:",oValueTest.Value);

			var oCollectionTest = ACache.mGetCollection(oCollectionName);
			console.log("Key1:",oCollectionTest.Value.Key1);
			console.log("Key2:",oCollectionTest.Value.Key2);

			ACache.mRemoveFromCollection(oCollectionName,"Key2");
		}
	}
}
