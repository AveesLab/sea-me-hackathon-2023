#include "OrderOutput.h"

OrderOutput::OrderOutput(QObject *parent) : QObject(parent)
{
}

void OrderOutput::adjustOrderValue(int dataSize)
{

    m_orderValue = dataSize;
    std::cout << " OrderSignal : " << m_orderValue << std::endl;
    emit orderValueChanged();
}

