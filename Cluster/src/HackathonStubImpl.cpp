#include "HackathonStubImpl.hpp"

HackathonStubImpl::HackathonStubImpl() { }
HackathonStubImpl::~HackathonStubImpl() { }

void HackathonStubImpl::accel(const std::shared_ptr<CommonAPI::ClientId> _client,
    int _value, accelReply_t _reply) {
        int result = _value * 2.6;
        std::cout << "accel(" << _value << "): '" << result << "'\n";
        emit valueAccel(result); // Emit the signal with the result

    _reply(result);

};

void HackathonStubImpl::button(const std::shared_ptr<CommonAPI::ClientId> _client,
    int _value, buttonReply_t _reply) {
        int result = _value;
        std::cout << "button(" << _value << "): '" << result << "'\n";
        emit valueButton(result); // Emit the signal with the result

    _reply(result);

};

void HackathonStubImpl::rpm(const std::shared_ptr<CommonAPI::ClientId> _client,
    int _value, rpmReply_t _reply) {
        int result = _value * 2.6;
        std::cout << "rpm(" << _value << "): '" << result << "'\n";
        emit valueRpm(result); // Emit the signal with the result

    _reply(result);

};
