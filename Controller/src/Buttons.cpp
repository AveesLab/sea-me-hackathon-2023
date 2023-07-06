#include "Buttons.h"

Buttons::Buttons(QObject *parent) : QObject(parent)
{
   runtime = CommonAPI::Runtime::get();
    myProxy = runtime->buildProxy<ClusterProxy>("local", "cluster_service");

    while (!myProxy->isAvailable())
        usleep(10);
}

void Buttons::adjustButtons(QString clickedButton)
{
    std::string result;
    CommonAPI::CallStatus callStatus;
    std::string clickedButtonStdString = clickedButton.toStdString();

    std::cout << "Click : " << clickedButtonStdString << std::endl;
    myProxy->clickButtons(clickedButtonStdString, callStatus, result);
    std::cout << "Check error: '" << result << "'\n";
}
