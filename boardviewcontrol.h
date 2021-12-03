#ifndef BOARDVIEWCONTROL_H
#define BOARDVIEWCONTROL_H

#include <QObject>
#include <QMap>
#include <QString>
#include <QVariant>
#include <QFile>
#include <QString>
#include <QTextStream>
#include <QDebug>
#include <QDir>
#include "boardmodelcontrol.h"

class BoardViewControl : public QObject
{
    Q_OBJECT
public:
    explicit BoardViewControl(QObject *parent = nullptr);
    //QML和C++通过QML engine交换
    //把QML数据传给C++类
    //判断用户点击动作合法性
    Q_INVOKABLE int actionJudge(const int&);
    Q_INVOKABLE void initChesses(const QString& c = "BLACK");
    //直接用MEMBER使chessesMap可以读写
    Q_PROPERTY(QVariant myChessesMap MEMBER myChessesMap NOTIFY myChessesChanged)
    Q_PROPERTY(QVariant enemyChessesMap MEMBER enemyChessesMap NOTIFY enemyChessesChanged)
    Q_PROPERTY(QVariant type2Img MEMBER type2Img NOTIFY type2ImgChanged)
    Q_PROPERTY(int preCheckedChess MEMBER preCheckedChess NOTIFY preCheckedChessChanged)
private:
    void setMyBoard(QVariant&);
    void initSettings(const QString &filename="E:\\QTprojs\\qtQuickChess\\settings\\chess2pic.dict");
    void generalBitsBoard();
    bool isFirstClick(const int&);
    bool isMyChess(const int&);
    bool mvChess(const int&);
    bool rvEnemyChess(const int&);
signals:
    void myChessesChanged();
    void enemyChessesChanged();
    void preCheckedChessChanged();
    void type2ImgChanged();
public slots:

private:
    BoardModelControl boardData;
    //key:value 棋子坐标(1-90):棋子类型(1-14)
    QVariant myChessesMap;
    QVariant enemyChessesMap;
    QVariant type2Img;
    QMap<QString,QString> img2Type;
    int preCheckedChess;
};

#endif // BOARDVIEWCONTROL_H
