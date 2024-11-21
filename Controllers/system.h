#ifndef SYSTEM_H
#define SYSTEM_H

#include <QObject>

class System : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool carLocked READ getCarLocked WRITE setCarLocked NOTIFY carLockedChanged FINAL)
    Q_PROPERTY(int temprature READ getTemprature WRITE setTemprature NOTIFY tempratureChanged FINAL)
    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged FINAL)
public:
    explicit System(QObject *parent = nullptr);
private:
    bool _car_locked;
    int _temprature;

    QString _name;

signals:
    void carLockedChanged(bool);
    void tempratureChanged();

    void nameChanged();

public:
    bool getCarLocked();
    Q_INVOKABLE void setCarLocked(bool);

    int getTemprature() const;
    Q_INVOKABLE void setTemprature(int newTemprature);
    QString name() const;
    Q_INVOKABLE void setName(const QString &newName);
};

#endif // SYSTEM_H
