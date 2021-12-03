import QtQuick 2.9
import QtQuick.Window 2.3

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("中国象棋")
    id: mainWin
    MainForm {
        id:mainForm
        Loader {
            id: myLoader
            property string myColor: "RED"
        }
        btnPVP.onClicked: {
            console.log("btnPVP clicked")
            myLoader.source = "RBChoose.qml"
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
        Connections {
                target: myLoader.item
                onChooseColor: myLoader.myColor=msg
        }
    }
}
