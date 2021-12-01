import QtQuick 2.6
import QtQuick.Window 2.3
import QtQml.Models 2.3
import MyQmlChess 1.0

Window{
    id: chessWindow
    minimumHeight: 800
    minimumWidth: 1100
    visible: true
    PVEForm {
        id:pveform
        anchors.fill: parent

        property int gridH: mouseArea.height/10
        property int gridW : mouseArea.width/9

        ObjectModel {
            id: myChessModel
        }
        ObjectModel {
            id: enemyChessModel
        }
        function zoomOutImg(curChess)
        {
            var i=0;
            while(i<myChessModel.count)
            {
                if(curChess == myChessModel.get(i).name)
                {
                    myChessModel.get(i).scale=1.2;
                    break;
                }
                ++i;
            }
        }

        function restoreImg(curChess)
        {
            var i=0;
            while(i<myChessModel.count)
            {
                if(curChess == myChessModel.get(i).name)
                {
                    myChessModel.get(i).scale=1;
                    break;
                }
                ++i;
            }

        }

        function moveChess(f,t)
        {
        }

        function delChess(curChess)
        {
            var i=0;
            while(i<enemyChessModel.count)
            {
                if(curChess == enemyChessModel.get(i).name)
                {
                    enemyChessModel.remove(i,1);
                    break;
                }
                ++i;
            }

        }

        mouseArea.onClicked: {
            var x = Math.floor(mouse.x/gridW);
            var y = Math.floor(mouse.y/gridH);
            //console.log("mouse clicked at pos:"+mouse.x+"/"+gridW+" "+mouse.y+"/"+gridH+" "+x+" "+y);
            var curChess = y*9+x;
            var state = boardViewControl.actionJudge(curChess);
            console.log(state);
            switch(state){
                case 0:
                    break;
                case 1:
                    boardViewControl.preCheckedChess = curChess;
                    zoomOutImg(curChess);
                    break;
                case 2:
                    restoreImg(boardViewControl.preCheckedChess);
                    boardViewControl.preCheckedChess = curChess;
                    zoomOutImg(curChess);
                    break;
                case 3:
                    restoreImg(boardViewControl.preCheckedChess);
                    boardViewControl.preCheckedChess=0;
                    break;
                case 4:
                    moveChess(boardViewControl.preCheckedChess,curChess);
                    restoreImg(boardViewControl.preCheckedChess);
                    boardViewControl.preCheckedChess=0;
                    break;
                case 5:
                    moveChess(boardViewControl.preCheckedChess,curChess);
                    restoreImg(boardViewControl.preCheckedChess);
                    boardViewControl.preCheckedChess=0;
                    delChess(curChess);
                    break;
                default:break;
                }
            }
        function createImg(p,w,r){
            //console.log(chessWindow.height*0.0965)
            var c = parseInt(p,10);
            console.log(c);
            var y = (Math.floor(c/9)+0.5)*0.0935-0.039;
            var x = (c%9+0.5)*0.0965-0.039;
            var obj = Qt.createQmlObject("import QtQuick 2.0;
            Image { property int name:"+p+";
                    x: "+x+"*chessWindow.height;
                    y: "+y+"*chessWindow.height;
                    width:chessWindow.height*0.078;
                    height: width;
                    source: \"res/" + w + "\";
                    }",
                        mouseArea,"dynamicItem");
            if(r == 0)myChessModel.append(obj);
            else enemyChessModel.append(obj);
            }
        }
        BoardViewControl{
            id:boardViewControl
            Component.onCompleted: {
                var chessType;
                for (var key in myChessesMap) {
                    chessType = myChessesMap[key];
                    pveform.createImg(key,type2Img[chessType],0);
                }
                for (key in enemyChessesMap) {
                    chessType = enemyChessesMap[key];
                    pveform.createImg(key,type2Img[chessType],180);
                }
                //console.log(myChessModel.count);
                //console.log(enemyChessModel.count);
            }
        }
    onClosing: {myLoader.source=""}
}

