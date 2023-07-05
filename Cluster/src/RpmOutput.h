#ifndef RPMOUTPUT_H
#define RPMOUTPUT_H

#include <QObject>
#include <iostream>

class RpmOutput : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int rpmValue READ rpmValue NOTIFY rpmValueChanged)

public:
    explicit RpmOutput(QObject *parent = nullptr);
    int rpmValue() const { return m_rpmValue; }

signals:
    void rpmValueChanged();

public slots:
    void adjustRpmValue(int dataSize);

private:
    int m_rpmValue = 0;
};

#endif // RPMOUTPUT_H
