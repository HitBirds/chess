import QtQuick 2.6
import QtQuick.Window 2.3

Window {
    id: chooseRBWin
    title: qsTr("选择红黑")
    width: 400
    height: 400
    visible: true
    modality: Qt.ApplicationModal
    signal chooseColor(string msg)
    RBChooseForm {
        btnR.onClicked: {
            chooseRBWin.chooseColor("RED")
            chooseRBWin.close()
            myLoader.source = "PVE.qml"
        }
        btnB.onClicked: {
            chooseRBWin.chooseColor("BLACK")
            chooseRBWin.close()
            myLoader.source = "PVE.qml"
        }
    }
    onClosing: {myLoader.source=""}
}
