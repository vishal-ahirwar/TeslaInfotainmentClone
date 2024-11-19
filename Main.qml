import QtQuick
import "UI/BottomBar"
import "UI/LeftBar"
import "UI/RightBar"
Window {
    width: 1200
    height: 680
    visible: true
    title: qsTr("Tesla Infotainment")
    BottomBar
    {
        id:bottomBar
    }
    LeftBar
    {
        id:leftBar
    }
    RightBar
    {
        id:rightBar
    }

}
