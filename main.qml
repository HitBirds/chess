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
            myLoader.source = "PVE.qml"
        }
        btnPVE.onClicked: {
            myLoader.source = "RBChoose.qml"
        }
        btnWatch.onClicked: {
        }
        btnStudy.onClicked: {
        }
        anchors.fill: parent
    }
}
