import QtQuick 2.12
import QtQuick.Controls 2.12
Button {
    id: customBtn
    property color colorDefault: "#1c1d20"
    property color colorMouseOver: "#23272E"
    property color colorPressed: "#00a1f1"
    property url btnIconSource: "../../images/svg/s_toggle.svg"
    QtObject{
        id:internal
        property var dynamicColor: if(customBtn.down){
                                       customBtn.down ? colorPressed:colorDefault
                                   }else{
                                       customBtn.hovered ? colorMouseOver:colorDefault
                                   }
    }
    implicitWidth: 70
    implicitHeight: 70
    background: Rectangle{
        id:bgbtn
        color: internal.dynamicColor

    }
    Image {
        id: imgBtn
        x: 86
        y: 5
        width: 10
        height: 10

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        source: btnIconSource
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
