#ifndef BUTTONS_H
#define BUTTONS_H

#include <QObject>
#include <iostream>


#include <iostream>
#include <string>
#include <unistd.h>
#include <CommonAPI/CommonAPI.hpp>
#include <v1/commonapi/ClusterProxy.hpp>

using namespace v1_0::commonapi;

class Buttons : public QObject
{
    Q_OBJECT

public:
    explicit Buttons(QObject *parent = nullptr);
    std::shared_ptr < CommonAPI::Runtime > runtime;
    std::shared_ptr<ClusterProxy<>> myProxy;

public slots:
    void adjustButtons(QString clickedButton);
};

#endif // BUTTONS_H
