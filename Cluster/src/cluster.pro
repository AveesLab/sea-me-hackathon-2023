QT += quick
CONFIG += c++11
QT += multimedia
QT += network
# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0
INCLUDEPATH += ../../src-gen-cluster/
SOURCES += main.cpp \
    ../../src-gen-cluster/v1/commonapi/ClusterSomeIPDeployment.cpp \
    ../../src-gen-cluster/v1/commonapi/ClusterSomeIPProxy.cpp \
    ../../src-gen-cluster/v1/commonapi/ClusterSomeIPStubAdapter.cpp \
    WeatherAPI.cpp \
    ClusterStubImpl.cpp \
    ButtonsReceiver.cpp \
    SpeedReceiver.cpp \
    RPMReceiver.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../../build-commonapi/capicxx-core-runtime/build/release/ -lCommonAPI
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../../build-commonapi/capicxx-core-runtime/build/debug/ -lCommonAPI
else:unix: LIBS += -L$$PWD/../../../build-commonapi/capicxx-core-runtime/build/ -lCommonAPI

INCLUDEPATH += $$PWD/../../../build-commonapi/capicxx-core-runtime/include
DEPENDPATH += $$PWD/../../../build-commonapi/capicxx-core-runtime/include

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../../build-commonapi/capicxx-someip-runtime/build/release/ -lCommonAPI-SomeIP
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../../build-commonapi/capicxx-someip-runtime/build/debug/ -lCommonAPI-SomeIP
else:unix: LIBS += -L$$PWD/../../../build-commonapi/capicxx-someip-runtime/build/ -lCommonAPI-SomeIP

INCLUDEPATH += $$PWD/../../../build-commonapi/capicxx-someip-runtime/include
DEPENDPATH += $$PWD/../../../build-commonapi/capicxx-someip-runtime/include

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../../build-commonapi/vsomeip/build/release/ -lvsomeip3
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../../build-commonapi/vsomeip/build/debug/ -lvsomeip3
else:unix: LIBS += -L$$PWD/../../../build-commonapi/vsomeip/build/ -lvsomeip3

INCLUDEPATH += $$PWD/../../../build-commonapi/vsomeip/interface
DEPENDPATH += $$PWD/../../../build-commonapi/vsomeip/interface

HEADERS += \
    ../../src-gen-cluster/v1/commonapi/Cluster.hpp \
    ../../src-gen-cluster/v1/commonapi/ClusterProxy.hpp \
    ../../src-gen-cluster/v1/commonapi/ClusterProxyBase.hpp \
    ../../src-gen-cluster/v1/commonapi/ClusterSomeIPDeployment.hpp \
    ../../src-gen-cluster/v1/commonapi/ClusterSomeIPProxy.hpp \
    ../../src-gen-cluster/v1/commonapi/ClusterSomeIPStubAdapter.hpp \
    ../../src-gen-cluster/v1/commonapi/ClusterStub.hpp \
    ../../src-gen-cluster/v1/commonapi/ClusterStubDefault.hpp \
    WeatherAPI.h \
    ClusterStubImpl.hpp \
    ButtonsReceiver.h \
    RPMReceiver.h \
    SpeedReceiver.h
