import QtQuick 2.15


Rectangle
{
    color:"black"
    anchors{
        left:parent.left
        right:parent.right
        bottom:parent.bottom
    }
    height:parent.height/12
        Image
        {
            anchors
            {
                left:parent.left
                verticalCenter:parent.verticalCenter
                margins:10
            }

            source:"qrc:/UI/Assets/car-icon.png"
            fillMode:Image.PreserveAspectFit
            height:parent.height*0.5

        }



}
