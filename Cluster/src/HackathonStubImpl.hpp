#ifndef HACKATHONSTUBIMPL_H_
#define HACKATHONSTUBIMPL_H_
#include <CommonAPI/CommonAPI.hpp>
#include <v1/commonapi/HackathonStubDefault.hpp>
#include <QObject>

class HackathonStubImpl: public QObject, public v1_0::commonapi::HackathonStubDefault {
    Q_OBJECT
public:
    HackathonStubImpl();
    virtual ~HackathonStubImpl();
    virtual void accel(const std::shared_ptr<CommonAPI::ClientId> _client,
        int _value, accelReply_t _return);
    virtual void order(const std::shared_ptr<CommonAPI::ClientId> _client,
        int _value, orderReply_t _return);
    virtual void rpm(const std::shared_ptr<CommonAPI::ClientId> _client,
        int _value, rpmReply_t _return);
signals:
    void valueAccel(int);
    void valueOrder(int);
    void valueRpm(int);
};
#endif /* HACKATHONSTUBIMPL_H_ */
