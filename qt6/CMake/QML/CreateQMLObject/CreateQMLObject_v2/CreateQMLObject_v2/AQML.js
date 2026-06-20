// ----------------------------------------------------------
/*!
    \module
    \title
    \brief Template file files/js/file.js

    \list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 20/06/2026 at 13:26:10
    \endlist
*/
// ----------------------------------------------------------


var gComponent = null;
var gSprite = null;
var gParentObject = null;
var gProperties = null;


// -----------
/*!
    \fn

    Function description.
*/

function mCreateObject(inParentObject,inComponent,inProperties) {

	gParentObject = inParentObject;
	gProperties = inProperties

	gComponent = Qt.createComponent(inComponent);
	if (
		gComponent.status === Component.Ready ||
		gComponent.status === Component.Error
	) {
		mFinishCreateObject();
	} else {
		gComponent.statusChanged.connect(mFinishCreateObject);
	}
}


// -----------
/*!
    \fn

    Function description.
*/

function mFinishCreateObject() {

    if (gComponent.status === Component.Ready) {
		var oIncubator = gComponent.incubateObject(gParentObject,gProperties);
		if (oIncubator.status === Component.Ready) {
			gSprite = oIncubator.object;
			console.log("QML object created with incubator");
		} else {
			oIncubator.onStatusChanged = function(inStatus) {
				if (inStatus === Component.Ready) {
					gSprite = oIncubator.object;
					console.log("QML object created with incubator");
				}
			}
		}
    } else if (gComponent.status === Component.Error) {
        console.log("Can't load QML component:", gComponent.errorString());
    }
}
