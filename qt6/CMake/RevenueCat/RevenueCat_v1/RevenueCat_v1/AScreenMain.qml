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

		AButton {

			id: oButtonConfigure;
			text: "Configure";

			onClicked: {

				ARevenueCat.mConfigure();
			}
		}

		AButton {

			id: oButtonGetOfferings;
			text: "Get offerings";

			onClicked: {

				ARevenueCat.mGetOfferings();
			}
		}

		AButton {

			id: oButtonGetProducts;
			text: "Get products";

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
			delegate: AButton {

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

		AButton {

			id: oButtonManageSubscpriptions;
			text: "Manage";

			onClicked: {

				ARevenueCat.mManageSubscriptions();
			}
		}

		AButton {

			id: oButtonRestore;
			text: "Restore";

			onClicked: {

				ARevenueCat.mRestore();
			}
		}

		AButton {

			id: oButtonIsSubscribed;
			text: "Is Subscribed";

			onClicked: {

				ARevenueCat.mIsSubscribed("someID");
			}
		}
	}
}
