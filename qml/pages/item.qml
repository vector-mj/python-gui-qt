import QtQuick 2.0

Item {
    Rectangle {
        id: rectangle
        color: "#383737"
        border.color: "#00000000"
        border.width: 0
        clip: false
        anchors.leftMargin: 0
        anchors.topMargin: 0
        anchors.fill: parent

        Image {
            id: image
            x: 8
            y: 8
            width: 134
            height: 136
            source: "qrc:/qtquickplugin/images/template_image.png"
            fillMode: Image.PreserveAspectFit
        }

        Rectangle {
            id: rectangle1
            x: 8
            y: 206
            width: 134
            height: 28
            color: "#55ff00"
            radius: 18

            Text {
                id: element
                x: 38
                y: 8
                width: 59
                height: 13
                text: qsTr("Download")
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 9
                font.underline: false
                font.bold: false
                font.pixelSize: 13
            }
        }

        Text {
            id: element1
            y: 150
            width: 134
            height: 19
            color: "#ffffff"
            text: qsTr("Item Title")
            anchors.left: parent.left
            anchors.leftMargin: 8
            font.bold: true
            font.pixelSize: 13
        }

        Text {
            id: element2
            x: 8
            y: 168
            width: 134
            height: 32
            color: "#ffffff"
            text: qsTr("In publishing and graphic de, <br>Lorem ipsum is a placeholder ")
            clip: true
            font.pixelSize: 10
        }
    }

}
