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
    myProxy->order(clicknum, callStatus, result);
<<<<<<< HEAD
    std::cout << "Order: '" << result << "'\n";
=======
    std::cout << "Button: '" << result << "'\n";
>>>>>>> c1af1eb92b0bd10d67e29aebbbbc01437f4f0c84
    emit orderChanged(clicknum);
}
