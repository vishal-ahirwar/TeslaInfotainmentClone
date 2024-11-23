import QtQuick 2.15

Rectangle
{
    radius:8
    color:"white"
    required property string placeHolderText
    signal submit(string input)
    Image
    {
        id:searchIcon
        anchors
        {
            left:parent.left
            verticalCenter:parent.verticalCenter
            margins:25
        }
        source:"qrc:/UI/Assets/search-interface-symbol-black.png"
        width:parent.height*0.45
        fillMode:Image.PreserveAspectFit
    }
    Text
    {

        text:textInput.text.length==0?parent.placeHolderText:""
        font.pixelSize:18
        font.bold:true
        anchors
        {
            left:searchIcon.right
            verticalCenter:parent.verticalCenter
            margins:25
        }
        verticalAlignment:Text.AlignVCenter
        horizontalAlignment:Text.AlignHCenter
    }

    TextInput
    {
        id:textInput
        anchors
        {
            left:searchIcon.right
            right:parent.right
            verticalCenter:parent.verticalCenter
            margins:25
        }
        font.pixelSize:18
        font.bold:true
        clip:true
        onAccepted:
        {
            submit(text)
            text=""
        }
    }

}
