import QtQuick 2.15
import QtLocation
import QtPositioning

Rectangle
{

    Map {
        Plugin {
            id: mapPlugin
            name:"osm"
        }
        WheelHandler {
                   id: wheel
                   // workaround for QTBUG-87646 / QTBUG-112394 / QTBUG-112432:
                   // Magic Mouse pretends to be a trackpad but doesn't work with PinchHandler
                   // and we don't yet distinguish mice and trackpads on Wayland either
                   acceptedDevices: Qt.platform.pluginName === "cocoa" || Qt.platform.pluginName === "wayland"
                                    ? PointerDevice.Mouse | PointerDevice.TouchPad
                                    : PointerDevice.Mouse
                   rotationScale: 1/120
                   property: "zoomLevel"
               }
               DragHandler {
                   id: drag
                   target: null
                   onTranslationChanged: (delta) => map.pan(-delta.x, -delta.y)
               }
               Shortcut {
                   enabled: map.zoomLevel < map.maximumZoomLevel
                   sequence: StandardKey.ZoomIn
                   onActivated: map.zoomLevel = Math.round(map.zoomLevel + 1)
               }
               Shortcut {
                   enabled: map.zoomLevel > map.minimumZoomLevel
                   sequence: StandardKey.ZoomOut
                   onActivated: map.zoomLevel = Math.round(map.zoomLevel - 1)
               }
            id: map
            anchors.fill: parent
            plugin: mapPlugin
            center: QtPositioning.coordinate(20.59, 78.96) // Oslo
            zoomLevel: 7
            property geoCoordinate startCentroid

            PinchHandler {
                id: pinch
                target: null
                onActiveChanged: if (active) {
                    map.startCentroid = map.toCoordinate(pinch.centroid.position, false)
                }
                onScaleChanged: (delta) => {
                    map.zoomLevel += Math.log2(delta)
                    map.alignCoordinateToPoint(map.startCentroid, pinch.centroid.position)
                }
                onRotationChanged: (delta) => {
                    map.bearing -= delta
                    map.alignCoordinateToPoint(map.startCentroid, pinch.centroid.position)
                }
                grabPermissions: PointerHandler.TakeOverForbidden
            }
    }
    Row
    {   anchors
        {
            top:parent.top
            left:parent.left
            margins:25
        }
        width: parent.width*0.2

        spacing: 25
        Image {
            id: lockIcon
            source: systemHandler.carLocked? "qrc:/UI/Assets/lock.png":"qrc:/UI/Assets/unlock.png"
            width:parent.width/8
            fillMode: Image.PreserveAspectFit
            verticalAlignment: Image.AlignVCenter
            MouseArea
            {
                anchors.fill: parent
                onClicked:
                {
                    systemHandler.setCarLocked(!systemHandler.carLocked)
                }
            }
        }

        Text
        {
            text:systemHandler.temprature
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
            height: lockIcon.height
        }

        Text
        {
            text:systemHandler.name
            font.pixelSize: 18
            verticalAlignment: Text.AlignVCenter

        }
    }


    anchors
    {
        right:parent.right
        top:parent.top
        bottom:bottomBar.top
    }
    width:parent.width*0.7
}
