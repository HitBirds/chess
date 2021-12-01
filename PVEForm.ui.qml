import QtQuick 2.3
import QtQuick.Controls 2.2

Item {
    id: item1
    property alias mouseArea: mouseArea
    property alias imgBoard: imgBoard
    Row {
        id: row
        height: item1.height
        layoutDirection: Qt.LeftToRight
        width: height * 0.917 + chatRoom.width
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 22

        Rectangle {
            id: boardRect
            height: row.height
            color: "#28dc04"
            anchors.verticalCenter: parent.verticalCenter
            width: height * 0.917
            Image {
                id: imgBoard
                height: parent.height * 0.90
                width: parent.width * 0.90
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                fillMode: Image.Stretch
                source: "res/board1.jpg"
                MouseArea {
                    id: mouseArea
                    width: parent.width * 1.053
                    height: parent.height * 1.043
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
        }
        Rectangle {
            id: chatRoom
            width: 300
            height: row.height
            color: "#ffff00"
            anchors.verticalCenter: parent.verticalCenter

            Column {
                id: column
                anchors.fill: parent
                spacing: 10
                Button {
                    id: reload
                    text: "重新开始"
                }
                Button {
                    id: regret
                    text: "悔棋"
                }
            }
        }
    }
}
