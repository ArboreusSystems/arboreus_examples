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
    if (gComponent.status === Component.Ready)
        mFinishCreateObject();
    else
        gComponent.statusChanged.connect(mFinishCreateObject);
}


// -----------
/*!
    \fn

    Function description.
*/

function mFinishCreateObject() {

    if (gComponent.status === Component.Ready) {
        gSprite = gComponent.createObject(gParentObject,gProperties);
        if (gSprite === null) {
            console.log("Can't create QML object");
        } else {
            console.log("QML Objct created");
        }
    } else if (gComponent.status === Component.Error) {
        console.log("Can't load QML component:", gComponent.errorString());
    }
}
