#ifndef FUELEFF_H
#define FUELEFF_H

#include <QObject>
#include <iostream>


#include <iostream>
#include <string>
#include <unistd.h>
#include <CommonAPI/CommonAPI.hpp>
#include <v1/commonapi/ClusterProxy.hpp>

using namespace v1_0::commonapi;

class FuelEff : public QObject
{
    Q_OBJECT

public:
    explicit FuelEff(QObject *parent = nullptr);
    std::shared_ptr < CommonAPI::Runtime > runtime;
    std::shared_ptr<ClusterProxy<>> myProxy;

public slots:
    void adjustFuelEff(int scrollValue);
};

#endif // FUELEFF_H
