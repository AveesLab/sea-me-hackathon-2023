#ifndef ACCELOUTPUT_H
#define ACCELOUTPUT_H

#include <QObject>
#include <iostream>

class AccelOutput : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int accelValue READ accelValue NOTIFY accelValueChanged)

public:
    explicit AccelOutput(QObject *parent = nullptr);
    int accelValue() const { return m_accelValue; }

signals:
    void accelValueChanged();

public slots:
    void adjustAccelValue(int dataSize);

private:
    int m_accelValue = 0;
};

#endif // ACCELOUTPUT_H
