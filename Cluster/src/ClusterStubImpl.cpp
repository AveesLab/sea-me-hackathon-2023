#include "ClusterStubImpl.hpp"

ClusterStubImpl::ClusterStubImpl() { }
ClusterStubImpl::~ClusterStubImpl() { }

void ClusterStubImpl::updateSpeed(const std::shared_ptr<CommonAPI::ClientId> _client, int _accel, updateSpeedReply_t _reply) {
    std::cout << "accel : " << _accel << " \n";
    emit signalSpeed(_accel); // Emit the signal

    if (_accel >= 0 && _accel <= 100) {
        _reply(0);
    } else {
        _reply(-1);
    }
}

void ClusterStubImpl::updateRPM(const std::shared_ptr<CommonAPI::ClientId> _client, int _throttle, updateRPMReply_t _reply) {
     std::cout << "throtle : " << _throttle << " \n";
     emit signalRPM(_throttle); // Emit the signal

     if (_throttle >= 0 && _throttle <= 100) {
         _reply(0);
     } else {
         _reply(-1);
     }
}

void ClusterStubImpl::clickButtons(const std::shared_ptr<CommonAPI::ClientId> _client, std::string _command, clickButtonsReply_t _reply) {
     std::cout << "command : " << _command << " \n";
     emit signalButtons(_command); // Emit the signal

    _reply(_command);
}
