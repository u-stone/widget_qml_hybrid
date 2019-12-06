import QtQuick 2.0
import QtQuick.Controls 2.0
import com.hujiang.qt.FormChildWidget 1.0
import com.hujiang.qt.MyObject 1.0
import "qrc:/js/java_script.js" as JsFunc

Item {
    width: 200; height: 400
    Rectangle {
        id: content
        anchors.fill: parent

        color: "#b6c9bc"
        visible: true

        FormChildWidget {
            id: childWidget
        }

        TextField {
            id: edit
            text: childWidget.userName
            placeholderText: qsTr("User name")
            width: parent.width
            anchors.centerIn: parent

            onTextChanged: {
                label.text = text + ": ---"
                childWidget.userName = text
            }
            onTextEdited: JsFunc.func()
        }

        MyObject {
            id: obj
            name: edit.text
            age: edit.text
        }

        Text {
            width: parent.width
            height: 40
            anchors.top: edit.bottom
            id: label
            text: obj.name + " : " + obj.age
        }

        Connections {
            target: label

        }
    }
}
