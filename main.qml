import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.3
import QtGraphicalEffects 1.12
import "qml/contorls"

Window {
    id: mainWindow
    width: 1000
    height: 500
    minimumWidth: 800
    minimumHeight: 500
    color: "#00000000"
    title: qsTr("Hi")
    visible: true
    flags: Qt.Window | Qt.FramelessWindowHint
    property int isMax:10
    QtObject{
        id:internal

        function maxim(){
            if(isMax === 10){
                mainWindow.isMax = 0
                print(mainWindow.window)
                return mainWindow.showMaximized()
            }else{
                mainWindow.isMax = 10
                return mainWindow.showNormal()
            }
        }
    }

    MouseArea {
        id: resizeLeft
        width: 10
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 10
        cursorShape: Qt.SizeHorCursor
        DragHandler{
            target: null
            onActiveChanged: if(active){ mainWindow.startSystemResize(Qt.LeftEdge) }
        }
    }
    MouseArea {
        id: resizeRight
        width: 10
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 10
        cursorShape: Qt.SizeHorCursor
        DragHandler{
            target: null
            onActiveChanged: if(active){ mainWindow.startSystemResize(Qt.RightEdge) }
        }
    }
    MouseArea {
        id: resizeBottom
        height: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        cursorShape: Qt.SizeVerCursor
        DragHandler{
            target: null
            onActiveChanged: if(active){ mainWindow.startSystemResize(Qt.BottomEdge) }
        }
    }
    MouseArea {
        id: resizeTop
        height: 10
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.topMargin: 0
        cursorShape: Qt.SizeVerCursor
        DragHandler{
            target: null
            onActiveChanged: if(active){ mainWindow.startSystemResize(Qt.TopEdge) }
        }
    }
    Rectangle {
        id: bg
        color: "#00000000"
        anchors.fill: parent
        DropShadow{
            color: "#40000000"
            anchors.fill:bg
            horizontalOffset: 0
            verticalOffset: 0
            radius: 10
            samples: 16
            source: bg
            z:0
        }
        Rectangle {
            id: appContent
            x: 10
            y: 10
            height: 480
            color: "#505050"
            radius: 1
            border.color: "#00000000"
            border.width: 1
            anchors.right: parent.right
            anchors.rightMargin: mainWindow.isMax
            anchors.left: parent.left
            anchors.leftMargin: mainWindow.isMax
            anchors.bottom: parent.bottom
            anchors.bottomMargin: mainWindow.isMax
            anchors.top: parent.top
            anchors.topMargin: mainWindow.isMax

            Rectangle {
                id: topBar
                height: 70
                color: "#33353b"
                border.color: "#00000000"
                anchors.right: parent.right
                anchors.rightMargin: 0
                anchors.left: parent.left
                anchors.leftMargin: 0
                anchors.top: parent.top
                anchors.topMargin: 0

                Row {
                    id: row
                    anchors.fill: parent

                    CustomBtn {
                        id: toggleBtn_
                        width: 70
                        height: 70
                        colorDefault: "#33353b"
                        onClicked: menuToggleAnimation.running =true
                    }


                    Label {
                        id: img
                        width: 782
                        height: 38
                        color: "#ffffff"
                        text: qsTr("My Application Title")
                        anchors.top: parent.top
                        anchors.topMargin: 0
                        font.bold: true
                        leftPadding: 10
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignLeft
                        padding: 0
                        anchors.left: toggleBtn_.right
                        anchors.leftMargin: 0
                        DragHandler{
                            onActiveChanged: if(active){
                                                 mainWindow.startSystemMove()
                                             }
                        }
                    }

                    Rectangle {
                        id: title
                        color: "#3e3e3e"
                        anchors.left: toggleBtn_.right
                        anchors.leftMargin: 0
                        anchors.right: parent.right
                        anchors.rightMargin: 0
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 0
                        anchors.top: img.bottom
                        anchors.topMargin: 0

                        Label {
                            id: label
                            color: "#ffffff"
                            text: qsTr("Application description")
                            leftPadding: 10
                            anchors.fill: parent
                            horizontalAlignment: Text.AlignLeft
                            verticalAlignment: Text.AlignVCenter
                        }
                    }

                    Row {
                        id: menu
                        x: 0
                        width: 140
                        height: 35
                        rightPadding: 0
                        leftPadding: 0
                        topPadding: 0
                        bottomPadding: 0
                        padding: 0
                        anchors.right: parent.right
                        anchors.rightMargin: 0
                        anchors.top: parent.top
                        anchors.topMargin: 0
                        anchors.bottom: title.top
                        anchors.bottomMargin: 0

                        CustomBtnMenu {
                            id: minimize
                            width: 38
                            height: 38
                            anchors.right: maximize.left
                            anchors.rightMargin: 0
                            colorDefault: "#33353b"
                            btnIconSource: "images/svg/s_min.svg"
                            anchors.top: parent.top
                            anchors.topMargin: 0
                            topPadding: 6
                            bottomPadding: 0
                            onClicked: mainWindow.showMinimized()
                        }

                        CustomBtnMenu {
                            id: maximize
                            width: 38
                            height: 38
                            anchors.right: close.left
                            anchors.rightMargin: 0
                            colorDefault: "#33353b"
                            btnIconSource: "images/svg/s_max.svg"
                            anchors.top: parent.top
                            anchors.topMargin: 0
                            onClicked: internal.maxim()

                        }

                        CustomBtnMenu {
                            id: close
                            width: 38
                            height: 38
                            anchors.right: parent.right
                            anchors.rightMargin: 0
                            colorDefault: "#33353b"
                            colorPressed: "#ff007f"
                            colorMouseOver: "#23272e"
                            btnIconSource: "images/svg/close.svg"
                            anchors.top: parent.top
                            anchors.topMargin: 0
                            onClicked: mainWindow.close()
                        }
                    }
                }
            }

            Rectangle {
                id: menuBar
                width: 70
                color: "#1c1d20"
                border.color: "#00000000"
                anchors.left: parent.left
                anchors.leftMargin: 0
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
                anchors.top: topBar.bottom
                anchors.topMargin: 0
                clip: true

                PropertyAnimation{
                    id:menuToggleAnimation
                    property: "width"
                    to:if(menuBar.width == 70){
                           to:250
                       }else{
                           to:70
                       }

                    target: menuBar
                    duration:300
                    easing.type : "InOutQuint"
                }

                Column {
                    id: column
                    width: 70
                    anchors.fill: parent

                    BtnLeft {
                        id: home
                        width: menuBar.width
                        btnIconSource: "images/svg/home.svg"
                        text: qsTr("Home")
                        enabled: true
                        btnColorDefault: "#33353b"
                        isActiveMenu: true
                        anchors.left: parent.left
                        anchors.leftMargin: 0
                        onClicked: {
                            home.isActiveMenu =true
                            btnSetting.isActiveMenu = false
                            stackView.push(Qt.resolvedUrl("qml/pages/home.qml"))
                        }
                    }

                    BtnLeft {
                        id: home1
                        width: 250
                        text: qsTr("Open")
                        spacing: 5
                        hoverEnabled: true
                        enabled: true
                        btnIconSource: "images/real/open_icon.svg"
                        anchors.left: parent.left
                        isActiveMenu: true
                        anchors.leftMargin: 0
                        btnColorDefault: "#33353b"
                    }

                    BtnLeft {
                        id: home2
                        width: menuBar.width
                        text: qsTr("Save")
                        btnIconSource: "images/real/save_icon.svg"
                        anchors.left: parent.left
                        isActiveMenu: true
                        anchors.leftMargin: 0
                        btnColorDefault: "#33353b"
                    }

                }

                BtnLeft {
                    id: btnSetting
                    x: 0
                    y: 180
                    width: menuBar.width
                    text: qsTr("Setting")
                    btnIconSource: "images/real/settings_icon.svg"
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 21
                    anchors.left: parent.left
                    isActiveMenu: true
                    anchors.leftMargin: 0
                    btnColorDefault: "#33353b"
                    onClicked: {
                        home.isActiveMenu =false
                        btnSetting.isActiveMenu = true
                        stackView.push(Qt.resolvedUrl("qml/pages/setting.qml"))
                    }
                }
            }

            Rectangle {
                id: pageContent
                color: "#707070"
                anchors.left: menuBar.right
                anchors.leftMargin: 0
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.top: parent.top
                border.color: "#00000000"
                anchors.rightMargin: 0
                anchors.bottomMargin: 22
                anchors.topMargin: 70
                clip: true
                StackView {
                    id: stackView
                    anchors.fill: parent
                    initialItem: Qt.resolvedUrl("qml/pages/home.qml")
                }
            }

            Rectangle {
                id: rectangle
                Text {
                    id: name
                    width: 892
                    color: "#ffffff"
                    text: qsTr("Application status")
                    font.bold: false
                    font.pointSize: 7
                    leftPadding: 10
                    anchors.left: parent.left
                    anchors.leftMargin: 0
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 0
                    anchors.top: parent.top
                    anchors.topMargin: 0
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                }

                MouseArea {
                    id: resizeBottomRight
                    x: 900
                    y: 12
                    width: 20
                    height: 20
                    anchors.right: parent.right
                    anchors.rightMargin: 0
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 0
                    cursorShape: Qt.SizeFDiagCursor
                    DragHandler{
                        onActiveChanged: if(active){ mainWindow.startSystemResize(Qt.BottomEdge | Qt.RightEdge) }
                    }
                }
                color: "#4a4a4a"
                anchors.right: parent.right
                anchors.rightMargin: 0
                anchors.left: menuBar.right
                anchors.leftMargin: 0
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
                anchors.top: pageContent.bottom
                anchors.topMargin: 0
            }

        }

    }


}




/*##^##
Designer {
    D{i:2;anchors_height:100}D{i:4;anchors_width:10}D{i:6;anchors_width:10}
}
##^##*/
