/*
 * This file was generated by the CommonAPI Generators.
 * Used org.genivi.commonapi.someip 3.2.0.v202012010944.
 * Used org.franca.core 0.13.1.201807231814.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0.
 * If a copy of the MPL was not distributed with this file, You can obtain one at
 * http://mozilla.org/MPL/2.0/.
 */
#include <v1/commonapi/ClusterSomeIPProxy.hpp>

#if !defined (COMMONAPI_INTERNAL_COMPILATION)
#define COMMONAPI_INTERNAL_COMPILATION
#define HAS_DEFINED_COMMONAPI_INTERNAL_COMPILATION_HERE
#endif

#include <CommonAPI/SomeIP/AddressTranslator.hpp>

#if defined (HAS_DEFINED_COMMONAPI_INTERNAL_COMPILATION_HERE)
#undef COMMONAPI_INTERNAL_COMPILATION
#undef HAS_DEFINED_COMMONAPI_INTERNAL_COMPILATION_HERE
#endif

namespace v1 {
namespace commonapi {

std::shared_ptr<CommonAPI::SomeIP::Proxy> createClusterSomeIPProxy(
    const CommonAPI::SomeIP::Address &_address,
    const std::shared_ptr<CommonAPI::SomeIP::ProxyConnection> &_connection) {
    return std::make_shared< ClusterSomeIPProxy>(_address, _connection);
}

void initializeClusterSomeIPProxy() {
    CommonAPI::SomeIP::AddressTranslator::get()->insert(
        "local:commonapi.Cluster:v1_0:cluster_service",
        0x1234, 0x5678, 1, 0);
    CommonAPI::SomeIP::Factory::get()->registerProxyCreateMethod(
        "commonapi.Cluster:v1_0",
        &createClusterSomeIPProxy);
}

INITIALIZER(registerClusterSomeIPProxy) {
    CommonAPI::SomeIP::Factory::get()->registerInterface(initializeClusterSomeIPProxy);
}

ClusterSomeIPProxy::ClusterSomeIPProxy(
    const CommonAPI::SomeIP::Address &_address,
    const std::shared_ptr<CommonAPI::SomeIP::ProxyConnection> &_connection)
        : CommonAPI::SomeIP::Proxy(_address, _connection)
{
}

ClusterSomeIPProxy::~ClusterSomeIPProxy() {
    completed_.set_value();
}



void ClusterSomeIPProxy::updateSpeed(int32_t _speed, CommonAPI::CallStatus &_internalCallStatus, int32_t &_status, const CommonAPI::CallInfo *_info) {
    CommonAPI::Deployable< int32_t, CommonAPI::SomeIP::IntegerDeployment<int32_t>> deploy_speed(_speed, static_cast< CommonAPI::SomeIP::IntegerDeployment<int32_t>* >(nullptr));
    CommonAPI::Deployable< int32_t, CommonAPI::SomeIP::IntegerDeployment<int32_t>> deploy_status(static_cast< CommonAPI::SomeIP::IntegerDeployment<int32_t>* >(nullptr));
    CommonAPI::SomeIP::ProxyHelper<
        CommonAPI::SomeIP::SerializableArguments<
            CommonAPI::Deployable<
                int32_t,
                CommonAPI::SomeIP::IntegerDeployment<int32_t>
            >
        >,
        CommonAPI::SomeIP::SerializableArguments<
            CommonAPI::Deployable<
                int32_t,
                CommonAPI::SomeIP::IntegerDeployment<int32_t>
            >
        >
    >::callMethodWithReply(
        *this,
        CommonAPI::SomeIP::method_id_t(0x7b),
        false,
        false,
        (_info ? _info : &CommonAPI::SomeIP::defaultCallInfo),
        deploy_speed,
        _internalCallStatus,
        deploy_status);
    _status = deploy_status.getValue();
}

std::future<CommonAPI::CallStatus> ClusterSomeIPProxy::updateSpeedAsync(const int32_t &_speed, UpdateSpeedAsyncCallback _callback, const CommonAPI::CallInfo *_info) {
    CommonAPI::Deployable< int32_t, CommonAPI::SomeIP::IntegerDeployment<int32_t>> deploy_speed(_speed, static_cast< CommonAPI::SomeIP::IntegerDeployment<int32_t>* >(nullptr));
    CommonAPI::Deployable< int32_t, CommonAPI::SomeIP::IntegerDeployment<int32_t>> deploy_status(static_cast< CommonAPI::SomeIP::IntegerDeployment<int32_t>* >(nullptr));
    return CommonAPI::SomeIP::ProxyHelper<
        CommonAPI::SomeIP::SerializableArguments<
            CommonAPI::Deployable<
                int32_t,
                CommonAPI::SomeIP::IntegerDeployment<int32_t>
            >
        >,
        CommonAPI::SomeIP::SerializableArguments<
            CommonAPI::Deployable<
                int32_t,
                CommonAPI::SomeIP::IntegerDeployment<int32_t>
            >
        >
    >::callMethodAsync(
        *this,
        CommonAPI::SomeIP::method_id_t(0x7b),
        false,
        false,
        (_info ? _info : &CommonAPI::SomeIP::defaultCallInfo),
        deploy_speed,
        [_callback] (CommonAPI::CallStatus _internalCallStatus, CommonAPI::Deployable< int32_t, CommonAPI::SomeIP::IntegerDeployment<int32_t> > _status) {
            if (_callback)
                _callback(_internalCallStatus, _status.getValue());
        },
        std::make_tuple(deploy_status));
}

void ClusterSomeIPProxy::updateRPM(int32_t _rpm, CommonAPI::CallStatus &_internalCallStatus, int32_t &_status, const CommonAPI::CallInfo *_info) {
    CommonAPI::Deployable< int32_t, CommonAPI::SomeIP::IntegerDeployment<int32_t>> deploy_rpm(_rpm, static_cast< CommonAPI::SomeIP::IntegerDeployment<int32_t>* >(nullptr));
    CommonAPI::Deployable< int32_t, CommonAPI::SomeIP::IntegerDeployment<int32_t>> deploy_status(static_cast< CommonAPI::SomeIP::IntegerDeployment<int32_t>* >(nullptr));
    CommonAPI::SomeIP::ProxyHelper<
        CommonAPI::SomeIP::SerializableArguments<
            CommonAPI::Deployable<
                int32_t,
                CommonAPI::SomeIP::IntegerDeployment<int32_t>
            >
        >,
        CommonAPI::SomeIP::SerializableArguments<
            CommonAPI::Deployable<
                int32_t,
                CommonAPI::SomeIP::IntegerDeployment<int32_t>
            >
        >
    >::callMethodWithReply(
        *this,
        CommonAPI::SomeIP::method_id_t(0x7c),
        false,
        false,
        (_info ? _info : &CommonAPI::SomeIP::defaultCallInfo),
        deploy_rpm,
        _internalCallStatus,
        deploy_status);
    _status = deploy_status.getValue();
}

std::future<CommonAPI::CallStatus> ClusterSomeIPProxy::updateRPMAsync(const int32_t &_rpm, UpdateRPMAsyncCallback _callback, const CommonAPI::CallInfo *_info) {
    CommonAPI::Deployable< int32_t, CommonAPI::SomeIP::IntegerDeployment<int32_t>> deploy_rpm(_rpm, static_cast< CommonAPI::SomeIP::IntegerDeployment<int32_t>* >(nullptr));
    CommonAPI::Deployable< int32_t, CommonAPI::SomeIP::IntegerDeployment<int32_t>> deploy_status(static_cast< CommonAPI::SomeIP::IntegerDeployment<int32_t>* >(nullptr));
    return CommonAPI::SomeIP::ProxyHelper<
        CommonAPI::SomeIP::SerializableArguments<
            CommonAPI::Deployable<
                int32_t,
                CommonAPI::SomeIP::IntegerDeployment<int32_t>
            >
        >,
        CommonAPI::SomeIP::SerializableArguments<
            CommonAPI::Deployable<
                int32_t,
                CommonAPI::SomeIP::IntegerDeployment<int32_t>
            >
        >
    >::callMethodAsync(
        *this,
        CommonAPI::SomeIP::method_id_t(0x7c),
        false,
        false,
        (_info ? _info : &CommonAPI::SomeIP::defaultCallInfo),
        deploy_rpm,
        [_callback] (CommonAPI::CallStatus _internalCallStatus, CommonAPI::Deployable< int32_t, CommonAPI::SomeIP::IntegerDeployment<int32_t> > _status) {
            if (_callback)
                _callback(_internalCallStatus, _status.getValue());
        },
        std::make_tuple(deploy_status));
}

void ClusterSomeIPProxy::updateFuelEff(int32_t _fueleff, CommonAPI::CallStatus &_internalCallStatus, int32_t &_status, const CommonAPI::CallInfo *_info) {
    CommonAPI::Deployable< int32_t, CommonAPI::SomeIP::IntegerDeployment<int32_t>> deploy_fueleff(_fueleff, static_cast< CommonAPI::SomeIP::IntegerDeployment<int32_t>* >(nullptr));
    CommonAPI::Deployable< int32_t, CommonAPI::SomeIP::IntegerDeployment<int32_t>> deploy_status(static_cast< CommonAPI::SomeIP::IntegerDeployment<int32_t>* >(nullptr));
    CommonAPI::SomeIP::ProxyHelper<
        CommonAPI::SomeIP::SerializableArguments<
            CommonAPI::Deployable<
                int32_t,
                CommonAPI::SomeIP::IntegerDeployment<int32_t>
            >
        >,
        CommonAPI::SomeIP::SerializableArguments<
            CommonAPI::Deployable<
                int32_t,
                CommonAPI::SomeIP::IntegerDeployment<int32_t>
            >
        >
    >::callMethodWithReply(
        *this,
        CommonAPI::SomeIP::method_id_t(0x7e),
        false,
        false,
        (_info ? _info : &CommonAPI::SomeIP::defaultCallInfo),
        deploy_fueleff,
        _internalCallStatus,
        deploy_status);
    _status = deploy_status.getValue();
}

std::future<CommonAPI::CallStatus> ClusterSomeIPProxy::updateFuelEffAsync(const int32_t &_fueleff, UpdateFuelEffAsyncCallback _callback, const CommonAPI::CallInfo *_info) {
    CommonAPI::Deployable< int32_t, CommonAPI::SomeIP::IntegerDeployment<int32_t>> deploy_fueleff(_fueleff, static_cast< CommonAPI::SomeIP::IntegerDeployment<int32_t>* >(nullptr));
    CommonAPI::Deployable< int32_t, CommonAPI::SomeIP::IntegerDeployment<int32_t>> deploy_status(static_cast< CommonAPI::SomeIP::IntegerDeployment<int32_t>* >(nullptr));
    return CommonAPI::SomeIP::ProxyHelper<
        CommonAPI::SomeIP::SerializableArguments<
            CommonAPI::Deployable<
                int32_t,
                CommonAPI::SomeIP::IntegerDeployment<int32_t>
            >
        >,
        CommonAPI::SomeIP::SerializableArguments<
            CommonAPI::Deployable<
                int32_t,
                CommonAPI::SomeIP::IntegerDeployment<int32_t>
            >
        >
    >::callMethodAsync(
        *this,
        CommonAPI::SomeIP::method_id_t(0x7e),
        false,
        false,
        (_info ? _info : &CommonAPI::SomeIP::defaultCallInfo),
        deploy_fueleff,
        [_callback] (CommonAPI::CallStatus _internalCallStatus, CommonAPI::Deployable< int32_t, CommonAPI::SomeIP::IntegerDeployment<int32_t> > _status) {
            if (_callback)
                _callback(_internalCallStatus, _status.getValue());
        },
        std::make_tuple(deploy_status));
}


void ClusterSomeIPProxy::clickButtons(std::string _command, CommonAPI::CallStatus &_internalCallStatus, int32_t &_status, const CommonAPI::CallInfo *_info) {
    CommonAPI::Deployable< std::string, CommonAPI::SomeIP::StringDeployment> deploy_command(_command, static_cast< CommonAPI::SomeIP::StringDeployment* >(nullptr));
    CommonAPI::Deployable< int32_t, CommonAPI::SomeIP::IntegerDeployment<int32_t>> deploy_status(static_cast< CommonAPI::SomeIP::IntegerDeployment<int32_t>* >(nullptr));
    CommonAPI::SomeIP::ProxyHelper<
        CommonAPI::SomeIP::SerializableArguments<
            CommonAPI::Deployable<
                std::string,
                CommonAPI::SomeIP::StringDeployment
            >
        >,
        CommonAPI::SomeIP::SerializableArguments<
            CommonAPI::Deployable<
                int32_t,
                CommonAPI::SomeIP::IntegerDeployment<int32_t>
            >
        >
    >::callMethodWithReply(
        *this,
        CommonAPI::SomeIP::method_id_t(0x7d),
        false,
        false,
        (_info ? _info : &CommonAPI::SomeIP::defaultCallInfo),
        deploy_command,
        _internalCallStatus,
        deploy_status);
    _status = deploy_status.getValue();
}

std::future<CommonAPI::CallStatus> ClusterSomeIPProxy::clickButtonsAsync(const std::string &_command, ClickButtonsAsyncCallback _callback, const CommonAPI::CallInfo *_info) {
    CommonAPI::Deployable< std::string, CommonAPI::SomeIP::StringDeployment> deploy_command(_command, static_cast< CommonAPI::SomeIP::StringDeployment* >(nullptr));
    CommonAPI::Deployable< int32_t, CommonAPI::SomeIP::IntegerDeployment<int32_t>> deploy_status(static_cast< CommonAPI::SomeIP::IntegerDeployment<int32_t>* >(nullptr));
    return CommonAPI::SomeIP::ProxyHelper<
        CommonAPI::SomeIP::SerializableArguments<
            CommonAPI::Deployable<
                std::string,
                CommonAPI::SomeIP::StringDeployment
            >
        >,
        CommonAPI::SomeIP::SerializableArguments<
            CommonAPI::Deployable<
                int32_t,
                CommonAPI::SomeIP::IntegerDeployment<int32_t>
            >
        >
    >::callMethodAsync(
        *this,
        CommonAPI::SomeIP::method_id_t(0x7d),
        false,
        false,
        (_info ? _info : &CommonAPI::SomeIP::defaultCallInfo),
        deploy_command,
        [_callback] (CommonAPI::CallStatus _internalCallStatus, CommonAPI::Deployable< int32_t, CommonAPI::SomeIP::IntegerDeployment<int32_t> > _status) {
            if (_callback)
                _callback(_internalCallStatus, _status.getValue());
        },
        std::make_tuple(deploy_status));
}

void ClusterSomeIPProxy::getOwnVersion(uint16_t& ownVersionMajor, uint16_t& ownVersionMinor) const {
    ownVersionMajor = 1;
    ownVersionMinor = 0;
}

std::future<void> ClusterSomeIPProxy::getCompletionFuture() {
    return completed_.get_future();
}

} // namespace commonapi
} // namespace v1
