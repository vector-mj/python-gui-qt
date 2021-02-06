import QtQuick 2.0
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.0
//import "../asset"
import QtGraphicalEffects 1.0

Item {
    objectName: "homee"
    Rectangle {
        id: rectangle
        color: "#55aaff"
        anchors.fill: parent
        width : 910
        height: 388
        Text {
            id: element
            x: 376
            y: 146
            width: 161
            height: 70
            text: qsTr("Home Page")
            visible: false
            font.bold: false
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 20
            Rectangle {
                id: rectangle1
                height: 1
                color: "#000000"
                anchors.right: parent.right
                anchors.rightMargin: 0
                anchors.left: parent.left
                anchors.leftMargin: 0
                anchors.bottom: parent.bottom
            }
        }

        Rectangle {
            id: rectangle2
            y: 37
            height: 38
            color: "#ffffff"
            radius: 23.5
            anchors.left: parent.left
            anchors.leftMargin: 53
            anchors.right: parent.right
            anchors.rightMargin: 179

            TextField {
                id: textInput
                y: 10
                height: 38
                topPadding: 11
                font.family: "Arial"
                placeholderText: "Please Enter Your Name"
                padding: 0
                clip: true
                cursorPosition: left
                selectByMouse: true
                background: Rectangle {
                radius: 8
                color: "#ffffff"
                }
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignTop
                anchors.right: parent.right
                anchors.rightMargin: 22
                anchors.left: parent.left
                anchors.leftMargin: 20
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 14
                Keys.onEnterPressed: {
                    backend.welcomeText(textInput.text)
                }
            }
        }

        Label {
            id: labeltex
            x: 54
            y: 81
            width: 95
            height: 18
            color: "#232527"
            text: qsTr("Welcome")
            font.bold: false
            font.pointSize: 10
        }

        Button {
            id: buttonPush
            height: 38
            text: qsTr("Search")
            opacity: 1
            anchors.top: parent.top
            anchors.topMargin: 37
            anchors.left: rectangle2.right
            anchors.leftMargin: 26
            anchors.right: parent.right
            anchors.rightMargin: 53
            background: Rectangle{
                color:buttonPush.down? "#ffaa00" : "#55ff00"
                anchors.fill: parent
                radius: 8
                border.color: "#00000000"
            }
            onClicked: {
                backend.welcomeText(textInput.text)
            }
        }

        Rectangle {
            id: rectangle3
            color: "#26282a"
            radius: 19
            anchors.top: rectangle2.bottom
            anchors.topMargin: 30
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 36
            anchors.left: parent.left
            anchors.leftMargin: 53
            anchors.right: parent.right
            anchors.rightMargin: 53
            GridView {
                id: gridView
                x: 162
                y: 173
                anchors.top: parent.top
                anchors.topMargin: 33
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 17
                anchors.left: parent.left
                anchors.leftMargin: 20
                anchors.right: parent.right
                anchors.rightMargin: 20
                clip: true
                cellWidth: 80
                cellHeight: 80
                model: itemModel
                delegate: Item {
                    x: 5
                    height: 50
                    Column {
                        id:pashm
                        spacing: 5
                        Rectangle {
                            enabled: true
                            id:ppp
                            width: 40
                            height: 40
                            color: colorCode
                            radius: 8
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                        Text {
                            x: 5
                            color: "#ffffff"
                            text: name
                            anchors.horizontalCenter: parent.horizontalCenter
                            font.bold: true
                        }
                    }
                }

                GridView {
                    id: gridView1
                    anchors.fill: parent
                    cellHeight: 210
                    cellWidth: 160
                    delegate: Item {
                        x: 5
                        height: 50
                        Column {
                            spacing: 5
                            Rectangle {
                                id: rectangle4
                                width: 150
                                height: 180
                                color: "#ffaa00"
                                radius: 7
                                anchors.horizontalCenter: parent.horizontalCenter
                                Rectangle{
                                    id: rectangle5
                                    height: 100
                                    color: "#fbfbfb"
                                    radius: 3
                                    border.width: 1
                                    anchors.top: parent.top
                                    anchors.topMargin: 5
                                    anchors.right: parent.right
                                    anchors.rightMargin: 5
                                    anchors.left: parent.left
                                    anchors.leftMargin: 5
                                    Text {
                                        id: imgback
                                        text: qsTr("Item-Image")
                                        font.pointSize: 10
                                        anchors.horizontalCenter: parent.horizontalCenter
                                        anchors.verticalCenter: parent.verticalCenter
                                    }

                                }
                                Text {
                                    id: itemTitle
                                    text: qsTr("Item-Title")
                                    font.bold: true
                                    font.pointSize: 8
                                    anchors.left: parent.left
                                    anchors.leftMargin: 6
                                    anchors.top: rectangle5.bottom
                                    anchors.topMargin: 6

                                }

                            }

                            Text {
                                x: 5
                                color: "#ffffff"
                                text: name
                                font.pointSize: 8
                                anchors.horizontalCenter: parent.horizontalCenter
                                font.bold: true
                            }
                        }
                    }
                    model: ListModel {
                        ListElement {
                            name: "Yellow"
                            colorCode: "yellow"
                        }

                        ListElement {
                            name: "Red"
                            colorCode: "red"
                        }
                        ListElement {
                            name: "Orange"
                            colorCode: "orange"
                        }
                        ListElement {
                            name: "Blue"
                            colorCode: "blue"
                        }

                        ListElement {
                            name: "Green"
                            colorCode: "green"
                        }
                        ListElement {
                            name: "Yellow"
                            colorCode: "yellow"
                        }

                        ListElement {
                            name: "Red"
                            colorCode: "red"
                        }
                        ListElement {
                            name: "Orange"
                            colorCode: "orange"
                        }
                        ListElement {
                            name: "Blue"
                            colorCode: "blue"
                        }

                        ListElement {
                            name: "Green"
                            colorCode: "green"
                        }
                        ListElement {
                            name: "Yellow"
                            colorCode: "yellow"
                        }

                        ListElement {
                            name: "Red"
                            colorCode: "red"
                        }
                        ListElement {
                            name: "Orange"
                            colorCode: "orange"
                        }
                        ListElement {
                            name: "Blue"
                            colorCode: "blue"
                        }

                        ListElement {
                            name: "Green"
                            colorCode: "green"
                        }
                    }
                }
            }

            Label {
                id: labelTime
                x: 233
                y: 6
                width: 174
                height: 15
                color: "#4fce8c"
                text: qsTr("Now is 22:34:42 PM of 2021/01/19")
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 8
            }
        }

    }
    Connections{
        target: backend
        function onSetName(textr){
            labeltex.text = textr
        }
        function onPrintTime(tim){
            labelTime.text = tim
        }

    }

}





/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
