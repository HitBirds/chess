#include "boardviewcontrol.h"

BoardViewControl::BoardViewControl(QObject *parent) : QObject(parent)
{

}

void BoardViewControl::initChesses(const QString& c)
{
    initSettings();
    bool color = c=="RED";
    boardData.initBoardFromFile(color ? "E:\\QTprojs\\qtQuickChess\\bd_data\\defaultR.bd" : "E:\\QTprojs\\qtQuickChess\\bd_data\\defaultB.bd");
    myChessesMap = QVariant(boardData.myChessesMap);
    enemyChessesMap = QVariant(boardData.enemyChessesMap);
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
        if(mvChess(pos))
        {
            return rvEnemyChess(pos) ? 5 : 4;
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
    if(boardData.myChessesMap.contains(QString::number(pos)))return true;
    else return false;
}
bool BoardViewControl::mvChess(const int& pos)
{
    //按照象棋规则检查棋子是否可以移动，可以移动的话就修改myChessesMap里面preCheckedChess的位置
    //enemyChessesMap.toMap().contains(QString::number(preCheckedChess))
    QString k(preCheckedChess);
    boardData.myChessesMap.insert(QString::number(pos),boardData.myChessesMap[k]);
    boardData.myChessesMap.remove(k);
    boardData.bitBoard[preCheckedChess] = false;
    boardData.bitBoard[pos] = true;
    return true;
}
bool BoardViewControl::rvEnemyChess(const int& pos)
{
    //有敌方棋子的话就移走enemyChessesMap里的敌方棋子
    if(boardData.enemyChessesMap.remove(QString::number(pos)) == 1)
    {
        boardData.bitBoard[preCheckedChess] = false;
        return true;
    }
    else return false;
}
