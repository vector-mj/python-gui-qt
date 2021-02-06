import QtQuick 2.0

Item {
    Rectangle {
        id: rectangle
        color: "#505050"
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        border.width: 0
        anchors.fill: parent
        width : 910
        height: 388
        Text {
            id: element
            x: 376
            y: 146
            width: 161
            height: 70

            color: "#ffffff"
            text: qsTr("Setting Page")
            visible: true
            font.bold: false
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 20
            Rectangle {
                id: rectangle1
                height: 1
                color: "#ffffff"
                anchors.right: parent.right
                anchors.rightMargin: 0
                anchors.left: parent.left
                anchors.leftMargin: 0
                anchors.bottom: parent.bottom
            }

        }

        Rectangle {
                id: rect
                width: 50; height: 50
                color: "red"
                visible: false
                opacity: (600.0 - rect.x) / 600

                MouseArea {
                    id: mouseArea
                    acceptedButtons: Qt.RightButton|Qt.LeftButton
                    anchors.fill: parent
                    onClicked: {
                        if(Keys.onEnterPressed == true){
                            drag.target= rect
                            drag.axis= Drag.XAxis|Drag.YAxis
                            drag.minimumX= 0
                            drag.maximumX= 1000
                        }else{
                            drag.target=null
                            rect.anchors.leftMargin=8
                            rect.anchors.topMargin=8
                        }
                    }
                }
            }
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:4;anchors_x:8;anchors_y:8}
}
##^##*/
