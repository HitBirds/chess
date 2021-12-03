import QtQuick 2.6
import QtQuick.Controls 2.2

Item {
    id: item2
    width: 400
    height: 400
    property alias btnR: btnR
    property alias btnB: btnB
    Rectangle {
        id: rectangle
        x: 100
        y: 90
        width: 318
        height: 156
        color: "#f6f6f6"
        border.width: 10
        border.color: "#c62727"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        Row {
            id: row
            width: 200
            height: 61
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
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
}
