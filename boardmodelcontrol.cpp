#include "boardmodelcontrol.h"

BoardModelControl::BoardModelControl(QObject *parent) : QObject(parent)
{
    bitBoard.resize(BOARD_ROW*BOARD_COL);
}

BoardModelControl::~BoardModelControl()
{

}

BoardModelControl::BoardModelControl(const BoardModelControl& b)
{

}

void BoardModelControl::initBoardFromFile(const QString &filename)
{
    QFile file(filename);
    if (!file.open(QIODevice::ReadOnly | QIODevice::Text))
        return;
    QTextStream in(&file);
    QString posesLine,typeLine;
    while (!in.atEnd()) {
        myColor = in.readLine()=="RED";
        posesLine = in.readLine();
        typeLine = in.readLine();
        //qDebug()<<line;
    }
    QStringList posesList = posesLine.split(QLatin1Char(' '));
    QStringList typeList = typeLine.split(QLatin1Char(' '));
    for(int i = 0;i<posesList.length();++i)
    {
        if(typeList[i][0] == 'R'){
            if(myColor)myChessesMap[posesList[i]]=typeList[i];
            else enemyChessesMap[posesList[i]]=typeList[i];
        }
        else
        {
            if(myColor)enemyChessesMap[posesList[i]]=typeList[i];
            else myChessesMap[posesList[i]]=typeList[i];
        }
        board_data[posesList[i].toInt()]=typeList[i];
        board_data[posesList[i].toInt()]=true;
    }
}
