#include "Speed.h"

Speed::Speed(QObject *parent) : QObject(parent)
{
    runtime = CommonAPI::Runtime::get();
    myProxy = runtime->buildProxy<ClusterProxy>("local", "cluster_service");

    while (!myProxy->isAvailable())
        usleep(10);
}

void Speed::adjustSpeed(int scrollValue)
{
    int result;
    CommonAPI::CallStatus callStatus;

    std::cout << "Accel(%) : " << scrollValue << std::endl;
    myProxy->updateSpeed(scrollValue, callStatus, result);
    std::cout << "Got result: '" << result << "'\n";
}
