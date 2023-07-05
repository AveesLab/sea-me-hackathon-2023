#ifndef ORDEROUTPUT_H
#define ORDEROUTPUT_H

#include <QObject>
#include <iostream>

class OrderOutput : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int orderValue READ orderValue NOTIFY orderValueChanged)

public:
    explicit OrderOutput(QObject *parent = nullptr);
    int orderValue() const { return m_orderValue; }

signals:
    void orderValueChanged();

public slots:
    void adjustOrderValue(int dataSize);

private:
    int m_orderValue = 0;
};

#endif // BRAKEOUTPUT_H
