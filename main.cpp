/***************************************
* 
*  Couple App 
*  Astral Tech 2023
*
***************************************/

#include <iostream>
#include <string>
#include <QString>
#include <QDebug>
#include <QApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.addImportPath("/home/gabridc/Repositorio/Astral_Academy/medium/Components");
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    engine.load(url);

    return app.exec();
}