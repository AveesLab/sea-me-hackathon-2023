#include "AccelOutput.h"

AccelOutput::AccelOutput(QObject *parent) : QObject(parent)
{
}

void AccelOutput::adjustAccelValue(int dataSize)
{

    m_accelValue = dataSize;
    std::cout << " Velocity(km/h) : " << m_accelValue << std::endl;
    emit accelValueChanged();
}

