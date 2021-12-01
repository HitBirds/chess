import QtQuick 2.6
import QtQuick.Controls 2.2

Rectangle {
    id: rectangle4
    width: 360
    height: 360
    property alias btnPVP: btnPVP
    property alias btnPVE: btnPVE
    property alias btnWatch: btnWatch
    property alias btnStudy: btnStudy
    border.color: "#25c825"

    Rectangle {
        id: rectangle
        width: 140
        height: 320
        color: "#8ab6da"
        border.width: 4
        border.color: "#167316"
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter

        Column {
            id: column
            x: 0
            y: 74
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            spacing: 17

            Button {
                id: btnPVP
                text: "联机对战"
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Button {
                id: btnPVE
                text: "人机对战"
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Button {
                id: btnWatch
                text: "在线观战"
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Button {
                id: btnStudy
                text: "复盘残局"
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Button {
                id: btnExit
                text: "退出"
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
    }
}
