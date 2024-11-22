#ifndef SYSTEM_H
#define SYSTEM_H

#include <QObject>

class System : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool carLocked READ getCarLocked WRITE setCarLocked NOTIFY carLockedChanged FINAL)
    Q_PROPERTY(int temprature READ getTemprature WRITE setTemprature NOTIFY tempratureChanged FINAL)
    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged FINAL)
    Q_PROPERTY(QString current_time READ getCurrentTime WRITE setCurrentTime NOTIFY currentTimeChanged FINAL)
public:
    explicit System(QObject *parent = nullptr);
    ~System();
private:
    bool _car_locked;
    int _temprature;

    QString _name;

    QString _current_time;
private:
    class QTimer*timer;
private:
    void updateTime();
signals:
    void carLockedChanged(bool);
    void tempratureChanged();

    void nameChanged();

    void currentTimeChanged();

public:
    bool getCarLocked();
    Q_INVOKABLE void setCarLocked(bool);

    int getTemprature() const;
    Q_INVOKABLE void setTemprature(int newTemprature);
    QString name() const;
    Q_INVOKABLE void setName(const QString &newName);
    QString getCurrentTime() const;
    void setCurrentTime(const QString &newCurrent_time);
};

#endif // SYSTEM_H
