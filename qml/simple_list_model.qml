import QtQuick 2.0


Rectangle {
    x: 0
    y: 300
    width: 100
    height: 300
    color: "#CDCDCD"

    ListView {
        anchors.fill: parent
        model: simple_list_model
        delegate: Rectangle {
            height: 25
            width: parent.width
            Text { text: modelData }
        }
    }
}


