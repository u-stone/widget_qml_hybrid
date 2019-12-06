import QtQuick 2.7
import QtQuick.Controls 2.2
import CustomQml.Recommend 1.0

Rectangle {
    color: "lightgray"

    Component {
        id: recomment_delegate
        RecommendCard {
        }
    }

    ScrollView {
        id: scrollView
        anchors.fill: parent
        clip: true
        ScrollBar.vertical.interactive: true

        ListView {
            id: listview
            model: recomment_model
            delegate: recomment_delegate
            cacheBuffer: 2000

//            anchors.fill: parent
//            anchors.leftMargin: 100

//            keyNavigationEnabled: true

//            ScrollBar.vertical: ScrollBar {
//                id: scrollBar
//                onActiveChanged: {
//                    active = true;
//                }
//            }

        }

//        MouseArea {
//            parent: scrollView
//            anchors.fill: parent
//            onWheel: {
//            }
//        }
    }



}
