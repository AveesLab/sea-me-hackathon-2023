#ifndef RPM_H
#define RPM_H

#include <QObject>
#include <iostream>


#include <iostream>
#include <string>
#include <unistd.h>
#include <CommonAPI/CommonAPI.hpp>
#include <v1/commonapi/HackathonProxy.hpp>

using namespace v1_0::commonapi;

class Rpm : public QObject
{
    Q_OBJECT

public:
    explicit Rpm(QObject *parent = nullptr);
    std::shared_ptr < CommonAPI::Runtime > runtime;
        std::shared_ptr<HackathonProxy<>> myProxy;
signals:
    void rpmSizeChanged(int newSize);

public slots:
    void adjustRpmSize(int scrollValue);
};

#endif // RPM_H
