#include "boardviewcontrol.h"

BoardViewControl::BoardViewControl(QObject *parent) : QObject(parent)
{
    initSettings();
    boardData.initBoardFromFile();
    myChessesMap = boardData.myColor ? QVariant(boardData.RChessesMap) : QVariant(boardData.BChessesMap);
    enemyChessesMap = boardData.myColor ? QVariant(boardData.BChessesMap) : QVariant(boardData.RChessesMap);
    preCheckedChess = 0;
}

void BoardViewControl::initSettings(const QString &filename)
{
    QFile file(filename);
    if (!file.open(QIODevice::ReadOnly | QIODevice::Text))
        return;
    QTextStream in(&file);
    QString mapLine;
    QMap<QString,QVariant> t2i;
    while (!in.atEnd()) {
        mapLine = in.readLine();
        t2i[mapLine.split(QLatin1Char(','))[0]]=mapLine.split(QLatin1Char(','))[1];
        img2Type[mapLine.split(QLatin1Char(','))[1]]=mapLine.split(QLatin1Char(','))[0];
    }
    type2Img = QVariant(t2i);
}


void BoardViewControl::generalBitsBoard()
{

}

int BoardViewControl::actionJudge(const int& pos)
{
    //0:一次点击对方棋子 1:第一次点击且点的自己的棋子 2:第二次点自己的子且和上一次点击不同 3:第二次点击无法移动  4:第二次点击且能移动 5:第二次点击且吃子
    if(isFirstClick(pos))
    {
        return isMyChess(pos) ? 1 : 0;
    }
    else
    {
        if(isPrevMoveable(pos))
        {
            return isEnemyChess(pos) ? 5 : 4;
        }
        else
        {
            return (pos != preCheckedChess&&isMyChess(pos)) ? 2 : 3;
        }
    }
}


bool BoardViewControl::isFirstClick(const int& pos)
{
    if(preCheckedChess)return false;
    return true;
}
bool BoardViewControl::isMyChess(const int& pos)
{
    if(myChessesMap.toMap().contains(QString::number(pos)))return true;
    else return false;
}
bool BoardViewControl::isPrevMoveable(const int& curPos)
{
    QString cType = boardData.board_data[preCheckedChess];
    qDebug()<<cType;
    return true;
}
bool BoardViewControl::isEnemyChess(const int& pos)
{
    if(enemyChessesMap.toMap().contains(QString::number(pos)))return true;
    else return false;
}
