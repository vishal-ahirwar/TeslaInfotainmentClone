#include "system.h"

System::System(QObject *parent)
    : QObject{parent},_car_locked{false},_temprature{65},_name{"Default"}
{}

bool System::getCarLocked()
{
    return _car_locked;
}

void System::setCarLocked(bool status)
{
    if(_car_locked==status)return;
    _car_locked=status;
    emit carLockedChanged(_car_locked);
}

int System::getTemprature() const
{
    return _temprature;
}

void System::setTemprature(int newTemprature)
{
    if (_temprature == newTemprature)
        return;
    _temprature = newTemprature;
    emit tempratureChanged();
}

QString System::name() const
{
    return _name;
}

void System::setName(const QString &newName)
{
    if (_name == newName)
        return;
    _name = newName;
    emit nameChanged();
}
