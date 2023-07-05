#ifndef ORDER_H
#define ORDER_H

#include <QObject>
#include <iostream>


#include <iostream>
#include <string>
#include <unistd.h>
#include <CommonAPI/CommonAPI.hpp>
#include <v1/commonapi/HackathonProxy.hpp>

using namespace v1_0::commonapi;

class Order : public QObject
{
    Q_OBJECT

public:
    explicit Order(QObject *parent = nullptr);
    std::shared_ptr < CommonAPI::Runtime > runtime;
        std::shared_ptr<HackathonProxy<>> myProxy;
signals:
    void orderChanged(int newSize);

public slots:
    void adjustOrder(int clicknum);
};

#endif // BUTTON_H
