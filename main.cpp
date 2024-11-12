#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "vehicledata.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    VehicleData myVehicle; // object myVehicle of class VehicleData

    engine.rootContext()->setContextProperty("myVehicle", &myVehicle);
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("Project1_UI", "Main");

    return app.exec();
}
