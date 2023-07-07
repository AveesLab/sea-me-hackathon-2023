#include "RPM.h"

RPM::RPM(QObject *parent) : QObject(parent)
{
   runtime = CommonAPI::Runtime::get();
   myProxy = runtime->buildProxy<ClusterProxy>("local", "cluster_service");

    while (!myProxy->isAvailable())
        usleep(10);
}

void RPM::adjustRPM(int scrollValue)
{
    int result;
    CommonAPI::CallStatus callStatus;

    std::cout << "RPM : " << scrollValue << std::endl;
    myProxy->updateRPM(scrollValue, callStatus, result);
    std::cout << "Check error: '" << result << "'\n";
}
