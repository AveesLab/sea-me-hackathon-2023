#include "Accel.h"

Accel::Accel(QObject *parent) : QObject(parent)
{
    runtime = CommonAPI::Runtime::get();
    myProxy = runtime->buildProxy<HackathonProxy>("local", "test");

    std::cout << "Checking availability!" << std::endl;
    while (!myProxy->isAvailable())
        usleep(10);
    std::cout << "Available..." << std::endl;
}

void Accel::adjustAccelSize(int scrollValue)
{
    std::cout << "Accel(%) : " << scrollValue << std::endl;
    CommonAPI::CallStatus callStatus;
    int result;
    myProxy->accel(scrollValue, callStatus, result);
    std::cout << "Got result: '" << result << "'\n";
    emit accelSizeChanged(scrollValue);
}
