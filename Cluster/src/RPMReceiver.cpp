#include "RPMReceiver.h"

RPMReceiver::RPMReceiver(QObject *parent) : QObject(parent)
{
}

void RPMReceiver::receiveRPM(int signal)
{
    qt_rpmValue = signal;
    emit rpmValueChanged();
}

