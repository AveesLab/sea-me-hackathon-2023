#include "Rpm.h"

Rpm::Rpm(QObject *parent) : QObject(parent)
{
   runtime = CommonAPI::Runtime::get();
    myProxy = runtime->buildProxy<HackathonProxy>("local", "test");

    while (!myProxy->isAvailable())
        usleep(10);
}

void Rpm::adjustRpmSize(int scrollValue)
{
    std::cout << "scroll : " << scrollValue << std::endl;
    CommonAPI::CallStatus callStatus;
    int result;
    myProxy->rpm(scrollValue, callStatus, result);
    std::cout << "Rpm: '" << result << "'\n";
    emit rpmSizeChanged(scrollValue);
}
