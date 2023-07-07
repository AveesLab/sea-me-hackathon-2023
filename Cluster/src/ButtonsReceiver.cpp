#include "ButtonsReceiver.h"

ButtonsReceiver::ButtonsReceiver(QObject *parent) : QObject(parent)
{
}

void ButtonsReceiver::receiveButtons(std::string command)
{
    qt_buttons = QString::fromStdString(command);
    emit buttonsValueChanged();
}

