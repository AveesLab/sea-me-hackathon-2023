#include <iostream>
#include <string>
#include <unistd.h>
#include <CommonAPI/CommonAPI.hpp>
#include <v1/commonapi/HackathonProxy.hpp>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "Accel.h"
#include "Order.h"
#include "Rpm.h"
#include <qqml.h>

using namespace v1_0::commonapi;

int main(int argc, char *argv[]) {
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    qmlRegisterType<Accel>("com.yourcompany.accel", 1, 0, "Accel");
    qmlRegisterType<Order>("com.yourcompany.order", 1, 0, "Order");
    qmlRegisterType<Rpm>("com.yourcompany.rpm", 1, 0, "Rpm");

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;





    return app.exec();
}

