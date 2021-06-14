// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 14/06/2021 at 13:54:00
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

// Application includes
import "qrc:/js/AColors.js" as COLORS;
import "qrc:/js/AGlobal.js" as GLOBAL;

// Application
ApplicationWindow {

	property string pText: qsTr("GridLayout v1");
	property bool pIsDesktop: true;

	id: oApplicationWindow;
	width: pIsDesktop ? GLOBAL.desktopApplicationWidth() : maximumWidth;
	height: pIsDesktop ? GLOBAL.desktopApplicationHeight() : maximumHeight;
	visible: true;
	title: oApplicationWindow.pText;

	GridLayout {

	   id: oLayout
	   anchors.fill: parent;
	   rows: 3;
	   columns: 3;

	   Rectangle {

			color: COLORS.mOrange();
			Layout.fillHeight: true;
			Layout.fillWidth: true;
			Layout.columnSpan: 2;
			Layout.rowSpan: 1;
			Layout.row: 1;
			Layout.column: 2;
	   }

	   Rectangle {

			color: COLORS.mFiolent();
			Layout.fillHeight: true;
			Layout.fillWidth: true;
			Layout.columnSpan: 1;
			Layout.rowSpan: 2;
			Layout.row: 1;
			Layout.column: 1;
	   }

	   Rectangle {

			color: COLORS.mGreen();
			Layout.fillHeight: true;
			Layout.fillWidth: true;
			Layout.columnSpan: 1;
			Layout.rowSpan: 2;
			Layout.row: 2;
			Layout.column: 3;
	   }

	   Rectangle {

			color: COLORS.mSalad();
			Layout.fillHeight: true;
			Layout.fillWidth: true;
			Layout.columnSpan: 1;
			Layout.rowSpan: 1;
			Layout.row: 2;
			Layout.column: 2;
	   }

	   Rectangle {

			color: COLORS.mRed();
			Layout.fillHeight: true;
			Layout.fillWidth: true;
			Layout.columnSpan: 2;
			Layout.rowSpan: 1;
			Layout.row: 3;
			Layout.column: 1;
	   }
   }
}
