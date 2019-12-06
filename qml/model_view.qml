import QtQuick 2.0

Item {
    width: 300
    height: 300
    ListModel {
        id: nameModal
        ListElement { name: "Alice"; team: "Crypto" }
        ListElement { name: "Bov";   team: "Crypto" }
        ListElement { name: "Jane";  team: "QA"}
        ListElement { name: "Harry"; team: "QA" }
        ListElement { name: "Pot";  team: "Graph" }
        ListElement { name: "Wendy";  team: "Graph" }
    }

    Component {
        id: nameDelegate
        Text {
            text: name
            font.pixelSize: 24
            anchors.left: parent.left
            anchors.leftMargin: 2
        }
    }

    Component {
        id: petdelegate
        Text {
            id: label
            font.pixelSize: 24
            text: if (index == 0)
                label.text = name + " (default)"
            else
                text: name
        }
    }

    ListView {
        id: contacts
        anchors.fill: parent
//        clip: true
        model: nameModal
        delegate: petdelegate
//        header: bannerComponent
        focus: true
//        footer: Rectangle {
//            width: parent.width; height: 30;
//            gradient: clubcolors
//        }
        highlight: Rectangle {
            width: parent.width
            color: "lightblue"
        }
        section {
            property: "team"
            criteria: ViewSection.FullString
            delegate: Rectangle {
                color: "#b0dfb0"
                width: parent.width
                height: childrenRect.height + 4
                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pixelSize: 16
                    font.bold: true
                    text: section
                }

            }
        }
    }

    Component {
        id: bannerComponent
        Rectangle {
            id: banner
            width: parent.width; height: 50;
            gradient: clubcolors
            border { color: "#95E345"; width: 2}
            Text {
                anchors.centerIn: parent
                text: qsTr("Club Members")
                font.pixelSize: 24
            }
        }
    }
    Gradient {
        id: clubcolors
        GradientStop { position: 0.0; color: "#8EE22F" }
        GradientStop { position: 0.66; color: "#7ED2EE" }
    }

    MouseArea {
        anchors.left: contacts.left
        anchors.right: contacts.right
        anchors.top: contacts.top
        anchors.bottom: contacts.bottom

        onClicked: {
            nameModal.append({"name": "new people", "team": "new team"})
        }
    }


    Rectangle {
        x: 300
        width: 200
        height: 200

        ListModel {
            id: fruitModel
            property string language: "en"
            ListElement {
                name: "Apple"
                cost: 2.45
            }
            ListElement {
                name: "Orange"
                cost: 3.24
            }
            ListElement {
                name: "pear"
                cost: 1.34
            }
        }

        Component {
            id: fruitDelegate
            Row {
                id: fruit
                Text {  text: "Fruit: " + name; color: fruit.ListView.view.fruit_color }
                Text {  text: " Cost: $" + cost }
                Text {  text: " Language: " + fruit.ListView.view.model.language }
            }
        }

        ListView {
            property color fruit_color: "green"
            model: fruitModel
            delegate: fruitDelegate
            anchors.fill: parent
        }
    }

    Rectangle {
        x: 500
        width: 100
        height: 100

        Component {
            id: integerModel
            Text {
                text: "I am a member " + (index + 1)
            }
        }

        ListView {
            anchors.fill: parent
            model: 5
            anchors.leftMargin: 2
            delegate: integerModel
        }
    }


}



