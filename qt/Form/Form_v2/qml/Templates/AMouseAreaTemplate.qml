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
	signal sgSwipeUp();
	signal sgSwipeDown();

	QtObject {

		property real pPreviousX: 0;
		property real pPreviousY: 0;
		property real pVelocityX: 0.0;
		property real pVelocityY: 0.0;
		property int pStartX: 0;
		property int pStartY: 0;
		property bool pTracing: false;

		id: oPrivate;
	}

	id: oRoot;
	preventStealing: true;

	onPressed: {

		console.log("onPressed");

		oPrivate.pStartX = mouse.x;
		oPrivate.pStartY = mouse.y;
		oPrivate.pPreviousX = mouse.x;
		oPrivate.pPreviousY = mouse.y;
		oPrivate.pVelocityX = 0;
		oPrivate.pVelocityY = 0;
		oPrivate.pTracing = true;
	}

	onPositionChanged: {

		if (!oPrivate.pTracing) return;

		var oCurrVelX = (mouse.x - oPrivate.pPreviousX);
		var oCurrVelY = (mouse.y - oPrivate.pPreviousY);

		oPrivate.pVelocityX = (oPrivate.pVelocityX + oCurrVelX) / 2.0;
		oPrivate.pVelocityY = (oPrivate.pVelocityY + oCurrVelY) / 2.0;

		oPrivate.pPreviousX = mouse.x;
		oPrivate.pPreviousY = mouse.y;

		if (oPrivate.pPreviousX > 15 && mouse.x > oRoot.width * 0.25 ) {
			oPrivate.pTracing = false;
			oRoot.sgSwipeRight()
		} else if (oPrivate.pPreviousX < -15 && mouse.x < oRoot.width * 0.75 ) {
			oPrivate.pTracing = false;
			oRoot.sgSwipeLeft()
		} else if (oPrivate.pVelocityY > 15 && mouse.y > oRoot.height * 0.25 ) {
			oPrivate.pTracing = false;
			oRoot.sgSwipeDown();
		} else if (oPrivate.pVelocityY < -15 && mouse.y < oRoot.height * 0.75 ) {
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

