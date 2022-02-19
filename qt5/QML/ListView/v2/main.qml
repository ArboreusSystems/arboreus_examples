/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file qtquickapplication/empty/main.qml.tmpl
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 13/06/2020 at 18:40:39
 * */// --------------------------------------------------------------

// System includes
import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

// Application includes
import "qrc:/js/Global.js" as GLOBAL;
import "qrc:/js/Colors.js" as COLORS;


// Application
ApplicationWindow {

	property bool pIsDesktop: true;

	id: oApplicationWindow;
	visible: true;
	width: pIsDesktop ? GLOBAL.desktopApplicationWidth() : maximumWidth;
	height: pIsDesktop ? GLOBAL.desktopApplicationHeight() : maximumHeight;
	title: qsTr("QML ListView demo");

	ListModel {

		id: oListModel;

		ListElement {name: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.";}
		ListElement {name: "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.";}
		ListElement {name: "If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text.";}
		ListElement {name: "On the other hand, we denounce with righteous indignation and dislike men who are so beguiled.";}
		ListElement {name: "But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system.";}
		ListElement {name: "The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested.";}
		ListElement {name: "The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.";}
		ListElement {name: "Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.";}
		ListElement {name: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.";}
		ListElement {name: "Nullam ac augue ac mauris luctus tincidunt eu in justo. Sed ullamcorper dictum dictum. Integer finibus neque eget metus facilisis, ut lobortis ante feugiat.";}
		ListElement {name: "Nulla faucibus libero nec ultricies facilisis.";}
		ListElement {name: "In venenatis sodales odio, sed tempor dolor.";}
		ListElement {name: "Mauris malesuada tortor ac finibus porta. In placerat tempus est vel semper. Aenean convallis feugiat diam, sed luctus magna accumsan vitae.";}
		ListElement {name: "Nulla ut quam id purus auctor efficitur. Morbi mattis sit amet magna quis pharetra. Praesent id erat diam. Maecenas scelerisque turpis a malesuada posuere.";}
		ListElement {name: "Cras malesuada dui sit amet tristique cursus. Nulla faucibus libero nec ultricies facilisis.";}
		ListElement {name: "Suspendisse quis arcu eu sapien lobortis faucibus. Suspendisse et sodales arcu. Aenean a augue at arcu scelerisque tincidunt a a lectus.";}
		ListElement {name: "Mauris viverra ante diam, vel ultricies enim molestie molestie. Pellentesque id viverra dui. In sit amet metus sed mi ullamcorper interdum a ut mi.";}
		ListElement {name: "Mauris malesuada tortor ac finibus porta. In placerat tempus est vel semper. Aenean convallis feugiat diam, sed luctus magna accumsan vitae.";}
		ListElement {name: "Quisque id urna gravida, laoreet ligula vitae, posuere ante. Suspendisse vitae elit non nulla blandit convallis eget et tortor.";}
		ListElement {name: "In placerat tempus est vel semper. Aenean convallis feugiat diam, sed luctus magna accumsan vitae.";}
	}

	Component {

		id: oListViewDelegate;

		Rectangle {

			property int pPadding: 15;

			id: oTextWrapper;
			color: oListView.currentIndex == index ? COLORS.mBlueDark() : COLORS.mWhite();
			clip: true;
			implicitHeight: oText.implicitHeight + 2 * oTextWrapper.pPadding;
			implicitWidth: oListView.width;

			Text {

				id: oText;
				text: model.name;
				font.pixelSize: 18;
				width: parent.width - 2 * oTextWrapper.pPadding;
				wrapMode: Text.WordWrap;
				color: oListView.currentIndex == index ? COLORS.mWhiteLight() : COLORS.mBlueDark();
				anchors.horizontalCenter: parent.horizontalCenter;
				anchors.verticalCenter: parent.verticalCenter;
				Component.onCompleted: {

					console.log("onCompleted",model.index,model.name);
				}
				Component.onDestruction: {

					console.log("onDestruction",model.index,model.name);
				}
			}

			MouseArea {

				id: oMouseArea;
				onClicked: oListView.currentIndex = index;
				anchors.fill: parent;
			}
		}
	}

	ListView {

		id: oListView;
		anchors.fill: parent;
		model: oListModel;
		spacing: 5;
		cacheBuffer: 100;
		delegate: oListViewDelegate;
		clip: true;
		onCurrentIndexChanged: {

			console.log("Selected oListView.currentIndex =",currentIndex);
		}
	}
}
