// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 28/10/2026 at 16:26:08
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick;
import QtQuick.Controls;

// Application includes


// Component
Rectangle {

	id: oRoot;
	color: "steelblue";

	Column {

		id: oColumn;
		anchors.horizontalCenter: parent.horizontalCenter;
		anchors.verticalCenter: parent.verticalCenter;
		spacing: 5;

		Button {

			id: oButtonTest;
			// anchors.verticalCenter: parent.verticalCenter;
			// anchors.horizontalCenter: parent.horizontalCenter;
			width: 200;
			height: 50;
			text: "Configure";

			onClicked: {

				ARevenueCat.mConfigure();
			}
		}

		Button {

			id: oButtonGetOfferings;
			// anchors.verticalCenter: parent.verticalCenter;
			// anchors.horizontalCenter: parent.horizontalCenter;
			width: 200;
			height: 50;
			text: "Get offerings";

			onClicked: {

				ARevenueCat.mGetOfferings();
			}
		}

		Button {

			id: oButtonGetProducts;
			// anchors.verticalCenter: parent.verticalCenter;
			// anchors.horizontalCenter: parent.horizontalCenter;
			width: 200;
			height: 50;
			text: "Get products";

			onClicked: {

				var oProducts = ARevenueCat.mGetProducts();
				console.debug("QML Products");
				oProducts.forEach((iProduct,iIndex) => {
					console.debug(
						"--------------------\n",
						"Product id:",iProduct.Identifier,
						"title:",iProduct.Title,
						"description:",iProduct.Description,
						"price:",iProduct.Price,
						"currency:",iProduct.Currency,
					);
				});
				console.debug(oProducts);
			}
		}
	}
}
