import QtQuick 2.9
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.3

Item {
    width: 268
    height: 312

    Image {
        id: imageBg
        anchors.fill: parent
        source: "./res/recommend_normal.png"

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            hoverEnabled: true

            onEntered: {
                imageBg.state = "hover"
            }
            onExited: {
                // reset to default
                imageBg.state = "normal"
            }
        }

        states: [
            State {
                name: "hover"

                PropertyChanges {
                    target: imageBg
                    source: "./res/recommend_hover.png"
                }
            },
            State {
                name: "normal"

                PropertyChanges {
                    target: imageBg
                    source: "./res/recommend_normal.png"
                }
            }

        ]
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
                id: gaussianlayer
                anchors.left: cover.left
                anchors.leftMargin: 20
                anchors.top: cover.top
                anchors.topMargin: 20
                anchors.right: cover.right
                anchors.rightMargin: 20
                anchors.bottom: cover.bottom
                anchors.bottomMargin: 31
                fillMode: Image.PreserveAspectCrop
//                source: "file:///Users/hj/Downloads/image-1.jpg"
            }

            GaussianBlur {
                anchors.fill: cover
                source: gaussianlayer
                radius: 15
                samples: 31
            }

            Image {
                id: cover
                anchors.left: parent.left
                anchors.leftMargin: 17
                width: 210
                height: 126
                fillMode: Image.PreserveAspectCrop
                source: "file:///Users/hj/Downloads/image-1.jpg"

                layer.enabled: true
                layer.effect: OpacityMask {
                    maskSource: Item {
                        width: cover.width
                        height: cover.height
                        Rectangle {
                            anchors.centerIn: parent
                            anchors.fill: parent
                            radius: 5
                        }
                    }
                }
            }

            Rectangle {
                id: textContentArea
                anchors.left: parent.left
                anchors.leftMargin: 17
                anchors.right: parent.right
                anchors.rightMargin: 17
                anchors.top: cover.bottom
                anchors.topMargin: 31
                height: 44
                color: "transparent"



                ColumnLayout {
                    anchors.fill: parent
                    spacing: 3

                    RowLayout {
                        id: firstLine
                        height: 15
                        anchors.left: parent.left

                        Rectangle {
                            id: categoryContainer
                            anchors.left: parent.left
                            color: "#464d5c"
                            radius: 5
                            border.width: 0
                            anchors.top: parent.top
                            anchors.topMargin: 5
                            width: childrenRect.width + 6

                            Text {
                                id: categoryText
                                height: 15
                                color: "#ffffff"
                                text: categoryName
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

                        TextEdit {
                            id: titleHeader
                            anchors.left: categoryContainer.right
                            anchors.leftMargin: 5
                            anchors.right: parent.right
                            color: "#2f3742"
                            font.pixelSize: 16
                            font.weight: Font.Bold
//                            Rectangle {
//                                anchors.fill: parent
//                                color: "gray"
//                            }
                        }
                    }

                    Text {
                        id: titleRest
                        anchors.left: parent.left
                        anchors.right: parent.right

                        color: "#2f3742"

                        font.pixelSize: 16
                        font.weight: Font.Bold
                        elide: Text.ElideRight

//                        Rectangle {
//                            anchors.fill: parent
//                            color: "red"
//                        }
                    }

                }
            }

            Text {
                id: text2
                x: 17
                y: 211
                width: 210
                height: 14
                color: "#334d6d"
                text: {
                    if (countType == 1) {
                        showCount + qsTr("参与")
                    } else {
                        showCount + qsTr("学习")
                    }
                }

                font.pixelSize: 12
            }

            RowLayout {
                id: priceLayout
                y: 252
                height: 20
                anchors.left: parent.left
                anchors.leftMargin: 17
                spacing: 5

                TextEdit {
                    id: currentPriceEdit
                    height: 16
                    text: Number(currentPrice).toLocaleString()
                    transformOrigin: Item.Center
                    renderType: Text.QtRendering
                    horizontalAlignment: Text.AlignLeft
                    textFormat: Text.RichText
                    activeFocusOnPress: false
                    readOnly: true
                    font.pixelSize: 12
                }

                Text {
                    id: origianalPriceEdit
                    height: 16
                    color: "#687583"
                    text: originalPrice
                    font.strikeout: true
                    font.pixelSize: 12
                }

                BorderImage {
                    id: imageDiscount
                    width: childrenRect.width + 5
                    height: 14

                    anchors.verticalCenter: parent.verticalCenter

                    border.bottom: 3
                    border.top: 3
                    border.right: 3
                    border.left: 8

                    source: "./res/activity_type.png"

                    Text {
                        id: discountType
                        color: "#ff3271"
                        text: activityName
                        anchors.centerIn: parent
                        leftPadding: 8
                        rightPadding: 3
                        font.pixelSize: 10
                    }
                }
            }


        }
    }

    TextMetrics {
        id: textMetrics
        font.family: "Arial"
        elide: Text.ElideRight
        text: contentName
    }

    function calcFirstLineString() {
        var line = textMetrics.text
        var ret = line.substring(0, line.length - 1)
        console.log("first line: " + ret)
        return ret
    }

    function calcSecondLineString() {
        var line = calcFirstLineString()
        var secondLine = textMetrics.text.substring(line)
        console.log("second line: " + secondLine)
        return secondLine
    }

    Component.onCompleted: {
        console.log(titleHeader.width)
        textMetrics.elideWidth = titleHeader.width
        titleHeader.text = calcFirstLineString()
        titleRest.text = calcSecondLineString()
    }
}
