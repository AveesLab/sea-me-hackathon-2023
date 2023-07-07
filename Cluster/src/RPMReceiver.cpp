#include "RPMReceiver.h"

RPMReceiver::RPMReceiver(QObject *parent) : QObject(parent)
{
}

void RPMReceiver::receiveRPM(int rpm)
{
    qt_rpmValue = rpm;
    emit rpmValueChanged();
}

