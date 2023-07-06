#ifndef SPEEDRECEIVER_H
#define SPEEDRECEIVER_H

#include <QObject>
#include <iostream>

class SpeedReceiver : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int speedValue READ speedValue NOTIFY speedValueChanged)

public:
    explicit SpeedReceiver(QObject *parent = nullptr);
    int speedValue() const { return qt_speedValue; }

signals:
    void speedValueChanged();

public slots:
    void receiveSpeed(int signal);

private:
    int qt_speedValue = 0;
};

#endif // SPEEDRECEIVER_H
