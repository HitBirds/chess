import QtQuick 2.9
import QtQuick.Window 2.3

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("中国象棋")
    id: mainWin
    MainForm {
        Loader {id: myLoader}
        btnPVP.onClicked: {
            console.log("btnPVP clicked")
        }
        btnPVE.onClicked: {
            console.log("btnPVE clicked")
            myLoader.source = "PVE.qml"
        }
        btnWatch.onClicked: {
            console.log("btnWatch clicked")
        }
        btnStudy.onClicked: {
            console.log("btnStudy clicked")
        }
        anchors.fill: parent
    }
}
