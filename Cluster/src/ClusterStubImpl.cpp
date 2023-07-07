#include "ClusterStubImpl.hpp"

ClusterStubImpl::ClusterStubImpl() { }
ClusterStubImpl::~ClusterStubImpl() { }

void ClusterStubImpl::updateSpeed(const std::shared_ptr<CommonAPI::ClientId> _client, int _speed, updateSpeedReply_t _reply) {
    std::cout << "Speed : " << _speed << " \n";
    emit signalSpeed(_speed); // Emit the signal

    if (0 <= _speed && _speed <= 260) {
        _reply(0);
    } else {
        _reply(-1);
    }
}

void ClusterStubImpl::updateRPM(const std::shared_ptr<CommonAPI::ClientId> _client, int _rpm, updateRPMReply_t _reply) {
     std::cout << "RPM : " << _rpm << " \n";
     emit signalRPM(_rpm); // Emit the signal

     if (0 <= _rpm && _rpm <= 8000) {
         _reply(0);
     } else {
         _reply(-1);
     }
}

void ClusterStubImpl::clickButtons(const std::shared_ptr<CommonAPI::ClientId> _client, std::string _command, clickButtonsReply_t _reply) {
     std::cout << "command : " << _command << " \n";
     emit signalButtons(_command); // Emit the signal

    _reply(0);
}
