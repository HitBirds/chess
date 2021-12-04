import QtQuick 2.6
import QtQuick.Window 2.3
import QtQml.Models 2.3
import MyQmlChess 1.0

Window{
    id: chessWindow
    minimumHeight: 800
    minimumWidth: 1100
    visible: true
    title: qsTr("人机对战")
    PVEForm{
    }
    onClosing: {myLoader.source=""}
}

