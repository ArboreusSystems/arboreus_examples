/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file qtquick2/file.qml.tpl
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 05/03/2019 at 12:12:23
 * */// --------------------------------------------------------------

// System includes
import QtQuick 2.12

// Application includes


// Component

Rectangle {

	property alias wrap: text.wrapMode;
	property alias text: text.text;

	id: root;
	height: text.height;

	Text {
		id: text;
		width: root.width;
		text: "Default WrappedText";
		wrapMode: Text.WrapAnywhere;
	}
}
