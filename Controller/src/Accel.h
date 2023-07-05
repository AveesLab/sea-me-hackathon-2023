#ifndef ACCEL_H
#define ACCEL_H

#include <QObject>
#include <iostream>


#include <iostream>
#include <string>
#include <unistd.h>
#include <CommonAPI/CommonAPI.hpp>
#include <v1/commonapi/HackathonProxy.hpp>

using namespace v1_0::commonapi;

class Accel : public QObject
{
    Q_OBJECT

public:
    explicit Accel(QObject *parent = nullptr);
    std::shared_ptr < CommonAPI::Runtime > runtime;
        std::shared_ptr<HackathonProxy<>> myProxy;
signals:
    void accelSizeChanged(int newSize);

public slots:
    void adjustAccelSize(int scrollValue);
};

#endif // ACCEL_H
