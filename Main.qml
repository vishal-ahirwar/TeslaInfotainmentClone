import QtQuick
import "UI/BottomBar"
import "UI/LeftBar"
import "UI/RightBar"

Window {
    width: 1200
    height: 680
    visible: true
    title: qsTr("Tesla Infotainment")
    visibility:Window.FullScreen
    Component.onCompleted:function()
    {
        showFullScreen()
    }

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
