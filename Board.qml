import QtQuick 2.6
import QtQuick.Window 2.3
import QtQml.Models 2.3
import MyQmlChess 1.0

BoardForm {
        id:boardform
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
            var c = t;
            var y = (Math.floor(c/9)+0.5)*0.0935-0.039;
            var x = (c%9+0.5)*0.0965-0.039;
            var i=0;
            while(i<myChessModel.count)
            {
                if(f == myChessModel.get(i).name)
                {
                    myChessModel.get(i).x=Qt.binding(function() { return x*chessWindow.height });
                    myChessModel.get(i).y=Qt.binding(function() { return y*chessWindow.height });
                    myChessModel.get(i).name = t;
                    myChessModel.get(i).scale = 1;
                    break;
                }
                ++i;
            }
        }

        function delChess(curChess)
        {
            var i=0;
            while(i<enemyChessModel.count)
            {
                if(curChess == enemyChessModel.get(i).name)
                {
                    enemyChessModel.get(i).destroy();
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
                    boardViewControl.preCheckedChess=0;
                    break;
                case 5:
                    moveChess(boardViewControl.preCheckedChess,curChess);
                    delChess(curChess);
                    boardViewControl.preCheckedChess=0;
                    break;
                default:break;
                }
            }
        function createImg(p,w,r){
            //console.log(chessWindow.height*0.0965)
            var c = parseInt(p,10);
            //console.log(c);
            var y = (Math.floor(c/9)+0.5)*0.0935-0.039;
            var x = (c%9+0.5)*0.0965-0.039;
            var obj = Qt.createQmlObject("import QtQuick 2.0;
            Image { property int name:"+p+";
                    x: "+x+"*chessWindow.height;
                    y: "+y+"*chessWindow.height;
                    width:chessWindow.height*0.078;
                    height: width;
                    source: \"res/" + w + "\";
                    Behavior on x {PropertyAnimation{duration: 200;}}
                    Behavior on y {PropertyAnimation{duration : 200;}}
                    }",
                        mouseArea,"dynamicItem");
            if(r == 0)myChessModel.append(obj);
            else enemyChessModel.append(obj);
            }

        BoardViewControl{
            id:boardViewControl
            Component.onCompleted: {
                boardViewControl.initChesses(myLoader.myColor);
                var chessType;
                for (var key in myChessesMap) {
                    chessType = myChessesMap[key];
                    boardform.createImg(key,type2Img[chessType],0);
                }
                for (key in enemyChessesMap) {
                    chessType = enemyChessesMap[key];
                    boardform.createImg(key,type2Img[chessType],180);
                }
            }
        }
}
