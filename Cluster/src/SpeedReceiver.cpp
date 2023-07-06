#include "SpeedReceiver.h"

SpeedReceiver::SpeedReceiver(QObject *parent) : QObject(parent)
{
}

void SpeedReceiver::receiveSpeed(int signal)
{
    qt_speedValue = signal;
    emit speedValueChanged();
}

