import QtQuick 2.0

Rectangle {
    anchors.fill: parent
    color: "black"
    height: icon.height ; width: icon.width

    Image {
        id: icon
        source: "marble.png"
        anchors.centerIn: parent
        fillMode: Image.PreserveAspectCrop
    }
}
