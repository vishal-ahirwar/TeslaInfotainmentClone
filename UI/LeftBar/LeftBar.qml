import QtQuick 2.15

Rectangle
{

    color:"white"
    anchors
    {
        left:parent.left
        right:rightBar.left
        bottom:bottomBar.top
        top:parent.top
    }
    Image
    {
        source:"qrc:/UI/Assets/tesla.jpg"
        anchors.centerIn:parent
        fillMode:Image.PreserveAspectFit
        width:parent.width*0.95

    }
}
