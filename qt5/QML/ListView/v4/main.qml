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
import Qt.labs.qmlmodels 1.0

// Application includes
import "qrc:/js/Global.js" as GLOBAL;
import "qrc:/js/Colors.js" as COLORS;

// Components includes
import "qrc:/qml/";


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

		ListElement {type: 1; text: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.";}
		ListElement {type: 2; text: "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.";}
		ListElement {type: 1; text: "If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text.";}
		ListElement {type: 1; text: "On the other hand, we denounce with righteous indignation and dislike men who are so beguiled.";}
		ListElement {type: 3; text: "But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system.";}
		ListElement {type: 2; text: "The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested.";}
		ListElement {type: 3; text: "The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.";}
		ListElement {type: 1; text: "Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.";}
		ListElement {type: 1; text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.";}
		ListElement {type: 3; text: "Nullam ac augue ac mauris luctus tincidunt eu in justo. Sed ullamcorper dictum dictum. Integer finibus neque eget metus facilisis, ut lobortis ante feugiat.";}
		ListElement {type: 2; text: "Nulla faucibus libero nec ultricies facilisis.";}
		ListElement {type: 2; text: "In venenatis sodales odio, sed tempor dolor.";}
		ListElement {type: 2; text: "Mauris malesuada tortor ac finibus porta. In placerat tempus est vel semper. Aenean convallis feugiat diam, sed luctus magna accumsan vitae.";}
		ListElement {type: 1; text: "Nulla ut quam id purus auctor efficitur. Morbi mattis sit amet magna quis pharetra. Praesent id erat diam. Maecenas scelerisque turpis a malesuada posuere.";}
		ListElement {type: 3; text: "Cras malesuada dui sit amet tristique cursus. Nulla faucibus libero nec ultricies facilisis.";}
		ListElement {type: 2; text: "Suspendisse quis arcu eu sapien lobortis faucibus. Suspendisse et sodales arcu. Aenean a augue at arcu scelerisque tincidunt a a lectus.";}
		ListElement {type: 3; text: "Mauris viverra ante diam, vel ultricies enim molestie molestie. Pellentesque id viverra dui. In sit amet metus sed mi ullamcorper interdum a ut mi.";}
		ListElement {type: 2; text: "Mauris malesuada tortor ac finibus porta. In placerat tempus est vel semper. Aenean convallis feugiat diam, sed luctus magna accumsan vitae.";}
		ListElement {type: 2; text: "Quisque id urna gravida, laoreet ligula vitae, posuere ante. Suspendisse vitae elit non nulla blandit convallis eget et tortor.";}
		ListElement {type: 3; text: "In placerat tempus est vel semper. Aenean convallis feugiat diam, sed luctus magna accumsan vitae.";}
	}

	DelegateChooser {

		id: oListViewDelegateChooser;
		role: "type";

		DelegateChoice {roleValue: 1; DelegateType1 {id: oListViewDelegate1;}}
		DelegateChoice {roleValue: 2; DelegateType2 {id: oListViewDelegate2;}}
		DelegateChoice {roleValue: 3; DelegateType3 {id: oListViewDelegate3;}}
	}

	ListView {

		id: oListView;
		anchors.fill: parent;
		model: oListModel;
		spacing: 5;
		cacheBuffer: 100;
		delegate: oListViewDelegateChooser;
		clip: true;
		footer: Rectangle {

			id: oListViewFooter;
			color: COLORS.mTransparent();
			height: 25;
			width: oListView.width;
		}
		header: Rectangle {

			id: oListViewHeader;
			color: COLORS.mTransparent();
			height: 15;
			width: oListView.width;
		}
		onCurrentIndexChanged: {

			console.log("Selected oListView.currentIndex =",currentIndex);
		}
		onCountChanged: {

			var newIndex = oListView.count - 1;
			oListView.positionViewAtEnd();
			oListView.currentIndex = newIndex;
		}
	}
}
