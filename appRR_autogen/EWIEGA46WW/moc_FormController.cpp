/****************************************************************************
** Meta object code from reading C++ file 'FormController.h'
**
** Created by: The Qt Meta Object Compiler version 69 (Qt 6.11.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../../FormController.h"
#include <QtCore/qmetatype.h>

#include <QtCore/qtmochelpers.h>

#include <memory>


#include <QtCore/qxptype_traits.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'FormController.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 69
#error "This file was generated using the moc from 6.11.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

#ifndef Q_CONSTINIT
#define Q_CONSTINIT
#endif

QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
QT_WARNING_DISABLE_GCC("-Wuseless-cast")
namespace {
struct qt_meta_tag_ZN14FormControllerE_t {};
} // unnamed namespace

template <> constexpr inline auto FormController::qt_create_metaobjectdata<qt_meta_tag_ZN14FormControllerE_t>()
{
    namespace QMC = QtMocConstants;
    QtMocHelpers::StringRefStorage qt_stringData {
        "FormController",
        "rModelChanged",
        "",
        "fModelChanged",
        "boardChanged",
        "solveStatusChanged",
        "build",
        "rCount",
        "fCount",
        "getRValues",
        "QVariantList",
        "getFValues",
        "isValid",
        "processCounts",
        "r",
        "f",
        "rValues",
        "fValues",
        "rModel",
        "fModel",
        "boardModel",
        "boardWidth",
        "boardHeight",
        "solveStatus"
    };

    QtMocHelpers::UintData qt_methods {
        // Signal 'rModelChanged'
        QtMocHelpers::SignalData<void()>(1, 2, QMC::AccessPublic, QMetaType::Void),
        // Signal 'fModelChanged'
        QtMocHelpers::SignalData<void()>(3, 2, QMC::AccessPublic, QMetaType::Void),
        // Signal 'boardChanged'
        QtMocHelpers::SignalData<void()>(4, 2, QMC::AccessPublic, QMetaType::Void),
        // Signal 'solveStatusChanged'
        QtMocHelpers::SignalData<void()>(5, 2, QMC::AccessPublic, QMetaType::Void),
        // Method 'build'
        QtMocHelpers::MethodData<void(int, int)>(6, 2, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::Int, 7 }, { QMetaType::Int, 8 },
        }}),
        // Method 'getRValues'
        QtMocHelpers::MethodData<QVariantList() const>(9, 2, QMC::AccessPublic, 0x80000000 | 10),
        // Method 'getFValues'
        QtMocHelpers::MethodData<QVariantList() const>(11, 2, QMC::AccessPublic, 0x80000000 | 10),
        // Method 'isValid'
        QtMocHelpers::MethodData<bool() const>(12, 2, QMC::AccessPublic, QMetaType::Bool),
        // Method 'processCounts'
        QtMocHelpers::MethodData<void(int, int, QStringList, QStringList)>(13, 2, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::Int, 14 }, { QMetaType::Int, 15 }, { QMetaType::QStringList, 16 }, { QMetaType::QStringList, 17 },
        }}),
    };
    QtMocHelpers::UintData qt_properties {
        // property 'rModel'
        QtMocHelpers::PropertyData<QVariantList>(18, 0x80000000 | 10, QMC::DefaultPropertyFlags | QMC::EnumOrFlag, 0),
        // property 'fModel'
        QtMocHelpers::PropertyData<QVariantList>(19, 0x80000000 | 10, QMC::DefaultPropertyFlags | QMC::EnumOrFlag, 1),
        // property 'boardModel'
        QtMocHelpers::PropertyData<QVariantList>(20, 0x80000000 | 10, QMC::DefaultPropertyFlags | QMC::EnumOrFlag, 2),
        // property 'boardWidth'
        QtMocHelpers::PropertyData<int>(21, QMetaType::Int, QMC::DefaultPropertyFlags, 2),
        // property 'boardHeight'
        QtMocHelpers::PropertyData<int>(22, QMetaType::Int, QMC::DefaultPropertyFlags, 2),
        // property 'solveStatus'
        QtMocHelpers::PropertyData<QString>(23, QMetaType::QString, QMC::DefaultPropertyFlags, 3),
    };
    QtMocHelpers::UintData qt_enums {
    };
    return QtMocHelpers::metaObjectData<FormController, qt_meta_tag_ZN14FormControllerE_t>(QMC::MetaObjectFlag{}, qt_stringData,
            qt_methods, qt_properties, qt_enums);
}
Q_CONSTINIT const QMetaObject FormController::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_staticMetaObjectStaticContent<qt_meta_tag_ZN14FormControllerE_t>.stringdata,
    qt_staticMetaObjectStaticContent<qt_meta_tag_ZN14FormControllerE_t>.data,
    qt_static_metacall,
    nullptr,
    qt_staticMetaObjectRelocatingContent<qt_meta_tag_ZN14FormControllerE_t>.metaTypes,
    nullptr
} };

void FormController::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    auto *_t = static_cast<FormController *>(_o);
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: _t->rModelChanged(); break;
        case 1: _t->fModelChanged(); break;
        case 2: _t->boardChanged(); break;
        case 3: _t->solveStatusChanged(); break;
        case 4: _t->build((*reinterpret_cast<std::add_pointer_t<int>>(_a[1])),(*reinterpret_cast<std::add_pointer_t<int>>(_a[2]))); break;
        case 5: { QVariantList _r = _t->getRValues();
            if (_a[0]) *reinterpret_cast<QVariantList*>(_a[0]) = std::move(_r); }  break;
        case 6: { QVariantList _r = _t->getFValues();
            if (_a[0]) *reinterpret_cast<QVariantList*>(_a[0]) = std::move(_r); }  break;
        case 7: { bool _r = _t->isValid();
            if (_a[0]) *reinterpret_cast<bool*>(_a[0]) = std::move(_r); }  break;
        case 8: _t->processCounts((*reinterpret_cast<std::add_pointer_t<int>>(_a[1])),(*reinterpret_cast<std::add_pointer_t<int>>(_a[2])),(*reinterpret_cast<std::add_pointer_t<QStringList>>(_a[3])),(*reinterpret_cast<std::add_pointer_t<QStringList>>(_a[4]))); break;
        default: ;
        }
    }
    if (_c == QMetaObject::IndexOfMethod) {
        if (QtMocHelpers::indexOfMethod<void (FormController::*)()>(_a, &FormController::rModelChanged, 0))
            return;
        if (QtMocHelpers::indexOfMethod<void (FormController::*)()>(_a, &FormController::fModelChanged, 1))
            return;
        if (QtMocHelpers::indexOfMethod<void (FormController::*)()>(_a, &FormController::boardChanged, 2))
            return;
        if (QtMocHelpers::indexOfMethod<void (FormController::*)()>(_a, &FormController::solveStatusChanged, 3))
            return;
    }
    if (_c == QMetaObject::ReadProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast<QVariantList*>(_v) = _t->rModel(); break;
        case 1: *reinterpret_cast<QVariantList*>(_v) = _t->fModel(); break;
        case 2: *reinterpret_cast<QVariantList*>(_v) = _t->boardModel(); break;
        case 3: *reinterpret_cast<int*>(_v) = _t->boardWidth(); break;
        case 4: *reinterpret_cast<int*>(_v) = _t->boardHeight(); break;
        case 5: *reinterpret_cast<QString*>(_v) = _t->solveStatus(); break;
        default: break;
        }
    }
}

const QMetaObject *FormController::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *FormController::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_staticMetaObjectStaticContent<qt_meta_tag_ZN14FormControllerE_t>.strings))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int FormController::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 9)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 9;
    }
    if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 9)
            *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType();
        _id -= 9;
    }
    if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::BindableProperty
            || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 6;
    }
    return _id;
}

// SIGNAL 0
void FormController::rModelChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void FormController::fModelChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}

// SIGNAL 2
void FormController::boardChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 2, nullptr);
}

// SIGNAL 3
void FormController::solveStatusChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 3, nullptr);
}
QT_WARNING_POP
