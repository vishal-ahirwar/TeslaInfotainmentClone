#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include<Controllers/system.h>
#include<QQmlContext>

#define DEFAULT_NAME "Vicked Knight"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    System system;
    system.setName(DEFAULT_NAME);

    engine.rootContext()->setContextProperty("systemHandler",&system);

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("TeslaInfotainmentClone", "Main");

    return app.exec();
}
