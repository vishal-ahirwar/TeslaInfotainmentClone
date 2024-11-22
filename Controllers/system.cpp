#include "system.h"
#include<QTimer>
#include<QTime>

System::System(QObject *parent)
    : QObject{parent},_car_locked{false},_temprature{65},_name{"Default"},_current_time{"00:00"}
{
    timer=new QTimer();
    timer->setInterval(1000);
    connect(timer,&QTimer::timeout,this,&System::updateTime);
    timer->start();
}
System::~System()
{
    delete timer;
}
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

QString System::getCurrentTime() const
{
    return _current_time;
}

void System::setCurrentTime(const QString &newCurrent_time)
{
    if (_current_time == newCurrent_time)
        return;
    _current_time = newCurrent_time;
    emit currentTimeChanged();
}

void System::updateTime()
{
    auto time=QDateTime::currentDateTime().time();
    setCurrentTime(time.toString("h:map"));
}
