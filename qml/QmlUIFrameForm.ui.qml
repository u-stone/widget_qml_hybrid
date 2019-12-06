import QtQuick 2.4
import QtQuick.Layouts 1.0

Item {
    width: 268
    height: 312

    Image {
        id: image
        x: 0
        y: 0
        width: 268
        height: 312
        source: "../resource/recommend/recommend_normal.png"
    }

    MouseArea {
        id: mouseArea
        width: 268
        height: 312
    }

    Item {
        id: background
        x: 0
        y: 0
        width: 268
        height: 312

        Item {
            id: content
            x: 12
            y: 0
            width: 244
            height: 296

            Image {
                id: cover
                x: 17
                y: 0
                width: 210
                height: 126
                fillMode: Image.PreserveAspectCrop
                source: "../resource/recommend/recommend_placeholder.png"
            }

            Rectangle {
                id: rectangle
                x: 17
                y: 157
                width: 210
                height: 44
                color: "#ffffff"

                Rectangle {
                    id: rectangle1
                    x: 0
                    width: 71
                    height: 15
                    color: "#464d5c"
                    radius: 5
                    anchors.left: parent.left
                    border.width: 0
                    anchors.top: parent.top
                    anchors.topMargin: 5
                    scale: 1

                    Text {
                        id: text1
                        height: 15
                        color: "#ffffff"
                        text: qsTr("公务员考试")
                        anchors.right: parent.right
                        anchors.rightMargin: 5
                        styleColor: "#ffffff"
                        clip: false
                        opacity: 1
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignLeft
                        font.pixelSize: 12
                    }
                }

                Text {
                    id: text4
                    x: 67
                    y: 5
                    width: 143
                    color: "#2f3742"
                    text: qsTr("字体设计修炼设计字体设")
                    clip: true
                    anchors.right: parent.right
                    anchors.left: rectangle1.right
                    anchors.leftMargin: 6
                    anchors.top: rectangle1.top
                    anchors.verticalCenter: rectangle1.verticalCenter
                    font.pixelSize: 12
                    anchors.bottom: rectangle1.bottom
                }

                Text {
                    id: text5
                    x: 0
                    y: 29
                    width: 210
                    height: 15
                    color: "#2f3742"
                    text: qsTr("字体设计修炼设计大脑字体设计修炼")
                    anchors.right: parent.right
                    font.pixelSize: 12
                    anchors.bottom: parent.bottom
                    anchors.left: parent.left
                }
            }

            Text {
                id: text2
                x: 17
                y: 211
                width: 210
                height: 14
                color: "#334d6d"
                text: qsTr("50人报名")
                font.pixelSize: 12
            }

            Text {
                id: origianalPrice
                y: 252
                height: 16
                color: "#687583"
                text: qsTr("￥2999")
                anchors.left: currentPrice.right
                anchors.leftMargin: 5
                font.strikeout: true
                font.pixelSize: 12
            }

            BorderImage {
                id: image2
                y: 252
                width: 54
                height: 14
                anchors.top: currentPrice.top
                anchors.verticalCenter: currentPrice.verticalCenter
                anchors.bottom: currentPrice.bottom
                anchors.left: origianalPrice.right
                anchors.leftMargin: 5
                border.bottom: 3
                border.top: 3
                border.right: 3
                border.left: 8
                source: "../resource/recommend/activity_type.png"

                Text {
                    id: text3
                    color: "#ff3271"
                    text: qsTr("含优惠券")
                    anchors.right: parent.right
                    anchors.rightMargin: 5
                    anchors.left: parent.left
                    anchors.leftMargin: 8
                    font.pixelSize: 10
                }
            }

            TextEdit {
                id: currentPrice
                y: 252
                width: 63
                height: 16
                text: "￥19999.91"
                anchors.verticalCenter: origianalPrice.verticalCenter
                anchors.top: origianalPrice.top
                transformOrigin: Item.Center
                renderType: Text.QtRendering
                horizontalAlignment: Text.AlignLeft
                anchors.left: cover.left
                anchors.leftMargin: 0
                textFormat: Text.RichText
                activeFocusOnPress: false
                readOnly: true
                font.pixelSize: 12
            }
        }
    }
    states: [
        State {
            name: "hover"

            PropertyChanges {
                target: image
                source: "../resource/recommend/recommend_hover.png"
            }
        }
    ]
}


/*##^## Designer {
    D{i:7;anchors_width:61}
}
 ##^##*/
