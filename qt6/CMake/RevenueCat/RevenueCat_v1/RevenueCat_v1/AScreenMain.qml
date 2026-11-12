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
import QtQuick.Layouts;

// Application includes


// Component
Rectangle {

	id: oRoot;
	color: "steelblue";

	Row {

		id: oRowTop;
		anchors.top: parent.top;
		anchors.topMargin: 20;
		anchors.horizontalCenter: parent.horizontalCenter;
		spacing: 7;

		Button {

			id: oButtonConfigure;
			width: 120;
			height: 50;
			text: "Configure";

			background: Rectangle {

				anchors.fill: parent;
				color: "indigo";
			}

			onClicked: {

				ARevenueCat.mConfigure();
			}
		}

		Button {

			id: oButtonGetOfferings;
			width: 120;
			height: 50;
			text: "Get offerings";

			background: Rectangle {

				anchors.fill: parent;
				color: "indigo";
			}

			onClicked: {

				ARevenueCat.mGetOfferings();
			}
		}

		Button {

			id: oButtonGetProducts;
			width: 120;
			height: 50;
			text: "Get products";

			background: Rectangle {

				anchors.fill: parent;
				color: "indigo";
			}

			onClicked: {

				var oProducts = ARevenueCat.mGetProducts();
				console.debug("QML Products");
				oProductList.clear();
				oProducts.forEach((iProduct,iIndex) => {
					oProductList.append({
						RCIdentifier: iProduct.RCIdentifier,
						SKIdentifier: iProduct.SKIdentifier,
						Title: iProduct.Title,
						Description: iProduct.Description,
						Price: iProduct.Price,
						Currency: iProduct.Currency
					});
					console.debug(
						"--------------------\n",
						"RCIdentifier:",iProduct.RCIdentifier,
						"SKIdentifier:",iProduct.SKIdentifier,
						"title:",iProduct.Title,
						"description:",iProduct.Description,
						"price:",iProduct.Price,
						"currency:",iProduct.Currency,
					);
				});
			}
		}
	}

	Column {

		id: oColumn;
		width: parent.width * 0.8;
		anchors.top: oRowTop.bottom;
		anchors.topMargin: 15;
		anchors.bottom: oRowBottom.top;
		anchors.horizontalCenter: parent.horizontalCenter;
		spacing: 10;

		ListModel {

			id: oProductList;
		}

		Repeater {

			id: oRepeater;
			model: oProductList;
			delegate: Button {

				width: parent.width;
				height: 50;
				text: model.Title;
				background: Rectangle {

					anchors.fill: parent;
					color: "deeppink";
				}

				onClicked: {

					console.debug("Clicked button with ID:",model.RCIdentifier);
					ARevenueCat.mSubscribeWithRCProduct(model.RCIdentifier);
				}
			}
		}
	}

	Row {

		id: oRowBottom;
		anchors.bottom: parent.bottom;
		anchors.bottomMargin: 23;
		anchors.horizontalCenter: parent.horizontalCenter;
		spacing: 7;

		Button {

			id: oButtonManageSubscpriptions;
			width: 120;
			height: 50;
			text: "Manage Subscriptions";

			background: Rectangle {

				anchors.fill: parent;
				color: "indigo";
			}

			onClicked: {

				ARevenueCat.mManageSubscriptions();
			}
		}

		Button {

			id: oButtonRestore;
			width: 120;
			height: 50;
			text: "Restore";

			background: Rectangle {

				anchors.fill: parent;
				color: "indigo";
			}

			onClicked: {

				ARevenueCat.mRestore();
			}
		}

		Button {

			id: oButtonIsSubscribed;
			width: 120;
			height: 50;
			text: "Restore";

			background: Rectangle {

				anchors.fill: parent;
				color: "indigo";
			}

			onClicked: {

				ARevenueCat.mIsSubscribed("someID");
			}
		}
	}
}
