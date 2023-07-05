#include "Order.h"

Order::Order(QObject *parent) : QObject(parent)
{
   runtime = CommonAPI::Runtime::get();
    myProxy = runtime->buildProxy<HackathonProxy>("local", "test");

    while (!myProxy->isAvailable())
        usleep(10);
}

void Order::adjustOrder(int clicknum)
{
    std::cout << "Click : " << clicknum << std::endl;
    CommonAPI::CallStatus callStatus;
    int result;
    myProxy->button(clicknum, callStatus, result);
    std::cout << "Button: '" << result << "'\n";
    emit orderChanged(clicknum);
}
