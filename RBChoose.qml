import QtQuick 2.6
import QtQuick.Window 2.3

Window {
    id: chooseRBWin
    title: qsTr("选择红黑")
    width: 400
    height: 200
    visible: true
    modality: Qt.ApplicationModal
    RBChooseForm {
        btnR.onClicked: {
            myLoader.myColor = "RED"
            chooseRBWin.close()
            myLoader.source = "PVE.qml"
        }
        btnB.onClicked: {
            myLoader.myColor = "BLACK"
            chooseRBWin.close()
            myLoader.source = "PVE.qml"
        }
    }
    onClosing: {myLoader.source=""}
}
