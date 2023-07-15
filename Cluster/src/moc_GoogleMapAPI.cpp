/****************************************************************************
** Meta object code from reading C++ file 'GoogleMapAPI.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.9.5)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "GoogleMapAPI.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'GoogleMapAPI.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.9.5. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_GoogleMapAPI_t {
    QByteArrayData data[7];
    char stringdata0[85];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_GoogleMapAPI_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_GoogleMapAPI_t qt_meta_stringdata_GoogleMapAPI = {
    {
QT_MOC_LITERAL(0, 0, 12), // "GoogleMapAPI"
QT_MOC_LITERAL(1, 13, 9), // "mapLoaded"
QT_MOC_LITERAL(2, 23, 0), // ""
QT_MOC_LITERAL(3, 24, 17), // "trackUserLocation"
QT_MOC_LITERAL(4, 42, 20), // "handlePositionUpdate"
QT_MOC_LITERAL(5, 63, 16), // "QGeoPositionInfo"
QT_MOC_LITERAL(6, 80, 4) // "info"

    },
    "GoogleMapAPI\0mapLoaded\0\0trackUserLocation\0"
    "handlePositionUpdate\0QGeoPositionInfo\0"
    "info"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_GoogleMapAPI[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       3,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       1,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    0,   29,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
       3,    0,   30,    2, 0x0a /* Public */,
       4,    1,   31,    2, 0x0a /* Public */,

 // signals: parameters
    QMetaType::Void,

 // slots: parameters
    QMetaType::Void,
    QMetaType::Void, 0x80000000 | 5,    6,

       0        // eod
};

void GoogleMapAPI::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        GoogleMapAPI *_t = static_cast<GoogleMapAPI *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->mapLoaded(); break;
        case 1: _t->trackUserLocation(); break;
        case 2: _t->handlePositionUpdate((*reinterpret_cast< const QGeoPositionInfo(*)>(_a[1]))); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            typedef void (GoogleMapAPI::*_t)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&GoogleMapAPI::mapLoaded)) {
                *result = 0;
                return;
            }
        }
    }
}

const QMetaObject GoogleMapAPI::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_GoogleMapAPI.data,
      qt_meta_data_GoogleMapAPI,  qt_static_metacall, nullptr, nullptr}
};


const QMetaObject *GoogleMapAPI::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *GoogleMapAPI::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_GoogleMapAPI.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int GoogleMapAPI::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 3)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 3;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 3)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 3;
    }
    return _id;
}

// SIGNAL 0
void GoogleMapAPI::mapLoaded()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
