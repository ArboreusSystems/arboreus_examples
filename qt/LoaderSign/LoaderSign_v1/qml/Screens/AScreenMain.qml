// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 11/02/2022 at 23:24:02
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15
import QtQuick.Controls 2.15

// Application includes
import "qrc:/js/AColors.js" as COLORS;

// Application paths
import "qrc:/qml/Templates";
import "qrc:/qml/Headers";
import "qrc:/qml/Buttons";
import "qrc:/qml/LoaderSigns";


// Component
AScreenTemplate {

	id: oRoot;
	color: COLORS.mWhite();

	AHeader {

		id: oHeader;
		width: parent.width;
		height: 100;
		pText: "Loader Signs Demo";
	}

	ScrollView {

		id: oContentScrollView;
		width: parent.width
		anchors.top: oHeader.bottom;
		anchors.bottom: parent.bottom;
		anchors.left: parent.left;
		anchors.right: parent.right;
		clip: true;

		Column {

			id: oContent;
			width: oContentScrollView.width * 0.8;
			topPadding: 50;
			leftPadding: oContentScrollView.width * 0.1;
			spacing: 10;

			AButtonQMLOnlyDemo {

				id: oButtonQMLContent;

				onClicked: {

					oContentTopLayer.mShowWithSource(
						"qrc:/qml/LoaderSigns/ALoaderSignQMLOnly.qml"
					)
				}
			}

			AButtonImageDemo {

				id: oButtonImageContent;

				onClicked: {

					oContentTopLayer.mShowWithSource(
						"qrc:/qml/LoaderSigns/ALoaderSignImage.qml"
					)
				}
			}
		}
	}
}
