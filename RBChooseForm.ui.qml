import QtQuick 2.6
import QtQuick.Controls 2.2

Rectangle {
    property alias btnR: btnR
    property alias btnB: btnB
    id: rectangle
    width: 320
    height: 160
    color: "#f6f6f6"
    border.width: 10
    border.color: "#c62727"
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.verticalCenter: parent.verticalCenter

    Row {
        id: row
        width: 212
        height: 53
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        spacing: 12

        Button {
            id: btnR
            text: "选择红方"
            highlighted: true
            font.pointSize: 16
            font.bold: true
        }

        Button {
            id: btnB
            text: "选择黑方"
            highlighted: true
            font.bold: true
            font.pointSize: 16
        }
    }
}
