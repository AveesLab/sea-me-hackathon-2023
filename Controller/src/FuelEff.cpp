#include "FuelEff.h"

FuelEff::FuelEff(QObject *parent) : QObject(parent)
{
    runtime = CommonAPI::Runtime::get();
    myProxy = runtime->buildProxy<ClusterProxy>("local", "cluster_service");

    while (!myProxy->isAvailable())
        usleep(10);
}

void FuelEff::adjustFuelEff(int scrollValue)
{
    int result;
    CommonAPI::CallStatus callStatus;

    std::cout << "FuelEff : " << scrollValue << std::endl;
    myProxy->updateFuelEff(scrollValue, callStatus, result);
    std::cout << "Check error: '" << result << "'\n";
}
