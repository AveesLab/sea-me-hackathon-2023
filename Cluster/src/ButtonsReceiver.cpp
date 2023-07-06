#include "ButtonsReceiver.h"

ButtonsReceiver::ButtonsReceiver(QObject *parent) : QObject(parent)
{
}

void ButtonsReceiver::receiveButtons(std::string signal)
{
    qt_buttons = QString::fromStdString(signal);
    emit buttonsValueChanged();
}

