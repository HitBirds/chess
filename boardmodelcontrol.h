#ifndef BOARDMODELCONTROL_H
#define BOARDMODELCONTROL_H

#include <QObject>
#include <QString>
#include <QFile>
#include <QVariant>
#include <QTextStream>
#include <QDir>
#include <QBitArray>
#include "chessstruct.h"
//负责保存载入玩家执子颜色、棋局的起始状态、最终状态、以及每一步移动
//负责将走法规则载入棋盘，方便判断减少计算
class BoardModelControl:public QObject
{
public:
    //false->BLACK true->TRUE
    bool myColor;
    QMap<QString,QVariant> myChessesMap;
    QMap<QString,QVariant> enemyChessesMap;
    //board data
    //chess_type {BLANK,RK,RS,RX,RM,RC,RP,RZ,BK,BS,BX,BM,BC,BP,BZ};
    //board_data人机对战评估函数使用
    QString board_data[BOARD_ROW*BOARD_COL];
    //bitBoard 走法产生快速索引
    QBitArray bitBoard;
public:
    void initBoardFromFile(const QString &filename="E:\\QTprojs\\qtQuickChess\\bd_data\\defaultB.bd");
    BoardModelControl(QObject* parent=nullptr);
    ~BoardModelControl();
    BoardModelControl(const BoardModelControl& b);
};

#endif // BOARDMODELCONTROL_H
