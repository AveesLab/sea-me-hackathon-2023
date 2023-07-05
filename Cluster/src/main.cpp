#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "AccelOutput.h" // Include the new header
#include "OrderOutput.h"
#include "RpmOutput.h"
#include <qqml.h>

#include <iostream>
#include <thread>
#include <CommonAPI/CommonAPI.hpp>
#include "HackathonStubImpl.hpp"

#include "WeatherAPI.h"

using namespace std;

int main(int argc, char *argv[])
{
    std::shared_ptr<CommonAPI::Runtime> runtime = CommonAPI::Runtime::get();
    std::shared_ptr<HackathonStubImpl> myService =
        std::make_shared<HackathonStubImpl>();
    runtime->registerService("local", "test", myService);
    std::cout << "Successfully Registered Service!" << std::endl;

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    AccelOutput accelOutput; // Create an instance of ScrollOutput
    OrderOutput orderOutput;
    RpmOutput rpmOutput;
    // Create an instance of WeatherAPI
    WeatherAPI weatherAPI;

    qmlRegisterType<AccelOutput>("com.yourcompany.acceloutput", 1, 0, "AccelOutput"); // Register the new type
    qmlRegisterType<OrderOutput>("com.yourcompany.orderoutput", 1, 0, "OrderOutput"); // Register the new type
    qmlRegisterType<RpmOutput>("com.yourcompany.rpmoutput", 1, 0, "RpmOutput"); // Register the new type

    engine.rootContext()->setContextProperty("accelOutput", &accelOutput); // This line
    engine.rootContext()->setContextProperty("orderOutput", &orderOutput);
    engine.rootContext()->setContextProperty("rpmOutput", &rpmOutput);
    // Expose WeatherAPI instance to QML
    engine.rootContext()->setContextProperty("weatherAPI", &weatherAPI);
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&(*myService), &HackathonStubImpl::valueAccel, &accelOutput, &AccelOutput::adjustAccelValue); // Connect the instances
    QObject::connect(&(*myService), &HackathonStubImpl::valueOrder, &orderOutput, &OrderOutput::adjustOrderValue); // Connect the instances
    QObject::connect(&(*myService), &HackathonStubImpl::valueRpm, &rpmOutput, &RpmOutput::adjustRpmValue); // Connect the instances

    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);
    return app.exec();
}
