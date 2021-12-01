#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "boardviewcontrol.h"
int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    qmlRegisterType<BoardViewControl>("MyQmlChess", 1, 0, "BoardViewControl");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
