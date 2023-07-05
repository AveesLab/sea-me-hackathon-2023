#include "RpmOutput.h"

RpmOutput::RpmOutput(QObject *parent) : QObject(parent)
{
}

void RpmOutput::adjustRpmValue(int dataSize)
{

    m_rpmValue = dataSize;
    std::cout << " RPM : " << m_rpmValue << std::endl;
    emit rpmValueChanged();
}

