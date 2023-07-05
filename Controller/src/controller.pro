QT += quick
CONFIG += c++11

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0
INCLUDEPATH += ../src-gen-hack/
SOURCES += main.cpp \
    ../src-gen-hack/v1/commonapi/HackathonSomeIPDeployment.cpp \
    ../src-gen-hack/v1/commonapi/HackathonSomeIPProxy.cpp \
    ../src-gen-hack/v1/commonapi/HackathonSomeIPStubAdapter.cpp \
    Rpm.cpp \
    Accel.cpp \
    Order.cpp

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
    ../src-gen-hack/v1/commonapi/Hackathon.hpp \
    ../src-gen-hack/v1/commonapi/HackathonProxy.hpp \
    ../src-gen-hack/v1/commonapi/HackathonProxyBase.hpp \
    ../src-gen-hack/v1/commonapi/HackathonSomeIPDeployment.hpp \
    ../src-gen-hack/v1/commonapi/HackathonSomeIPProxy.hpp \
    ../src-gen-hack/v1/commonapi/HackathonSomeIPStubAdapter.hpp \
    ../src-gen-hack/v1/commonapi/HackathonStub.hpp \
    ../src-gen-hack/v1/commonapi/HackathonStubDefault.hpp \
    Rpm.h \
    Accel.h \
    Order.h

DISTFILES += \
    image/off.png \
    image/on.png \
    image/warn.png \
    image/warn1.png \
    image/weather.png \
    image/weather1.png
