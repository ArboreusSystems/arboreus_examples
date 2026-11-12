/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file tablemodel.h
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 12/11/2026 at 14:24:48
 * */// --------------------------------------------------------------

// Class header
#include "alibusingjava_v6.h"


// -----------
/*!
	\fn

	Doc.
*/

ALibUsingJava_v6::ALibUsingJava_v6(QObject* parent) {

	_A_DEBUG << "ALibUsingJava_v6 created";
}


// -----------
/*!
	\fn

	Doc.
*/

ALibUsingJava_v6::~ALibUsingJava_v6(void) {

	_A_DEBUG << "ALibUsingJava_v6 deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

QString ALibUsingJava_v6::mMessageWithString(QString inMessage) {

	_A_DEBUG << "ALibUsingJava_v6::mMessageWithString";

	QJniObject oInJavaString = QJniObject::fromString(inMessage);
	QJniObject oResult = QJniObject::callStaticObjectMethod(
		"systems/arboreus/AJava/ATestClass",
		"mMessageWithString",
		"(Ljava/lang/String;)Ljava/lang/String;",
		oInJavaString.object<jstring>()
	);

	return oResult.isValid() ? oResult.toString() : QString("Invalid Java return");
}


// -----------
/*!
	\fn

	Doc.
*/

QString ALibUsingJava_v6::mMessage(void) {

	_A_DEBUG << "ALibUsingJava_v6::mMessage";

	QString oOutput = "Invalid Java return";

	QJniObject oHelper("systems/arboreus/AJava/ATestClass");
	if (oHelper.isValid()) {
		QJniObject oResult = oHelper.callObjectMethod(
			"mMessage",
			"()Ljava/lang/String;"
		);
		if (oResult.isValid()) oOutput = oResult.toString();
	}

	return oOutput;
}
