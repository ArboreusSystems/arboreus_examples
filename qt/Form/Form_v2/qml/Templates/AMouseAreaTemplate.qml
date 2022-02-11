// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 07/01/2022 at 20:13:30
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15

// Application includes


// Component
MouseArea {

	signal sgSwipeLeft();
	signal sgSwipeRight();
	signal sgSwipeDown();
	signal sgSwipeUp();

	QtObject {

		property bool pTracing: false;
		property real pXVelocity: 0.0;
		property real pYVelocity: 0.0;
		property int pXPrev: 0;
		property int pYPrev: 0;

		id: oPrivate;
	}

	id: oRoot;
	preventStealing: true;

	onPressed: {

		console.log("onPressed");

		oPrivate.pTracing = true;
		oPrivate.pXVelocity = 0;
		oPrivate.pYVelocity = 0;
		oPrivate.pXPrev = mouse.x;
		oPrivate.pYPrev = mouse.y;
	}

	onPositionChanged: {

		if (!oPrivate.pTracing) return;

		var oCurrentXVelocity = (mouse.x - oPrivate.pXPrev);
		oPrivate.pXVelocity = (oPrivate.pXVelocity + oCurrentXVelocity) / 2.0;
		oPrivate.pXPrev = mouse.x;

		var oCurrentYVelocity = (mouse.y - oPrivate.pYPrev);
		oPrivate.pYVelocity = (oPrivate.pXVelocity + oCurrentYVelocity) / 2.0;
		oPrivate.pYPrev = mouse.y;

		if (oPrivate.pXVelocity > 15 && mouse.x > parent.width * 0.2) {
			oPrivate.pTracing = false;
			oRoot.sgSwipeRight();
		} else if (oPrivate.pXVelocity < -15 && mouse.x > parent.width * 0.2) {
			oPrivate.pTracing = false;
			oRoot.sgSwipeLeft();
		} else if (oPrivate.pYVelocity > 15 && mouse.y > parent.height * 0.2) {
			oPrivate.pTracing = false;
			oRoot.sgSwipeDown();
		} else if (oPrivate.pYVelocity < -15 && mouse.y < parent.height * 0.2) {
			oPrivate.pTracing = false;
			oRoot.sgSwipeUp();
		}
	}

	onClicked: console.log("onClicked");
	onPressAndHold: console.log("onPressAndHold");
	onSgSwipeLeft: console.log("onSgSwipeLeft");
	onSgSwipeDown: console.log("onSgSwipeDown");
	onSgSwipeRight: console.log("onSgSwipeRight");
	onSgSwipeUp: console.log("onSgSwipeUp");
	onReleased: console.log("onReleased");
}

